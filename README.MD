# My NixOS Configuration

Flakes + Home Manager.

The structure is very simple and heavily inspired by
[VimJoyer's "Ultimate NixOS Guide"](https://youtu.be/a67Sv4Mbxmc?feature=shared).

- `hosts/` is where configurations for entire machines are stored.
- `modules/` is where common chunks of configuration are stored, which can then
    be imported by multiple hosts.
    - `home-manager/g-*` are thematic groupings of smaller configs. They make it
        easier to define a host, because less imports are needed.
    - `nixos/o-*` are optional system configuration files for enabling audio,
        bluetooth, and similar.

## Disclaimer

All the files, tips, scripts, and other data contained in this repository are
distributed under no warranty. They are simply resources I've written and
released to the public for my own convenience.

You are free to copy, modify and redistribute these configs, but I'm not
responsible for what you do with them (see LICENSE).
