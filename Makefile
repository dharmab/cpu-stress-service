.PHONY: default run build develop

default: run

run: build
	docker run -it --rm \
	-p 5000:5000 \
	-e NUMBER_OF_CPUS=$$NUMBER_OF_CPUS \
	cpu-stress

build:
	docker build -t cpu-stress .

develop: build
	docker run -it --rm \
	-p 5000:5000 \
	-v $(shell pwd):/app \
	-e FLASK_APP=/app/cpu_stress.py \
	-e FLASK_DEBUG=1 \
	-e NUMBER_OF_CPUS=$$NUMBER_OF_CPUS \
	cpu-stress \
	flask run --host=0.0.0.0
