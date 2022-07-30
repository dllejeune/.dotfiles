FROM ubuntu:latest

# Installing minimum deps
RUN apt-get -qq update
RUN apt-get install git -y

RUN git clone https://github.com/Phreno/.dotfiles.git /home/root/.dotfiles

WORKDIR /home/root/.dotfiles/ubuntu
RUN chown -R root:root ./
RUN chmod +x setup.sh
RUN ./setup.sh
