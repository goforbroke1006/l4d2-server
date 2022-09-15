IMAGE_NAME=docker.io/goforbroke1006/l4d2-server

image:
	docker login docker.io
	docker build -f ./Dockerfile -t ${IMAGE_NAME}:latest .
	docker push ${IMAGE_NAME}:latest
