image:
	docker login docker.io
	docker build -f ./Dockerfile \
		-t docker.io/goforbroke1006/l4d2-server:latest \
		.
	docker push docker.io/goforbroke1006/l4d2-server:latest
