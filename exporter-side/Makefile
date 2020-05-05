export DOCKER_NODE_EXPORTER_TAG=v0.18.1
up:
	docker run \
		--rm \
		--interactive \
		--tty \
		--name node-exporter \
		--hostname node-exporter \
		--publish 9100:9100 \
		prom/node-exporter:${DOCKER_NODE_EXPORTER_TAG}

# $1：docker container name
define docker-stop
	docker container ls --quiet --filter 'name=$1' \
		| xargs -I {} docker container stop {}
endef

clean:
	$(call docker-stop,node-exporter)
