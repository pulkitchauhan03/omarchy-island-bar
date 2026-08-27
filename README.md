# Island Bar

Island Bar is a floating three-island status bar for Omarchy 4. It is a maintained downstream fork of Omarchy's bar, based on the floating-island work in Dicey Bar.

The left, center, and right sections remain fully compatible with Omarchy's widget registry and `shell.json`, while each section receives its own themed rounded surface.

## Features

- Separate floating islands for left, center, and right sections.
- Transparent outer bar surface with themed island backgrounds.
- Native Omarchy widgets, popups, tooltips, drag-and-reorder, and center anchoring.
- Top, bottom, left, and right bar orientations.
- Multi-monitor support.
- Theme and font changes continue to apply live.
- Monitor-scale recovery for layer surfaces.
- Stock bar behavior retained wherever the island presentation does not need to differ.

## Install

Install with Omarchy's official plugin manager:

```bash
omarchy plugin add https://github.com/pulkitchauhan03/omarchy-island-bar.git --enable
```

Island Bar replaces `omarchy.bar` only while enabled. It does not edit Omarchy's packaged files or overwrite `~/.config/omarchy/shell.json`.

To return to the stock bar:

```bash
omarchy plugin remove io.github.pulkitchauhan.island-bar
```

Because the manifest declares `omarchy.bar` as its source, Omarchy restores the built-in bar when Island Bar is removed.

## Configure

Island Bar uses the same bar configuration as Omarchy:

```bash
omarchy bar position top
omarchy bar transparent
omarchy bar move omarchy.clock --section center
omarchy plugin enable omarchy.audio
```

The active layout remains in:

```text
~/.config/omarchy/shell.json
```

Island Bar does not maintain a second layout format.

## Visual design

Horizontal bars use a transparent layer surface and paint independent themed islands for the left, center, and right groups. The center island preserves Omarchy's configured center anchor, normally the clock. Vertical bars retain the stock compact module behavior while applying the same island treatment where supported.

Island appearance tokens are isolated in `IslandStyle.qml`; the reusable surface is `IslandSurface.qml`. This keeps visual changes separate from the upstream bar engine.

## Updates and upstream compatibility

Island Bar tracks the Omarchy bar implementation used for each release. The `upstream/` directory records the Omarchy package version and source hashes. Check whether the installed Omarchy bar changed:

```bash
./scripts/check-upstream
```

When Omarchy changes its bar implementation, a maintainer can attempt to refresh the fork:

```bash
./scripts/sync-upstream
omarchy plugin validate .
qmllint -I /usr/share/omarchy/shell Bar.qml IslandStyle.qml IslandSurface.qml ScaleSafeRemap.qml
```

The sync command performs a patch dry run first and refuses to replace files when the upstream structure no longer matches. Review and commit the resulting diff manually.

## Development validation

```bash
omarchy plugin validate .
qmllint -I /usr/share/omarchy/shell Bar.qml IslandStyle.qml IslandSurface.qml ScaleSafeRemap.qml
git diff --check
```

Run the plugin through a real Omarchy installation before publishing an update. Test widget popups, drag/reorder, all four positions, theme changes, multiple monitors, monitor scaling, shell restart, and removal.

## Upstream and license

Island Bar contains code derived from the Omarchy bar and the Dicey Bar customization. The upstream Apache License 2.0 is retained in [LICENSE](LICENSE). See the recorded source revision in `upstream/SOURCE_COMMIT`.
