#!/bin/bash

installMac() {
	brew cask update && brew cask install hyperterm
}

dotfiles::install hyper
