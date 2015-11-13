# README

## Installation

### Install Emacs

If you're not satisfied with the version of Emacs shipped with the
distribution of your OS, you can think about installing a newer
version. There're a few ways to get things done. You can choose to
install a nightly version via PPA:

```sh
sudo add-apt-repository ppa:ubuntu-elisp/ppa
sudo apt-get update
sudo apt-get install emacs-snapshot
```

Or you can build one from source code through `git`:

```sh
git clone https://github.com/emacs-mirror/emacs.git
cd emacs && git checkout emacs-24.5
sudo apt-get build-dep emacs24                      # install all dependencies
./autogen.sh && ./configure
make && sudo make install
```

### Get a local copy

Make sure you've already backed up your own configuration. Then
`git clone` the repository.

```sh
git clone https://github.com/izhaoyun/emacs.d.config.git ~/.emacs.d
```
