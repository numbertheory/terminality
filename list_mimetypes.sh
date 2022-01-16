#!/usr/bin/env bash -x

function mimes () {
  listing_dir="$(ls -ma)"
  files=("${(@s/,/)listing_dir}")
  longest_mimetype="0"
  longest_filename="0"
  longest_filesize="0"
  for file in $files;
    do
      file_path=$(echo -e "${PWD}/$file" | tr -d '[:space:]')
      mimetype=$(file --mime-type -b $file_path)
      file_size=$(du -sh $file_path 2> /dev/null | awk '{print $1;}')
      if (( ${#mimetype} > $longest_mimetype)); then
        longest_mimetype=${#mimetype}
      fi
      if (( ${#file} > $longest_filename)); then
        longest_filename=${#file}
      fi
      if (( ${#file_size} > $longest_filesize)); then
        longest_filesize=${#file_size}
      fi
    done
  for file in $files;
    do
      file_path=$(echo -e "${PWD}/$file" | tr -d '[:space:]')
      mimetype=$(file --mime-type -b $file_path)
      file_size=$(du -sh $file_path 2> /dev/null | awk '{print $1;}')
      echo -n $mimetype
      for i in {${#mimetype}..${longest_mimetype}}
        do
          echo -n " "
        done
      if [ "${file}" != "." -a "${file}" != " .." ]; then
        echo -n "$file_size"
      else
        echo -n "    "
      fi
      for i in {${#file_size}..${longest_filesize}}
        do
          echo -n " "
        done
      echo -e "$(echo -e "${file}" | tr -d '[:space:]')"
    done

}

# Demo line, do not copy below this point
mimes
