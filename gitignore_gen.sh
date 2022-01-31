#!/usr/bin/env zsh

# Generates a gitignore from the main branch of GitHub's gitignore project
# https://github.com/github/gitignore

function gitignore () {
  language=${(C)1}
  echo "Generating gitignore for ${(C)language}"
  if [[ -f ".gitignore" ]] && [[ $2 == "-o" ]]; then
    echo "Warning: Overwriting existing gitignore file!"
    curl -s "https://raw.githubusercontent.com/github/gitignore/main/${language}.gitignore" > .gitignore
  else if [[ -f ".gitignore" ]];
    echo "Not overwriting current .gitignore file"
  fi

}

gitignore $1 $2
