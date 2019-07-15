FROM ruby:2.5-alpine
ENV BIND=0.0.0.0 PORT=8000 USER=admin PASS=passadmin SSL=TRUE RECORDING=lenovo-sr650
ADD . /app
WORKDIR /app
RUN bundle
ENTRYPOINT sh -xc '[ $SSL = "TRUE" ] && SSLCMD="--ssl" || SSLCMD=""; bundle exec redfish serve $SSLCMD --user $USER --pass $PASS --bind $BIND --port $PORT $RECORDING'
