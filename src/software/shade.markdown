---
title: Marek Sapota — Shade
---

# Shade

Shade is a set of useful command line utilities that can substitute many
programs commonly provided by desktop environments like GNOME or KDE.  It is
mainly useful for people using alternative, lightweight desktop managers like
xmonad or Fluxbox.  Shade currently consists of these utilities:

- [Open](#open)
- [PulseAudio Control](#pulseaudio-control)
- [Shade](#shade)
- [Storage](#storage)

These utilities are not really connected to each other, and there is no reason
why they could not be used separately.

Shade is free software licensed under the X11 license, see the [COPYING](
https://github.com/maarons/Shade/blob/master/COPYING) file distributed along
Shade for the full license text.

## Open
Inspired by Mac OS X’s command bearing the same [name](
https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/open.1.html),
this utility allows users to conveniently open different file types with a
single application.  Unlike Mac OS X’s “open” and Freedesktop.org’s “xdg-open”
this utility is completely independent of any DE settings, “.desktop” files and
any other unnecessary complications.  Just link a command like “eog”, “evince”
or “mplayer -f” to chosen mime types and you are good to go.

## PulseAudio Control
This utility can control PulseAudio sinks from the command line.  It has some
basic controls like volume up, volume down and mute.  It is most useful when
called through some keyboard shortcut.

## Shade
This utility is mostly targeted at laptops and other mobile devices as it allows
you to switch between “power save” and “performance” power management modes,
suspend or hibernate your computer and switch between different displays (for
example between an internal laptop display and an external multimedia
projector).

## Storage
This utility provides a convenient, command line interface to udisks.  It
features include mounting/unmounting external drives, as well as support for
LUKS devices.

# Links
- [Shade repo on Github](https://github.com/maarons/Shade)
