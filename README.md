dotfiles
========

This is my personal collection of dot files used throughout mutliple different machines.

Install
-----
Clone the repo and its submodules, then install links.
The install **will not** override any configs by default.

```sh
git clone https://github.com/aaronfoley/dotfiles.git && \
cd dotfiles && ./install
```

If errors occur due to existing files, move them and try again.
Per machine configuration will be run based on current hostname.

Update
-----

Pull the latest from git and re-run the installer:

```sh
git pull && ./install
```
