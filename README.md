# st - simple terminal

this my fork of:
["st: a simple terminal emulator for X which sucks less."](https://st.suckless.org/)

99.9% of the credits go to the original contributers.

## Requirements and Installation

For the original requirements and installation please see the 
[original page](https://st.suckless.org/). I am only building this for and with 
[NixOS](https://nixos.org/) so that's the only build I support.

## Changes

This fork is based on version 0.8.3 of st with the following changes:

* [ligatures](https://st.suckless.org/patches/ligatures/) patch applied (because I looooove [Victor Mono](https://rubjo.github.io/victor-mono/) )
* changed font to Victor Mono too
* [solarized](https://st.suckless.org/patches/solarized/) patch applied (because I looooove [Solarized](https://ethanschoonover.com/solarized/) ). Actually I applied the `st-solarized-both` patch.
* [scrollback](https://st.suckless.org/patches/scrollback/) patch applied (only the basic version so far. No mouse support)
* [externalpipe](https://st.suckless.org/patches/externalpipe/) patch applied. Also applied the `st-externalpip-eternal` patch for scrollback support and incorporated the `link_grabber` and `edit_screen` scripts from the patch site in `config.def.h`.

## TODOs

I am planing to make a patch on top of the `solarized-both` patch that does not change the scheme directly but emits an according message on D-BUS and listens for it. That way I should be able to:
* change the colour of all st terminals at once
* let other programs emit and listen for that message too, so I can create a system wide solarized theme

