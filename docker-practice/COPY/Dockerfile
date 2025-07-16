FROM visweshbonam/cmd:v1
RUN rm -rf /usr/share/nginx/html/index.html
COPY index.html /usr/share/nginx/html/index.html
# CMD ["sleep", "1000"] #I already configured visweshbonam/cmd:v1 with nginx serever and started, so if i again give here sleep, it will take 2 cmd,if we give multiple commands in single docker file, it takes last command
