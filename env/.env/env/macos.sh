#!/bin/bash
# Function to associate file extensions with Visual Studio Code
function set_vscode_defaults() {
    local vscode_bundle_id="com.microsoft.VSCode"

    # List of file extensions to associate with VS Code
    local extensions=(
        "txt"
        "md"
        "mdx"
        "json"
        "js"
        "ts"
        "jsx"
        "tsx"
        "html"
        "css"
        "scss"
        "rs"
        "toml"
        "yml"
        "yaml"
        "sh"
        "bash"
        "py"
        "rb"
        "go"
        "sql"
    )

    # Check if duti is installed
    if ! command -v duti &> /dev/null; then
        echo "Error: duti is not installed. Install it with: brew install duti"
        return 1
    fi

    echo "Setting VS Code as default for ${#extensions[@]} file extensions..."

    for ext in "${extensions[@]}"; do
        duti -s "$vscode_bundle_id" ".$ext" all
        echo "  ✓ .$ext → VS Code"
    done

    echo "Done! VS Code is now the default for all specified extensions."
}
