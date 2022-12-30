ARG BUILD_IMAGE_NAME
FROM BUILD_IMAGE_NAME
RUN touch test1
WORKDIR /tmp
CMD ["echo", "hii hello"]

