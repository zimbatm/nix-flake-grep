{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    bashInteractive
    coreutils
    jq
    ripgrep
  ];
}

