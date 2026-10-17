# dotfiles

My macOS configs. The repo mirrors the layout of `$HOME`: a file at
`.config/herdr/config.toml` here belongs at `~/.config/herdr/config.toml`.

Tracked configs are **symlinked** into place, so the files in this repo are the
real ones. Editing a config (by hand or through the app's own settings UI)
changes the file here, and `git status` shows it.

## Setup on a new machine

1. Install the Xcode command line tools and [Homebrew](https://brew.sh):

   ```sh
   xcode-select --install
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. Clone the repo:

   ```sh
   git clone git@github.com:danshevluk/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

3. Link the configs into place. Preview first, then run it for real:

   ```sh
   ./install.sh --dry-run
   ./install.sh
   ```

   Any file already at a target path is moved to `<path>.backup-<timestamp>`,
   never deleted. The script is safe to re-run; already-linked paths are
   reported as `ok`.

4. Install packages from the Brewfile:

   ```sh
   brew bundle --file ~/dotfiles/.Brewfile
   ```

## What's linked

`install.sh` only links paths listed in its `LINKS` array:

| Path | Tool |
| --- | --- |
| `.gitconfig` | git identity |
| `.config/git/ignore` | global gitignore |
| `.config/herdr/config.toml` | [herdr](https://herdr.dev) keybindings and settings |
| `.config/mise/config.toml` | [mise](https://mise.jdx.dev) global tool versions (go, node, …) |
| `.config/nvim` | Neovim ([LazyVim](https://lazyvim.github.io)), whole directory |
| `.config/zed/settings.json` | Zed settings |

mise refuses to load a config that lives outside `~/.config/mise` until it's
trusted, so `install.sh` also runs `mise trust` on the linked file.

Not linked, kept as reference copies:

- `.zshrc` is an old version. The live one still lives only on the machine.
- `Library/Developer/Xcode/UserData` holds Xcode color themes and code snippets.

Language toolchains (go, node) come from mise, not Homebrew, so the Brewfile
doesn't list them.

## Adding a new config

1. Move the file into the same relative path inside the repo and link it back:

   ```sh
   mkdir -p ~/dotfiles/.config/<tool>
   mv ~/.config/<tool>/<file> ~/dotfiles/.config/<tool>/<file>
   ```

2. Add the path to `LINKS` in `install.sh`, then run `./install.sh` to create
   the symlink.

3. Commit.

Prefer linking individual files over whole directories when the app also
writes logs, sockets, caches or session state next to its config (herdr does
this, so only `config.toml` is tracked).

## Secrets

Never commit tokens or passwords. Put them in a local, untracked file such as
`~/.zshrc.local` and source it from `.zshrc`.
