# NEUROGRIP H1 — AI-controlled bionic hand

Interactive project page for an EMG-controlled prosthetic hand running on an ESP32.
Built as a final year project demonstration.

**Live site:** https://USERNAME.github.io/REPO/

## What the page does

- **3D hand model** — five fingers, 11 articulating joints and thumb opposition, built
  procedurally in three.js. Drag to orbit, scroll to zoom.
- **Live grip control** — pick any of the seven grips and the hand moves to it, the EMG
  channel sliders travel to the muscle pattern that produces that grip, and the classifier
  confidence bars re-rank.
- **Simulated sEMG scope** — burst-modulated signal on two channels with the 200 ms analysis
  window marked. The MAV, RMS, zero-crossing and waveform-length readouts are computed from
  that buffer at 10 Hz, the same decision rate as the firmware.
- **Signal chain, on-device AI, hardware, firmware, specs, nerve-interface ladder and roadmap**
  as scrollable sections.

Signals on the page are simulated. The feature maths, window length, activation floor and
class set match the firmware.

## Files

| File | Purpose |
|---|---|
| `index.html` | The whole site — markup, CSS and JavaScript in one file. No build step. |
| `vendor/three.module.min.js` | Optional local copy of three.js. If present it is used; if absent the page falls back to the jsDelivr CDN. |

## Publishing to GitHub Pages

1. Create a repository and add `index.html` at its root.
2. Repository **Settings → Pages**.
3. Under **Build and deployment**, set *Source* to **Deploy from a branch**, branch `main`,
   folder `/ (root)`, then **Save**.
4. Wait about a minute, then open `https://USERNAME.github.io/REPO/`.

### Making it work without internet

The 3D view needs three.js. To bundle it so the page works on a machine with no network:

```bash
mkdir -p vendor
curl -L -o vendor/three.module.min.js \
  https://cdn.jsdelivr.net/npm/three@0.160.0/build/three.module.min.js
```

Commit the `vendor` folder. The page prefers the local copy automatically.

If WebGL is unavailable the 3D panel shows a static diagram instead and every other control
on the page keeps working.

## Tech

No framework, no build tooling, no dependencies beyond three.js r160. Single HTML file,
about 78 KB. Google Fonts (Archivo, IBM Plex Sans, IBM Plex Mono) load from the CDN.

## Status

Demonstration unit. Not a medical device.
