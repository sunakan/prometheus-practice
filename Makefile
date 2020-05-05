exporter-up:
	cd exporter-side && make up

prom-up:
	cd prometheus-side && make up

clean:
	cd prometheus-side && make clean
	cd exporter-side && make clean
