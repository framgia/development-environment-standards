FROM ruby:2.5.1
LABEL author="vu.ngoc.quangb@framgia.com"

# Install apt based dependencies required to run Rails as
# well as RubyGems. As the Ruby image itself is based on a
# Debian image, we use apt-get to install those.
RUN apt-get update && apt-get install -y \
  build-essential \
  nodejs \
  nano vim cron

# Configure the main working directory. This is the base
# directory used in any further RUN, COPY, and ENTRYPOINT
# commands.
RUN mkdir -p /app
WORKDIR /app

# Copy the Gemfile and bundle install
# This is a separate step so the dependencies
# will be cached unless changes to one of those two files
# are made.
COPY Gemfile ./
RUN bundle install --jobs 20 --retry 5

# Set the timezone to Japan
ENV TZ=Japan
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Add a script to be executed every time the container starts.
COPY docker/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# The main command to run when the container starts. Also
# tell the Rails dev server to bind to all interfaces by
# default.
CMD ["rails", "server", "-b", "0.0.0.0"]
