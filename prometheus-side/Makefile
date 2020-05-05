export DOCKER_PROMETHEUS_TAG=v2.17.2
export DOCKER_GRAFANA_TAG=6.7.3
export DOCKER_NETWORK_NAME=prom-network

up:
	make network
	make prom
	make grafana

network:
	( docker network ls | grep ${DOCKER_NETWORK_NAME} ) \
		|| docker network create ${DOCKER_NETWORK_NAME}

prom: network
	docker run \
		--detach \
		--rm \
		--interactive \
		--tty \
		--name prom \
		--hostname prom \
		--net ${DOCKER_NETWORK_NAME} \
		--publish 9090:9090 \
		--mount type=bind,source=${PWD}/prometheus.yml,target=/etc/prometheus/prometheus.yml \
		prom/prometheus:${DOCKER_PROMETHEUS_TAG}

grafana: network
	docker run \
		--detach \
		--rm \
		--interactive \
		--tty \
		--name grafana \
		--hostname grafana \
		--net ${DOCKER_NETWORK_NAME} \
		--publish 3000:3000 \
		grafana/grafana:${DOCKER_GRAFANA_TAG}

# $1：docker container name
define docker-stop
	docker container ls --quiet --filter 'name=$1' \
		| xargs -I {} docker container stop {}
endef

clean:
	$(call docker-stop,prom)
	$(call docker-stop,grafana)
	docker network ls --quiet --filter 'name=${DOCKER_NETWORK_NAME}' | xargs -I {} docker network rm {}
