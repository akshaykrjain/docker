# syntax=docker/dockerfile:1
FROM public.ecr.aws/nginx/nginx:latest
MAINTAINER akshayjain.ecb@gmail.com
RUN ["/bin/bash", "-c", "echo \"<title>Hello There!</title><h1>Hello from Even Greater App</h1>\" > /usr/share/nginx/html/index.html"]
