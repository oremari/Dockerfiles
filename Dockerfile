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

#RUN chmod a+w /var/run/docker.sock


RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.11.2/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl


RUN curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > get_helm.sh 
#RUN sed 's/openssl sha/openssl sha1/' < get_helm.sh >get_helm1.sh
RUN chmod 700 get_helm.sh
RUN ./get_helm.sh --version v2.4.1


#RUN curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash
