# LiveBoot WebUI Module

This repository is a fork of the original LiveBoot Magisk / KernelSU / APatch module, adapted to include a built-in WebUI interface for easier module configuration.

## Description

- A Magisk, KernelSU and APatch module that enables unix-style (verbose) boot animation for Android devices.
- Based on [Chainfire](https://github.com/Chainfire)'s [LiveBoot](https://github.com/Chainfire/liveboot) project.
- This fork keeps the original root-module functionality and adds a WebUI for configuration instead of relying only on manual file editing.

Preview: https://www.youtube.com/watch?v=N0tqzVWxpJk

## Why this fork exists

The upstream project is a root module that writes its settings to a plain text config file. This fork adds a lightweight web-based configuration page under the module's webroot so users can change options from a root manager or WebUI-compatible environment without editing the config manually.

## Supported devices & ROMs

It has been successfully tested on many Android 15, 14, 13 and 12 based ROMs. It should work on rooted devices using Magisk, KernelSU, or APatch.

## Install and use

1. Install the module in your root manager.
2. Open the WebUI of the module in your root manager or compatible WebUI app.
3. Adjust the boot animation settings in the page.
4. Copy or save the generated config content into the module's config file if your setup requires manual installation.

> Note: For Magisk-based setups, a compatible WebUI launcher such as KsuWebUI Standalone or WebUI X Portable may be needed to access the module's UI.

## WebUI configuration guide

The module still follows the original LiveBoot config format. The WebUI generates the same values that the root module expects.

### Supported options

- Background colors: blank (default gray), dark, transparent
- Logcat levels: V, D, I, W, E, F, S
- Logcat buffers: M, S, R, E, C
- Logcat formats: brief, process, tag, thread, time, threadtime
- Logcat colors: colors, logcatnocolors
- DMESG: 0--1 or 0-99
- Lines: any integer value
- Wordwrap: enabled or disabled
- Save logs: enabled or disabled
- Fallback width and fallback height: for screen-size spoofing

### Example generated config

```sh
transparent
logcatlevels=VDIWEFS
logcatbuffers=MSREC
logcatformat=threadtime
colors
dmesg=0-99
lines=80
wordwrap
save
fallbackwidth=1080
fallbackheight=2340
```

## Files

- loader.sh: root module launcher
- customize.sh: module install config setup
- webroot/index.html: WebUI for configuration
- config: generated runtime settings file used by LiveBoot

## Download

Use the upstream release flow or a fork release package if available in your repository.

## Changelog

See [CHANGELOG.md](CHANGELOG.md).

## Licenses

- loader.sh, liveboot.apk, and libdaemonize.so are based on the original Chainfire LiveBoot project and remain under the GPLv3-compatible licensing used by the original project.
- For detailed original project license information, see the upstream Chainfire LiveBoot repository.
- This fork adds the WebUI and project documentation under its own repository structure and remains compatible with the original module distribution model.

Original project source: https://github.com/Chainfire/liveboot
