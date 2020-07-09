FROM ruby:2.5.1
FROM jrottenberg/ffmpeg
ENV LANG C.UTF-8
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /nagai_video
WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN gem install bundler -v 1.17.3
RUN bundle install
ENV NAGAI_VIDEO_HOME /nagai_video
RUN mkdir -p $NAGAI_VIDEO_HOME
WORKDIR $NAGAI_VIDEO_HOME
ADD . $NAGAI_VIDEO_HOME

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]