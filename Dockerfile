FROM ubuntu:20.04
RUN apt-get -y update
RUN echo "deb http://security.ubuntu.com/ubuntu bionic-security main" >>  /etc/apt/sources.list
RUN apt update && apt-cache policy libssl1.0-dev
RUN apt-get install libssl1.0-dev -y
RUN apt-get install python3 -y
RUN apt-get install python3-pip -y
ADD ./ /opt
EXPOSE 8080
WORKDIR /opt
RUN pip install -r requirements.txt
CMD ["python3", "app.py"]
