{ pkgs, ... }:

let
  script = ./nix-flake-grep;
in
pkgs.writeShellApplication {
  name = "nix-flake-grep";

  runtimeInputs = with pkgs; [
    coreutils
    jq
    nix
    ripgrep
  ];

  text = builtins.readFile script;
}
