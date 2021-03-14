# st - simple terminal

this my fork of:
["st: a simple terminal emulator for X which sucks less."](https://st.suckless.org/)

99.9% of the credits go to the original contributers.

## Changes

This fork is based on version 0.8.3 of st with the following changes:

* [ligatures](https://st.suckless.org/patches/ligatures/) patch applied (because I looooove [Victor Mono](https://rubjo.github.io/victor-mono/) )
* changed font to Victor Mono too
* [solarized](https://st.suckless.org/patches/solarized/) patch applied (because I looooove [Solarized](https://ethanschoonover.com/solarized/) ). Actually I applied the `st-solarized-both` patch.

## TODOs

I am planing to make a patch on top of the `solarized-both` patch that does not change the scheme directly but emits an according message on D-BUS and listens for it. That way I should be able to:
* change the colour of all st terminals at once
* let other programs emit and listen for that message too, so I can create a system wide solarized theme

## Requirements and Installation

For the original requirements and installation please see the 
[original page](https://st.suckless.org/). I am only building this for and with 
[NixOS](https://nixos.org/) so that's the only build I support and all requirements 
should be covered by the `default.nix` file.

### Build localy
Just run `nix-build` or `nix-build default.nix`. The binary can be found at `result/bin/st`.

### Include in NixOS

In my `configuration.nix` I have (among other overlay definitions) this:

```
  nixpkgs.overlays = 
    let
      st_src = pkgs.fetchFromGitHub {
            owner  = "agschaid";
            repo   = "st";
            rev    = "f70528ec465fd634256fec6140c327a2dad6c4c7"; # v0.2
            sha256 = "1p010nhm2r45ipji6l5xsiqjzjp5j6j6w1sc50x6kmy4dssy0yip";
        };

      src_overlays = self: super: {
        st = import "${st_src}/default.nix";
      };

      other_overlays = self: super: {
        # other stuff
      };

    in
    [other_overlays src_overlays];
```
Not sure if this is the most elegant or idiomatic way but it works: when installing `st`
the version of this repo is chosen over the standard version.


