# Config group for systems with accounting support.
{ pkgs, ... }: {
  imports = [
    ./go
    ./lua
    ./node
    ./python
    ./R
    ./rust
  ];
}
