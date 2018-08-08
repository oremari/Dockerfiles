FROM jenkins/jenkins:lts
USER root

# Install the latest Docker CE binaries
RUN apt-get update && \
    apt-get -y install apt-transport-https \
      ca-certificates \
      curl \
      gnupg2 \
      software-properties-common && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
    add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
      $(lsb_release -cs) \
      stable" && \
   apt-get update && \
apt-get -y install docker-ce

RUN chmod w+x /var/run/docker.sock


RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.11.2/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl


RUN curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > get\_helm.sh\
sed 's/openssl sha/openssl sha1/' < get\_helm.sh >get\_helm1.sh\
chmod 700 get\_helm1.sh\
./get\_helm1.sh -v v2.4.1


