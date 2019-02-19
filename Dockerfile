FROM centos:7

ADD . /metaBoot
WORKDIR /metaBoot
CMD ["./test.sh"]


