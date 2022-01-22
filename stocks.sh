#!/usr/bin/env zsh


# Sign up with Rapidapi.com to get the finance key, and export it as YAHOO_FINANCE_API_KEY
# The free tier allows 500 requests a month which should be fine for personal use.
# https://rapidapi.com/apidojo/api/yh-finance/

# Set up colors
export COLOR_PURPLE="\033[38;5;5m"
export COLOR_LIME="\033[38;5;10m"
export COLOR_GREEN="\033[38;5;2m"
export COLOR_MAROON="\033[38;5;1m"
export COLOR_RED="\033[38;5;9m"
export COLOR_RESET="\033[0m"

DEFAULT_COLOR() { echo $2 "${COLOR_RESET}$1${COLOR_RESET}"}
RED() { echo $2 "${COLOR_RED}$1${COLOR_RESET}"}
LIME() { echo $2 "${COLOR_LIME}$1${COLOR_RESET}"}
PURPLE() { echo $2 "${COLOR_PURPLE}$1${COLOR_RESET}"}
MAROON() { echo $2 "${COLOR_MAROON}$1${COLOR_RESET}"}
GREEN() { echo $2 "${COLOR_GREEN}$1${COLOR_RESET}"}

if [[ "$1" == "" ]]; then
  MAROON "You must supply a stock symbol as an argument:"
  echo "Example: stocks tsla"
  return
fi

days=${2:-1}

data=$(curl -s --request GET \
       --url "https://yh-finance.p.rapidapi.com/stock/v3/get-historical-data?symbol=${1}&region=US" \
	     --header "x-rapidapi-host: yh-finance.p.rapidapi.com" \
	     --header "x-rapidapi-key: ${YAHOO_FINANCE_API_KEY}")


results=()
change_alert=()
for i in {1..$days}
do
  open_price=$(printf "%.2f \n" $(echo "${data}" | jq ".prices[$i].open"))
  close_price=$(printf "%.2f \n" $(echo "${data}" | jq ".prices[$i].close"))
  date_stock=$(echo "${data}" | jq ".prices[$i].date")
  format_date=$(date -r $date_stock +%F )
  if (( $open_price < 1000 )); then
      results+="$format_date\t${open_price}\t\t${close_price}"
  else
      results+="$format_date\t${open_price}\t${close_price}"
  fi
  if (( $close_price < $open_price )); then
    change_alert+="RED"
  elif (( $close_price > $open_price )); then
    change_alert+="GREEN"
  else
    change_alert+="DEFAULT"
  fi
done

PURPLE "Ticker ${1:u}"
LIME "date\t\topen\t\tclose"

i=1
for result in ${results[@]}
do
  if [[ "${change_alert[$i]}" == "RED" ]]; then
    RED "$result"
  elif [[ "${change_alert[$i]}" == "GREEN" ]]; then
    GREEN "$result"
  elif [[ "${change_alert[$i]}" == "DEFAULT" ]]; then
    DEFAULT_COLOR "$result"
  fi
  i=$(expr $i + 1)
done
