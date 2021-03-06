# CPU Stress

Quick and dirty container to increase CPU load on a Mesos cluster.

## Endpoints

- `GET /health`: Always returns `200 OK`. Doesn't ever return in practice due to CPU stress.

## Development

Developing locally in debug mode is recommended because this will automatically restart the webserver when files are changed. This is much faster than rebuilding the Docker image. However, this mode allows arbitrary code execution on the server and has very low performance. Do not use this in production.

`make develop`

## Build

`make build`

## Run

`make run`

