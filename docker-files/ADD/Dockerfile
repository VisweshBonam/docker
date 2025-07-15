FROM almalinux:9
RUN dnf install nginx -y
RUN rm -rf /usr/share/nginx/index.html
ADD https://raw.githubusercontent.com/daws-84s/notes/refs/heads/main/demo.txt /usr/share/nginx/index.html
RUN chmod +r /usr/share/nginx/index.html
CMD ["nginx", "-g", "daemon off;"]