# syntax=docker/dockerfile:1
FROM public.ecr.aws/nginx/nginx:latest
MAINTAINER akshaykrjain.github.io
RUN ["/bin/bash", "-c", "echo \"<title>Hello There!</title><h1>Hello from a great docker based app :)</h1>\" > /usr/share/nginx/html/index.html"]
