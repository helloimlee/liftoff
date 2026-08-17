#!/usr/bin/env python3
"""
Pull curated Pinterest boards into liftoff's Reference-Library as taste anchors.

WHAT THIS DOES NOT DO, and cannot:
  Pinterest's official v5 API has no public search endpoint. It reaches your own
  account only. There is no "find me inspiration about brutalist dashboards" call.
  This syncs boards YOU curated, which is the actual designer workflow anyway.

WHAT IT DELIBERATELY DOES NOT STORE:
  Pinterest's developer guidelines bar storing data pulled from their API beyond
  campaign analytics. So this writes source links plus a slot for YOUR note about
  why a pin is an anchor. It does not mirror images or cache pin metadata.
  Convenient side effect: a written reason is a better anchor than a saved image.

Setup:
  1. Pinterest business account, then create an app at developers.pinterest.com
  2. Scopes: boards:read, pins:read, user_accounts:read
  3. Trial access covers reads. Standard needs a video of the OAuth flow, even solo.
  4. export PINTEREST_TOKEN="..."   (Trial tokens expire in 24h)

Usage:
  ./pinterest-sync.py boards
  ./pinterest-sync.py pins <board_id> [--limit 25]
  ./pinterest-sync.py anchors <board_id> --tag "kelvos-motion" > entries.md
"""

import argparse
import json
import os
import sys
import urllib.error
import urllib.parse
import urllib.request

API = "https://api.pinterest.com/v5"


def call(path, params=None):
    token = os.environ.get("PINTEREST_TOKEN")
    if not token:
        sys.exit("PINTEREST_TOKEN is not set. See the setup notes at the top of this file.")
    url = f"{API}{path}"
    if params:
        url += "?" + urllib.parse.urlencode(params)
    req = urllib.request.Request(url, headers={
        "Authorization": f"Bearer {token}",
        "Content-Type": "application/json",
    })
    try:
        with urllib.request.urlopen(req, timeout=30) as r:
            return json.loads(r.read())
    except urllib.error.HTTPError as e:
        body = e.read().decode("utf-8", "replace")[:500]
        if e.code == 401:
            sys.exit("401. Token expired or wrong scopes. Trial tokens last 24h.")
        if e.code == 429:
            sys.exit("429. Rate limited. Pinterest caps per endpoint category.")
        sys.exit(f"HTTP {e.code}: {body}")
    except urllib.error.URLError as e:
        sys.exit(f"Network error: {e.reason}")


def paginate(path, params=None, limit=100):
    params = dict(params or {})
    params["page_size"] = min(limit, 100)
    items, cursor = [], None
    while len(items) < limit:
        if cursor:
            params["bookmark"] = cursor
        data = call(path, params)
        batch = data.get("items", [])
        if not batch:
            break
        items.extend(batch)
        cursor = data.get("bookmark")
        if not cursor:
            break
    return items[:limit]


def cmd_boards(args):
    boards = paginate("/boards", limit=args.limit)
    if not boards:
        print("No boards returned. Check that the token's account owns boards.")
        return
    for b in boards:
        print(f"{b.get('id','?'):<24} {b.get('name','(untitled)'):<40} "
              f"{b.get('pin_count', 0):>5} pins")


def cmd_pins(args):
    pins = paginate(f"/boards/{args.board_id}/pins", limit=args.limit)
    for p in pins:
        print(f"{p.get('id','?'):<24} {(p.get('title') or p.get('alt_text') or '(untitled)')[:60]}")


def cmd_anchors(args):
    """Emit Reference-Library.md entry stubs. Links and empty note slots only."""
    pins = paginate(f"/boards/{args.board_id}/pins", limit=args.limit)
    board = call(f"/boards/{args.board_id}")
    print(f"## Anchors from: {board.get('name','(untitled board)')}")
    print(f"<!-- tag: {args.tag} | synced from Pinterest board {args.board_id} -->")
    print()
    print("Fill the 'Why' line on each. An anchor with no stated reason is a mood board,")
    print("and liftoff already has enough of those.")
    print()
    for p in pins:
        title = (p.get("title") or p.get("alt_text") or "Untitled pin").strip()
        link = p.get("link") or f"https://pinterest.com/pin/{p.get('id','')}/"
        print(f"### {title}")
        print(f"- Source: {link}")
        print(f"- Why it is an anchor: ")
        print(f"- Applies to: ")
        print()


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)

    b = sub.add_parser("boards", help="list your boards and their IDs")
    b.add_argument("--limit", type=int, default=50)
    b.set_defaults(func=cmd_boards)

    p = sub.add_parser("pins", help="list pins on a board")
    p.add_argument("board_id")
    p.add_argument("--limit", type=int, default=25)
    p.set_defaults(func=cmd_pins)

    a = sub.add_parser("anchors", help="emit Reference-Library entry stubs")
    a.add_argument("board_id")
    a.add_argument("--tag", default="untagged")
    a.add_argument("--limit", type=int, default=25)
    a.set_defaults(func=cmd_anchors)

    args = ap.parse_args()
    args.func(args)


if __name__ == "__main__":
    main()
