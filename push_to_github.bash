#!/usr/bin/env bash

bash_files=(".bash_profile" ".bashrc" ".bash_logout")

destination="misc_configuration"
if ! [[ -d "$destination" ]]; then
  mkdir "$destination"
fi
git add $destination/

for file in "${bash_files[@]}"; do
  cp "$HOME/$file" "$destination"
  git add "$destination/$file"
done

git add *
git commit
git push -u origin main
