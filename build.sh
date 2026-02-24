#!/bin/bash

# Build script for Jekyll micro-learning site
# Usage: ./build.sh [serve]

set -e

echo "Building micro-learning site..."

# Check if Docker is available
if command -v docker &> /dev/null; then
    echo "Using Docker to build site..."
    docker run --rm \
        -v "$PWD":/srv/jekyll \
        -v "$PWD/_site":/srv/jekyll/_site \
        jekyll/jekyll:latest \
        jekyll build --future --destination /srv/jekyll/_site
else
    echo "Docker not available. Checking for local Jekyll..."
    if command -v jekyll &> /dev/null; then
        echo "Using local Jekyll..."
        jekyll build --future
    else
        echo "Error: Neither Docker nor Jekyll is available."
        echo "Please install Docker or Jekyll to build the site."
        exit 1
    fi
fi

echo "Build complete! Site built in ./_site"

# Serve locally if requested
if [ "$1" == "serve" ]; then
    echo "Starting local server..."
    if command -v docker &> /dev/null; then
        docker run --rm \
            -v "$PWD":/srv/jekyll \
            -p 4000:4000 \
            jekyll/jekyll:latest \
            jekyll serve --host 0.0.0.0 --watch --force_polling
    else
        jekyll serve --watch
    fi
fi