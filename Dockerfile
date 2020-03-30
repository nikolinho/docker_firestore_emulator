FROM us.gcr.io/corpsvc-sre-tools-npe-1bf2/cloud-sdk:latest
LABEL maintainer="Nikolinho"

RUN apt -y update 2>/dev/null | grep packages | cut -d '.' -f 1 &&\
	apt install -y --no-cache openjdk8-jre &&\
	apt install -y --no-cache google-cloud-sdk-firestore-emulator &&\
	gcloud components install beta &&\
	gcloud components install cloud-firestore-emulator --quiet

VOLUME /opt/data

EXPOSE 9090

ENTRYPOINT ["gcloud", "beta", "emulators", "firestore", "start", "--host-port=0.0.0.0:9090"]
