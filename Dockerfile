FROM google/cloud-sdk:alpine

RUN apk update \
&&  apk upgrade \
&&  apk add --no-cache -t .build-deps openjdk8 \
&& gcloud components install --quiet beta pubsub-emulator

ENV PORT=8085

CMD gcloud beta emulators pubsub start --host-port 0.0.0.0:$PORT
