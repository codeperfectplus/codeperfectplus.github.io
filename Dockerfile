# Use the official Ruby image from the Docker Hub
FROM ruby:3.1

# Install dependencies
RUN apt-get update && apt-get install -y build-essential libffi-dev nodejs

# Set the working directory
WORKDIR /usr/src/app

# Copy the Gemfile only
COPY Gemfile ./

# Install the required gems (including Jekyll)
RUN bundle install

# Copy the rest of the application code
COPY . .

# Expose the Jekyll server port
EXPOSE 4000

# Set environment variable to prevent Jekyll from using Docker's /tmp directory
ENV JEKYLL_UID=jekyll

# Set the command to serve the Jekyll site
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
