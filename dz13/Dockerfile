FROM alpine:3.19.1
RUN apk update && apk upgrade \
	&& apk add --no-cache nginx
COPY default.conf /etc/nginx/http.d/ 
COPY index.html /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

