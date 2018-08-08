# Docker doesn't recommend running the Docker daemon inside a container 
# there is an easy workaround: mount the host machine's Docker socket in the container. This will allow your container to use the host machine's Docker daemon to run containers and build images.

docker run --cap-add sys_time --security-opt seccomp:unconfined --name jenkins-container --privileged -d -p 49001:8080 -v /var/run/docker.sock:/var/run/docker.sock -v $PWD/jenkins-withdocker:/var/jenkins_home:z -t jenikins-docker-kubectl-helm:1  CMD chmod a+w /var/run/docker.sock 
