FROM almalinux:9
RUN dnf install nginx -y
RUN rm -rf /usr/share/nginx/index.html
ADD https://www.facebook.com /usr/share/nginx/index.html
CMD ["nginx", "-g", "daemon off;"]