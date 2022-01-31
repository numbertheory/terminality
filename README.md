# terminality
Terminal functions for macOS that I wished into existence. Use at your own discretion.

They can all be run independently, but to install them, you'd want to include just the function
in your shell's run commands (rc) file. Don't copy/paste the whole file, as each file also contains
a demo of actually running the function.

# Contents

 - [list_mimetypes](list_mimetypes.sh):

    Like a standard `ls -l`, but instead of file permissions, you see the mime-types of
    each file.

- [stocks.sh](stocks.sh):

    Run `source stocks.sh <TICKER-SYMBOL> <NUMBER OF DAYS>` to get the opening and closing
    stock prices for the current and previous number of days.

    Example: `source stocks.sh siri 20`

    Requirements: curl, jq installed, along with a token from https://rapidapi.com/apidojo/api/yh-finance/

- [gitignore_gen.sh](gitignore_gen.sh):
