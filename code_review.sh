#!/bin/bash

# This script searches for potential security vulnerabilities
# using a list of keywords.

echo "##################################"
echo "Running GREP Code Review Script..."
echo "##################################"

# Part (d): List of keywords
keywords=(
    # "password"
    # "secret"
    # "api_key"
    "token"
    # "eval"
    # "exec"
    # "strcpy"
    # "TODO"
    # "FIXME"
    # "debug=true"
    # "verify=False"
)

# Part (f): Loop and call grep
for keyword in "${keywords[@]}"
do
    # Capture matches quietly and only print header + matches if any found.
    # Use -I to skip binary files, --color=never to avoid color codes, and
    # redirect grep stderr to /dev/null to silence permission warnings.
    matches=$(grep -r -i -n -I --color=never -- "${keyword}" . 2>/dev/null || true)
    if [ -n "${matches}" ]; then
        echo ""
        echo "--- Searching for keyword: ${keyword} ---"
        printf "%s\n" "${matches}"
    fi
done

echo ""
echo "##################################"
echo "All done."
echo "##################################"