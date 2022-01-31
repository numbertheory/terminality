#!/usr/bin/env zsh

# Generates a gitignore from the main branch of GitHub's gitignore project
# https://github.com/github/gitignore
#
# By default, it will not overwrite your .gitignore, unless your second argument
# is "-o"
#
# Example: gitignore_gen python -o
#
# Note: The script automatically capitalizes the first letter of the language for you,
# however, it will not automaticaly correct mispellings or other wrong capitalizations.

function restResponse () {
  curl --write-out "%{http_code}\n" --silent --output /dev/null "$1"
}

function writeOutGitIgnore () {
  detectFile=$(restResponse "https://raw.githubusercontent.com/github/gitignore/main/${1}.gitignore")
  if [[ "$detectFile" == "200" ]]; then
    curl -s "https://raw.githubusercontent.com/github/gitignore/main/${language}.gitignore" > .gitignore
    echo "Done writing .gitignore!"
  else
    echo "${language} language not found. Response from server: ${detectFile}"
    echo "See https://github.com/github/gitignore for details."
  fi
}

function gitignore () {
  language=${(C)1}
  echo "Generating gitignore for ${(C)language}"
  if [[ -f ".gitignore" ]] && [[ $2 == "-o" ]]; then
    echo "Warning: Overwriting existing .gitignore file!"
    writeOutGitIgnore $language
  elif [[ -f ".gitignore" ]]; then
    echo "Not overwriting current .gitignore file"
  else
    echo "No .gitignore found, writing a new file."
    writeOutGitIgnore $language
  fi

}

gitignore $1 $2
