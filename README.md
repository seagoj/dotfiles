## dotfiles

Repository of configuration files and scripts.

### Usage

#### Installation

Decrypts files and creates symlinks using 

```shell
$ git clone git://github.com/seagoj/dotfiles.git ~/dotfiles
$ cd ~/dotfiles && ./bootstrap.sh
```

#### Rollup unencrypted files for commit

Encrypts sensitive files

```shell
$ cd ~/dotfiles && ./rollup.sh
```
