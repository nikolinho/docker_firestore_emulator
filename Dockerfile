FROM google/cloud-sdk:286.0.0-alpine
LABEL maintainer="Nikolinho"

RUN apk add --update --no-cache openjdk8-jre &&\
	gcloud components install cloud-firestore-emulator --quiet

VOLUME /opt/data

EXPOSE 9090

ENTRYPOINT ["gcloud", "beta", "emulators", "firestore", "start", "--host-port=0.0.0.0:9090"]
