FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /nagai_video
WORKDIR /nagai_video
COPY Gemfile /nagai_video/Gemfile
COPY Gemfile.lock /nagai_video/Gemfile.lock
RUN bundle install
COPY . /nagai_video

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]