FROM ruby:2.5.1
ENV LANG C.UTF-8
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client wget
RUN wget http://johnvansickle.com/ffmpeg/releases/ffmpeg-release-64bit-static.tar.xz \
      && tar Jxvf ./ffmpeg-release-64bit-static.tar.xz \
      && cp ./ffmpeg*64bit-static/ffmpeg /usr/local/bin/

RUN mkdir /nagai_video
WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install
ENV APP_HOME /nagai_video
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]