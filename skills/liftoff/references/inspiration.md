# Sourcing inspiration

How outside reference gets into a liftoff run without turning into a second, competing taste system.

## The one rule

`Reference-Library.md` is the taste anchor system. It already exists, impeccable already reads it, and it is the thing standing between a build and a generated-looking result. Every inspiration source feeds that file. None of them replace it, sit beside it, or get read directly by the produce stage.

This is the same test that got Design DNA rejected: a new source earns a slot by covering ground nothing else covers, and it routes through the existing system rather than forking it.

## Pinterest, honestly

Pinterest is a good fit for the way MaxQ already works, and a worse fit than it looks for the way the API works. Three constraints, all load-bearing, all worth knowing before anyone builds against it.

**There is no public search.** The official v5 API reaches the authenticated account and nothing else. There is no endpoint that answers "show me brutalist dashboard layouts." Anything promising global Pinterest search is a third-party scraper sitting outside the official API, with the terms-of-service exposure that implies. So the integration cannot be "go find inspiration." It can only be "read the boards Lee already curated."

That is less of a downgrade than it sounds. The curation is the valuable part. A board Lee pinned to over eight months is a far better taste signal than whatever a keyword search surfaces today, and it is already how designers use the product.

**Storage is restricted.** Pinterest's developer guidelines bar retaining data pulled from the API beyond campaign analytics. So the sync does not mirror images and does not cache pin metadata. What lands in `Reference-Library.md` is the source link plus a note, written by a person, about why that pin is an anchor.

This constraint improves the output. "Grotesk at 96px against a warm neutral, the kerning is doing the work" is a usable instruction. A saved JPEG is a vibe. The API rule and good practice point the same direction here, which almost never happens, so take the win.

**Trial tokens expire in 24 hours.** Reads work on Trial access. Standard access needs a video recording of the OAuth flow, required even when you are the only intended user. For a sync that runs occasionally and by hand, Trial is fine. For anything scheduled, budget for the review.

## How it runs

Two paths. Use the first one.

### Path 1: Zapier (recommended)

Pinterest is a Zapier app, and Zapier is already a connected MCP server. Authorize once at the Pinterest app-auth URL and the token problem disappears: no developer app to register, no business-account requirement of your own, no 24-hour Trial token expiry, no video-recorded OAuth review for Standard access.

Zapier exposes exactly two Pinterest actions, `create_pin` and `_zap_raw_request`. There are **zero** search actions, which is Zapier independently confirming the no-public-search finding above.

`_zap_raw_request` is the useful one. It is an authenticated passthrough to the Pinterest API, so the reads work through it:

```
GET https://api.pinterest.com/v5/boards
GET https://api.pinterest.com/v5/boards/{board_id}/pins
```

Verified working 2026-07-27, connected and returning live data:

```json
{
  "selected_api": "PinterestCLIAPI",
  "action": "_zap_raw_request",
  "params": {
    "method": "GET",
    "url": "https://api.pinterest.com/v5/boards",
    "fail_on_errors": "true",
    "querystring": { "page_size": "25" }
  }
}
```

Note `fail_on_errors` is a **string** `"true"`, not a boolean, and it is required. Swap the URL for `/v5/boards/{board_id}/pins` to read a board. Zapier flattens the response, so a multi-board account may come back as the first item rather than the full array; page through with `bookmark` if the count looks short.

One caveat worth knowing before anyone budgets around it: Pinterest is a Zapier **Premium** app, so the connection may require a paid Zapier plan.

### Path 2: direct API (fallback)

`scripts/pinterest-sync.py`, for environments with no Zapier in the loop. Needs a Pinterest business account, an app registered at developers.pinterest.com, and scopes `boards:read`, `pins:read`, `user_accounts:read`.

```bash
export PINTEREST_TOKEN="..."          # Trial tokens expire in 24h
./pinterest-sync.py boards
./pinterest-sync.py pins <board_id>
./pinterest-sync.py anchors <board_id> --tag kelvos-motion >> Reference-Library.md
```

### What either path produces

`anchors` emits entry stubs with the source link filled and two lines blank: **why it is an anchor** and **what it applies to**. Those blanks are the point. An unfilled stub is a mood board entry, and the library is not a mood board. Fill them or delete the entry.

## Standing precondition: the boards have to exist

Checked on connection day: the account returned one board, `Profile`, with zero pins. The plumbing works and the reservoir is empty.

So this stage is a no-op until boards get curated, and that is fine. It should stay a no-op rather than degrade into scraping something else to fill the gap. When the classify pass finds no usable board, say so in one line and move on to the charter. An empty inspiration stage costs nothing. A fabricated one costs the taste anchor its credibility.

## Where it sits in the loop

Stage 0b, classify. When the ask is brand track, or product track with the direction unsettled, check whether a relevant board exists before chartering. If one does and the library has no anchors from it yet, sync it then, so the target gets written with the reference in view instead of retrofitted afterward.

Never during produce. An anchor arriving mid-build is a new opinion arriving mid-build, and that is how a design ends up as a committee of three references arguing.

## If global search ever becomes the requirement

Say so out loud rather than reaching for a scraper quietly. The options are third-party APIs that resell scraped Pinterest data, and they carry real terms-of-service and reliability exposure. That is a business decision about risk, not a technical detail to bury in a script.
