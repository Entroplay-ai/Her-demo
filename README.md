# Her Demo

Her currently has two public demo clients:

- `Web`
- `macOS`

Important: the web viewer and the macOS app are clients only. If you want live AI responses, hand `her-bridge` to whoever owns your OpenClaw backend, have them connect it to OpenClaw, then pair Her to the tunnel URL that `her-bridge` prints.

`iOS`, `iPad`, and `iWatch` are still in testing.

## What You Need

Before expecting the demo to talk to your AI backend, prepare:

- an OpenClaw Gateway you can reach
- a valid OpenClaw gateway token
- a machine where you can run `her-bridge`
- optional tunnel credentials if you want remote pairing from web or macOS

This demo repo does not bundle `her-bridge` or an OpenClaw server for you. The bridge has to be set up on the backend side.

## Use The Web Demo

1. Open the hosted Her demo page in your browser.
2. Click `Launch Web Demo`.
3. Wait for the avatar scene to load.
4. When `Connect to Bridge` appears, paste the `wss://...` tunnel URL printed by `her-bridge`.
5. Press `Connect`.
6. After the status changes to `Connected`, use text chat, voice input, or video mode.

Without a bridge connection, the web viewer can still load the avatar and interface, but it will not talk to your OpenClaw backend.

## Connect To Your Own OpenClaw Backend

Give `her-bridge/` to the person or machine that owns your OpenClaw backend. On that backend machine, run:

```bash
npm install
npx tsx src/index.ts setup
```

During setup, enter:

- `OpenClaw gateway URL`
- `OpenClaw gateway token`
- `Tunnel API URL` and `Invite code` if you want remote web/macOS pairing

Then start the bridge:

```bash
npx tsx src/index.ts start
```

When the bridge is ready, it prints:

- `Tunnel URL: wss://...`

Use that value to pair the web viewer or the macOS app.

## Use The macOS Demo

1. Open the latest release:
   - https://github.com/Entroplay-ai/Her-demo/releases/latest
2. Download `HerMac-v0.1.0-demo.zip`.
3. Unzip it.
4. Open `HerMac.app`.
5. Pair it with the same `wss://...` tunnel URL from `her-bridge`.

The app may ask for microphone permission for voice input and camera permission for video mode.

If macOS blocks the app on first launch:

1. Open `System Settings`
2. Go to `Privacy & Security`
3. Find the warning about `HerMac.app`
4. Click `Open Anyway`
5. Launch the app again

## If Pairing Fails

- Make sure `npx tsx src/index.ts start` is still running.
- Make sure `her-bridge` successfully connected to your OpenClaw Gateway during setup and startup.
- Use the `wss://...` tunnel URL printed by the bridge, not `ws://127.0.0.1:8765`, when pairing from a remote browser or another machine.
- If the viewer disconnects later, reopen the bridge dialog and reuse the same tunnel URL.

## Platform Status

- `Web` demo is live
- `macOS` demo is live
- `iOS`, `iPad`, and `iWatch` are still in testing
