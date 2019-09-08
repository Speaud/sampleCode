#!/usr/bin/env bash

DetermineVersioningLogic() {
    echo "Use default versioning logic? (y/n)"
    read use_default_versioning_logic

    [[ ! $use_default_versioning_logic =~ ^[yn]$ ]] && ( echo "Invalid entry"; DetermineVersioningLogic; )
    [[ $use_default_versioning_logic == "y" ]] && ( HandleUserDefinedVersion; )
}

HandleUserDefinedVersion() {
    echo "Enter the explicit version: "
    read explicit_version

    if [[ ! $explicit_version =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        echo "Invalid entry. The version must match the following pattern"
        HandleUserDefinedVersion
    else
        echo "all good"
    fi
    # git tag -l <pattern>
}

DetermineVersioningLogic