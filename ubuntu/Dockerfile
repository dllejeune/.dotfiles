FROM ubuntu:latest

# Installing minimum deps
RUN apt-get -qq update
RUN apt-get install git -y

## Create test user and add to sudoers
#RUN useradd -m -s /bin/sh tester
#RUN usermod -aG sudo tester
#RUN echo "tester   ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers
#RUN echo "alias python='python3'" >> /home/tester/.bashrc

## Switch testuser
#USER tester
#ENV HOME /home/tester


RUN git clone https://github.com/Phreno/.dotfiles.git /home/root/.dotfiles

WORKDIR /home/root/.dotfiles/ubuntu
RUN chown -R root:root ./
RUN chmod +x ubuntu-setup.sh
RUN ./ubuntu-setup.sh
