export VAGRANT_PROMETHEUS_TAG=v2.17.2

prom:
	docker run \
		--rm \
		--interactive \
		--tty \
		--name prom \
		--hostname prom \
		--publish 9090:9090 \
		--mount type=bind,source=${PWD}/prometheus.yml,target=/etc/prometheus/prometheus.yml \
		prom/prometheus:${VAGRANT_PROMETHEUS_TAG}
