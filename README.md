# Dockerfiles

### to build your images run:
docker build . -t yourimagename:yourtag

### example:
docker build . -t jenikins-docker-kubectl-helm:1

Paragraph 1

To run the container, you can run the run.sh. Docker doesn't recommend to run docker inside docker.  
Btw there is an easy workaround: mount the host machine's Docker socket in the container. This will allow your container to use the host machine's Docker daemon to run containers and build images.
