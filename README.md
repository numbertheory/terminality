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

   Run `source <PATH_TO_REPO>/gitignore_gen.sh <language>` to generate a `.gitignore` for a new git project.

   To force the script to overwrite your current current `.gitignore` add a `-o` flag.

   `source <PATH_TO_REPO>/gitignore_gen.sh <language> -o`

   This retrieves the latest .gitignore file for the language provided from GitHub:

   https://github.com/github/gitignore
