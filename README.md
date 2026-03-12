# Her Demo

Her is a multimodal AI companion with a 3D avatar body.

Right now the public demo is available in two ways:

- `Web` demo
- `macOS` demo

`iPhone` is still in development. Public iPhone testing will move to TestFlight after the Apple Developer / App Store Connect setup is ready.

## Start Here

### Web

If you already have the live demo page open:

1. Click `Launch Web Demo`
2. Wait for the avatar scene to load
3. Start chatting

What you can use in the web demo:

- text chat
- voice input
- video mode
- camera presets
- scene switching

### macOS

Download the latest Mac build here:

- https://github.com/Entroplay-ai/Her-demo/releases/latest

Then:

1. Download `HerMac-v0.1.0-demo.zip` from the latest release
2. Unzip it
3. Open `HerMac.app`

If macOS blocks the app on first launch:

1. Open `System Settings`
2. Go to `Privacy & Security`
3. Find the warning about `HerMac.app`
4. Click `Open Anyway`
5. Launch the app again

## How To Use The Demo

### In Web

When the viewer opens, you can:

- type in chat and press `Send`
- click the mic button for voice input
- click the camera button to turn on video mode
- change scenes or camera framing when those controls are available

If the demo asks you to connect a bridge:

1. Paste a `wss://...` tunnel URL, or a full `her://pair...` link
2. Press `Connect`
3. Wait until the status changes to `Connected`

If the bridge disconnects later, click the connection status chip and reconnect with the same tunnel URL or pairing link.

### In macOS

The Mac app is the same demo direction in native form. You can use it for:

- text chat
- voice mode
- video mode
- avatar and scene presentation

The app may ask for:

- microphone permission for voice input
- camera permission for video mode

If you do not want those features, you can deny the permission and still use text mode.

## What To Expect

- `Web` is the fastest way to try Her
- `macOS` is the better option if you want the native app feel
- `iPhone` is not public yet

Current iPhone status:

- still under development
- not on TestFlight yet
- waiting on Apple-side release workflow

## Known Notes

- The macOS demo may still be unsigned or not notarized, so first launch can trigger a security warning
- The web demo may ask you for microphone or camera access depending on which mode you use
- Some features depend on a working bridge/tunnel connection

## Release Links

- Latest release page: https://github.com/Entroplay-ai/Her-demo/releases/latest
- All releases: https://github.com/Entroplay-ai/Her-demo/releases
