FROM java:8-jre

MAINTAINER Lucas Pantanella

RUN \
  apt-get update && apt-get install -y curl wget sed && \
  LATEST_RELEASE=$(curl -L -s -H 'Accept: application/json' https://github.com/wavesplatform/Waves/releases/latest) && \
  LATEST_TAG=$(echo $LATEST_RELEASE | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/') && \
  LATEST_VERSION=$(echo $LATEST_TAG | sed -e 's/^.//') && \
  mkdir -p /root/waves && \
  wget -O /root/waves/waves.jar https://github.com/wavesplatform/Waves/releases/download/${LATEST_TAG}/waves-all-${LATEST_VERSION}.jar

EXPOSE 6863 6869 6886

WORKDIR /root/waves

ENTRYPOINT \
  java -jar /root/waves/waves.jar /root/waves/conf/waves.conf

