# In some exceptional case, ARG can be the first instruction to supply version to base OS In FROM, but u can't use that version after FROM
# docker run -d visweshbonam/arg:v1 --build-arg version=8

ARG version 

FROM almalinux:${version}


ENV course="DevOps" \
    trainer="shivakumar"

# ARG variables are build time variables, we can see them only when we execute build command, but once we run the container and login to the container, we cannot see them
ARG duration="120hrs"  

RUN echo "Hi, Course is: ${course} , trainer is : ${trainer} , and duration is ${duration}"

CMD ["sleep", "1000"]