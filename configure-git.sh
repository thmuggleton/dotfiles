#!/usr/bin/env bash
# Sets git configuration values, including optionally setting the name and
# e-mail address recorded in commits.
#
# Copyright (C) 2017 Thomas H. Muggleton
#
# This program is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  For more details, see the GNU General Public
# License, included in the LICENSE file in the root directory of this project
# or available at: http://www.gnu.org/licenses/

echo -n 'Do you want to set name and e-mail? (y/n) '
read SET_NAME_AND_EMAIL

if [[ "$SET_NAME_AND_EMAIL" == y ]]; then
  echo
  echo "Existing value for user.name: $(git config --global --get user.name)"
  echo 'Enter your full name (leave blank to keep existing value): '
  read USER_NAME

  if [[ -n "$USER_NAME" ]]; then
    git config --global user.name "$USER_NAME"
  fi

  echo
  echo "Existing value for user.email: $(git config --global --get user.email)"
  echo 'Enter your e-mail address (leave blank to keep existing value): '
  read EMAIL_ADDRESS
  echo

  if [[ -n "$EMAIL_ADDRESS" ]]; then
    git config --global user.email "$EMAIL_ADDRESS"
  fi
fi

git config --global color.ui true
git config --global core.editor vim
git config --global core.excludesfile ~/.gitignore_global

