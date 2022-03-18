#!/usr/bin/env bash

# Description :   Generates a zip file containing files and directories of the working
#                 directory. This script doesn't copy files and directories matching
#                 wildcards found in the .gitignore file of working directory.
#
# Arguments   :   Path to the output without .zip extension.
#
# Author      :   Abdulhamid Yusuf (Joe)
#
# Email       :   abdulhamid0yusuf@gmail.com

set +e

OUT_DIR="${1:-$(basename "$(pwd)")/}"
OUT_ZIP="${OUT_DIR%/}.zip"

function main() {
  rm -rf "$OUT_DIR"
  rm -f "$OUT_ZIP"
  local excluded_files=("$(get_excluded_files)")
  local package_files=("$(get_package_files "${excluded_files[*]}")")
  copy_src_to_dest "${package_files[*]}"
  zip -r "$OUT_ZIP" "$OUT_DIR"
  rm -rf "$OUT_DIR"
}

function get_excluded_files() {
  local excluded_files=()
  while IFS= read -r line; do
    if [ -n "$line" ] && [[ "$line" != "#"* ]]; then
      excluded_files+=("$line")
    fi
  done <".gitignore"
  echo "${excluded_files[*]}"
}

function get_package_files() {
  local excluded_files=("$*")
  local package_files=()
  while IFS= read -r -d '' file; do
    for excluded_pattern in ${excluded_files[*]}; do
      if [[ "${file#./}" =~ $excluded_pattern? ]] || [[ "$file" == '.' ]]; then
        continue 2
      fi
    done
    package_files+=("$file")
  done < <(find . -print0)
  echo "${package_files[*]}"
}

function copy_src_to_dest() {
  local src_files_and_dirs=("$*")
  mkdir -p "$OUT_DIR"
  for entity in ${src_files_and_dirs[*]}; do
    cp -r "$entity" "$OUT_DIR${entity#./}"
  done
}

main "$@"
