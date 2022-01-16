#!/usr/bin/env bash


export COLOR_BLACK="\033[38;5;0m"
export COLOR_MAROON="\033[38;5;1m"
export COLOR_GREEN="\033[38;5;2m"
export COLOR_OLIVE="\033[38;5;3m"
export COLOR_NAVY="\033[38;5;4m"
export COLOR_PURPLE="\033[38;5;5m"
export COLOR_TEAL="\033[38;5;6m"
export COLOR_SILVER="\033[38;5;7m"
export COLOR_GREY="\033[38;5;8m"
export COLOR_RED="\033[38;5;9m"
export COLOR_LIME="\033[38;5;10m"
export COLOR_YELLOW="\033[38;5;11m"
export COLOR_BLUE="\033[38;5;12m"
export COLOR_FUSCHIA="\033[38;5;13m"
export COLOR_AQUA="\033[38;5;14m"
export COLOR_WHITE="\033[38;5;15m"
export COLOR_ORANGE="\033[38;5;172m"
export COLOR_DARK_ORANGE="\033[38;5;166m"
export COLOR_LIGHT_PURPLE="\033[38;5;141m"
export COLOR_RESET="\033[0m"

BLACK() { echo $2 "${COLOR_BLACK}$1${COLOR_RESET}"}
MAROON() { echo $2 "${COLOR_MAROON}$1${COLOR_RESET}"}
GREEN() { echo $2 "${COLOR_GREEN}$1${COLOR_RESET}"}
OLIVE() { echo $2 "${COLOR_OLIVE}$1${COLOR_RESET}"}
NAVY() { echo $2 "${COLOR_NAVY}$1${COLOR_RESET}"}
PURPLE() { echo $2 "${COLOR_PURPLE}$1${COLOR_RESET}"}
TEAL() { echo $2 "${COLOR_TEAL}$1${COLOR_RESET}"}
SILVER() { echo $2 "${COLOR_SILVER}$1${COLOR_RESET}"}
GREY() { echo $2 "${COLOR_GREY}$1${COLOR_RESET}"}
RED() { echo $2 "${COLOR_RED}$1${COLOR_RESET}"}
LIME() { echo $2 "${COLOR_LIME}$1${COLOR_RESET}"}
YELLOW() { echo $2 "${COLOR_YELLOW}$1${COLOR_RESET}"}
BLUE() { echo $2 "${COLOR_BLUE}$1${COLOR_RESET}"}
FUSCHIA() { echo $2 "${COLOR_FUSCHIA}$1${COLOR_RESET}"}
AQUA() { echo $2 "${COLOR_AQUA}$1${COLOR_RESET}"}
WHITE() { echo $2 "${COLOR_WHITE}$1${COLOR_RESET}"}
ORANGE() { echo $2 "${COLOR_ORANGE}$1${COLOR_RESET}"}
DARK_ORANGE() { echo $2 "${COLOR_DARK_ORANGE}$1${COLOR_RESET}"}
LIGHT_PURPLE() { echo $2 "${COLOR_LIGHT_PURPLE}$1${COLOR_RESET}"}


color_test() {
  BLACK "BLACK"  $2
  MAROON "MAROON"  $2
  GREEN "GREEN"  $2
  OLIVE "OLIVE"  $2
  NAVY "NAVY"  $2
  PURPLE "PURPLE"  $2
  TEAL "TEAL" $2
  SILVER "SILVER" $2
  GREY "GREY" $2
  RED "RED" $2
  LIME "LIME"  $2
  YELLOW "YELLOW" $2
  BLUE "BLUE"  $2
  FUSCHIA "FUSCHIA" $2
  AQUA "AQUA" $2
  WHITE "WHITE"  $2
  ORANGE "ORANGE"  $2
  DARK_ORANGE "DARK_ORANGE"  $2
  LIGHT_PURPLE "LIGHT_PURPLE" $2
}

color_test