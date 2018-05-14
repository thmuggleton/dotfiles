#!/usr/bin/env bash
# Creates symlinks to all files stored in the dotfiles directory.
# Script prepends a '.' to all file names and places the link in the home
# directory of the current user.  Prompts for confirmation to replace
# corresponding files that already exist.
#
# Copyright (C) 2018 Thomas H. Muggleton
#
# This program is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the
# Free Software Foundation, either version 3 of the License, or (at your
# option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  For more details,
# see the GNU General Public License, included in the LICENSE file in the
# root directory of this project or available at:
# http://www.gnu.org/licenses/


# Function to append PWD if path is relative
absolute_path() {
  # Path is already absolute
  if [[ $1 == /* ]]; then
    echo $1
  else
    # Strip "./" from front before prepending $PWD
    echo "$PWD/${1#./}"
  fi
}

# Retrieve absolute path of dotfiles directory
CURRENT_DIR="$(dirname ${BASH_SOURCE[0]})"
DOTFILES_DIR="$(absolute_path ${CURRENT_DIR}/dotfiles)"

# Create symlinks for all files in dotfiles directory
for FILE in $(ls $DOTFILES_DIR); do
  FILEPATH=${DOTFILES_DIR}/${FILE}
  ln -is ${FILEPATH} ~/.${FILE}
done
