TAG="python-crontab-in-docker:dev"

build:
	docker build . -t ${TAG}

run:
	docker run -it --rm ${TAG} bash
