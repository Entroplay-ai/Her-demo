# Her Demo

Public demo landing page for `Her`, designed to be deployed as a zero-build static site on Cloudflare Pages.

The page does three things:

- gives you a clean public-facing entry point for the project
- sends users to the bundled live web demo
- sends macOS users to the latest GitHub Release instead of storing binaries in the repo

The bundled viewer in `viewer/` currently tracks the main app's public demo surface:

- text chat, voice input, and realtime avatar lip sync
- `video mode` on web via camera snapshots sent to the bridge/backend
- the same camera preset UI used by the web/mac viewer shell
- static onboarding flows for local bridge pairing and remote tunnel pairing

## Files

- `index.html` - demo landing page
- `styles.css` - page styling and motion
- `site-config.js` - URLs for the live web demo and macOS download
- `assets/screenshots/` - static screenshots used by the page
- `viewer/` - compiled `vrm-viewer` build published as static assets
- `scripts/sync-viewer-build.sh` - copies a fresh `vrm-viewer/dist` into `viewer/`, with optional supplemental app assets like `audio/`

## Local Preview

```bash
python3 -m http.server 8000
```

Then open `http://localhost:8000`.

## Configure Links

Edit `site-config.js` if you need to override defaults:

```js
window.HER_DEMO_CONFIG = {
  liveDemoUrl: "./viewer/index.html",
  avatarBrowserUrl: "./viewer/avatar-browser.html",
  macDownloadUrl: "https://github.com/Entroplay-ai/Her-demo/releases/latest",
  sourceUrl: "https://github.com/Entroplay-ai/Her-demo",
};
```

Behavior:

- if `liveDemoUrl` is empty, the main web CTA stays disabled and points users to the notes section instead of a broken page
- `macDownloadUrl` should usually stay on `releases/latest` so you can publish new builds without editing the page each time

## Included Viewer Pages

The deployed site now includes these static viewer routes:

- `/viewer/index.html` - main Her web viewer
- `/viewer/avatar-browser.html` - avatar browser shell
- `/viewer/preview.html` - preview entry
- `/viewer/embed.html` - embed entry
- `/viewer/bgonly.html` - background-only entry

## Cloudflare Pages

This repo is intentionally zero-build at deploy time.

Recommended Pages settings:

- Framework preset: `None`
- Build command: leave blank
- Build output directory: `/`
- Root directory: leave blank

Deployment options:

1. Connect the repo with Cloudflare Pages Git integration.
2. Or drag and drop the repo contents with Direct Upload for a one-off release.

Git integration is the better long-term default because it keeps the demo page versioned and redeploys automatically on push.

## Updating the Viewer Build

Rebuild the source app in the main Her repo, then sync the static output here:

```bash
cd /path/to/Her/vrm-viewer
npm run build

cd /path/to/Her-demo
./scripts/sync-viewer-build.sh \
  /path/to/Her/vrm-viewer/dist \
  /path/to/Her/her-app/Shared/Resources/WebViewer
```

The sync script replaces `viewer/` with the latest compiled static build and overlays supplemental runtime assets that are shipped from the app bundle but not emitted by `vite build`.

## macOS Release Flow

Do not commit `.app`, `.zip`, or `.dmg` binaries into this repo.

Use GitHub Releases instead:

1. Create a new release, for example `v0.1.0-demo`
2. Build the mac app, for example:

```bash
xcodebuild \
  -project /path/to/Her/her-app/Her.xcodeproj \
  -scheme HerMac \
  -configuration Release \
  build
```

3. Upload the macOS build asset, usually a `.zip` or `.dmg`
4. Keep the page link pointed at:

```text
https://github.com/Entroplay-ai/Her-demo/releases/latest
```

That gives you a stable public download URL while preserving version history.

## Notes for Public Launch

- If the macOS build is unsigned or not notarized yet, say that clearly on the page and in the release notes.
- When the live web demo is ready, update `liveDemoUrl` in `site-config.js`.
- If you later move the public web demo to a separate app host, this landing page can stay on Pages and continue acting as the release surface.
