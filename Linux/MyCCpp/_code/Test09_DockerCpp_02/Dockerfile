FROM ubuntu:latest

RUN apt-get -y update && apt-get install -y
RUN apt-get -y install clang

COPY . /usr/src/cpp_test2
WORKDIR /usr/src/cpp_test2

RUN clang++ -o Test2 main.cpp
CMD [ "./Test2" ]