# Use the official Jekyll image
FROM jekyll/jekyll:latest

# Set working directory
WORKDIR /srv/jekyll

# Copy site source
COPY . .

# Expose Jekyll default port
EXPOSE 4000

# Build the site (for production)
CMD ["jekyll", "build", "--future"]