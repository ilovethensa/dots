#!/bin/bash

# Function to fetch the latest stable tag of a Docker image from Docker Hub
get_latest_tag() {
    org=$1
    image=$2
    # Fetch tags, filter out tags containing "latest", pre-releases, preview, test, and tags for specific architectures, then sort them to get the latest stable tag
    latest_tag=$(curl -s "https://registry.hub.docker.com/v2/repositories/${org}/${image}/tags?page_size=100" \
        | jq -r '.results[] | select(.name != "latest" and (.name | test("latest|alpha|beta|rc|preview|test|armv7|arm64|riscv|risc-v") | not) and (.name | test("[0-9]"))) | .name' \
        | sort -rV | head -n 1)
    echo $latest_tag
}

# Function to update the image tag in the specified file
update_image_tag() {
    file=$1
    while IFS= read -r line; do
        if [[ $line =~ image\ =\ \"([^\:\/]+)\/([^\:\/]+)(\:[^\"]+)?\" ]]; then
            org="${BASH_REMATCH[1]}"
            image="${BASH_REMATCH[2]}"
            current_tag="${BASH_REMATCH[3]:-:latest}" # Default to ':latest' if no tag is provided
            current_tag="${current_tag#:}" # Remove the leading ':' if tag is present
            latest_tag=$(get_latest_tag $org $image)
            if [ ! -z "$latest_tag" ]; then
                echo "Updating ${org}/${image}:${current_tag} to ${org}/${image}:${latest_tag} in file ${file}"
                sed -i "s|${org}/${image}:${current_tag}|${org}/${image}:${latest_tag}|g" "$file"
            else
                echo "Could not fetch the latest tag for image ${org}/${image}"
            fi
        fi
    done < "$file"
}

# Main script
if [ $# -lt 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

directory=$1

# Find all .nix files in the specified directory and its subdirectories
find "$directory" -type f -name "*.nix" | while read -r file; do
    update_image_tag "$file"
done
