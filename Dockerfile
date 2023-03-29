FROM ruby:3.2.1

# Install system dependencies required by the app
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Install yarn
RUN apt-get install -y curl && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update -qq && \
    apt-get install -y yarn

# Set the working directory
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile* ./

# Install the required gems
RUN bundle install

# Copy the rest of the app code into the container
COPY . .

# Install Node.js version 14.x
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

# Install JavaScript dependencies with yarn
RUN yarn install --check-files

# Precompile assets with esbuild and TailwindCSS
RUN bundle exec rake assets:precompile

# Precompile assets with esbuild and TailwindCSS
RUN yarn build

# Change permissions of start.sh script to make it executable
RUN chmod +x ./bin/docker-entrypoint
