#############################
# Rails server Docker build #
#############################

# Use latest official ruby images.
# Careful to change the version number since
# stuff may break.
FROM ruby:2.4.0

# Authors
MAINTAINER Tony Zhang <zhzhangtony@gmail.com>

# Set up environment variables inside container
# ONLY write one ENV to keep the layers clean
#
# NOTE(tonyzhang): Any change to this list will be
# applied to ALL three environments (dev, test, prod).
# If you want the environment variable to be applied
# to only one environment, please do not add environment
# variabled here.
ENV AWS_ACCESS_KEY_ID "AKIAJFFNAYJE6234AUVQ"
ENV AWS_SECRET_ACCESS_KEY "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"

# Install global dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Create and move to app directory
RUN mkdir -p /srv/server
WORKDIR /srv/server

# Install rails dependencies
ADD Gemfile /srv/server/Gemfile
ADD Gemfile.lock /srv/server/Gemfile.lock
RUN bundle install

# Bundle app source inside the image
ADD . /srv/server

# Start rails server
CMD [ "bundle", "exec", "rails", "s", "-p", "3000" ]
EXPOSE 3000
