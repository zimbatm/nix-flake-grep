# nix-flake-grep

`nix-flake-grep` is a tiny wrapper that resolves a flake’s entire input graph and runs `ripgrep` across every fetched store path.

It's useful in cases where your project build is getting and `ripgrep` doesn't
give you a result. Most likely, the error is in one of the flake inputs.

## Usage

> **Heads-up:** the commands below assume the `nix-command` and `flakes` experimental features are enabled (e.g. via `~/.config/nix/nix.conf`).

```bash
# Search the current flake and its inputs
nix run github:zimbatm/nix-flake-grep -- pattern

# Search another flake (local path, URL, or registry entry)
nix run github:zimbatm/nix-flake-grep -- --flake github:numtide/blueprint -- pattern -g '*.nix'
```

Anything after `--` is forwarded directly to `rg`, so every familiar flag (`-g`, `-t`, `--hidden`, etc.) works as expected. The command fails when no matches are found (exit code 1), matching ripgrep’s behavior.

## Development

This repo uses the [numtide/blueprint](https://github.com/numtide/blueprint) flake layout. To hack on the script:

```
nix develop
./nix-flake-grep -- --help          # run the script directly
nix run .#nix-flake-grep -- foo     # run through the packaged derivation
```

The main script lives in `./nix-flake-grep`, and `package.nix` wires it into `pkgs.writeShellApplication`.
