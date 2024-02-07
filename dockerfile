FROM debian

RUN apt-get update
RUN apt install nodejs npm -y

EXPOSE 5173 
EXPOSE 80