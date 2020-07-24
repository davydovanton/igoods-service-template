# Use the official big image as a build image.
FROM ruby:2.7.1 as builder

# Set the working directory.
WORKDIR /gems

RUN gem install bundler -v 2.1.4 \
	&& bundle config set path '/gems/cache' \
	&& bundle config set without 'development test'

# A trick to make bundle install faster - copy Gemfile only
COPY Gemfile* /gems/

RUN bundle install \
	&& rm -rf /usr/local/bundle/cache/*.gem


# Use the slim image as a runtime image
FROM ruby:2.7.1-slim

WORKDIR /app

RUN bundle config set path 'vendor/bundle' \
	&& bundle config set without 'development test'

# Install postgres client
RUN apt-get update \
	&& apt-get install -y --no-install-recommends libpq-dev curl \
	&& apt-get clean

# Copy the installed gems cache
COPY --from=builder /gems/cache vendor/bundle

# Copy the app from your host to your current location.
COPY . /app/

# Inform Docker that the container is listening on the specified port at runtime.
EXPOSE 9292

# Run the specified command within the container.
CMD bundle exec rackup -o 0.0.0.0
