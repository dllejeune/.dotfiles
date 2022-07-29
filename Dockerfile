FROM ubuntu:latest

# Installing minimum deps
RUN apt-get -qq update
RUN apt-get install git -y

# Create test user and add to sudoers
RUN useradd -m -s /bin/sh tester
RUN usermod -aG sudo tester
RUN echo "tester   ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers


# Switch testuser
USER tester
ENV HOME /home/tester

WORKDIR /home/tester

RUN git clone https://github.com/Phreno/.dotfiles.git /home/tester/.dotfiles
RUN chmod u+x /home/tester/.dotfiles/ubuntu-setup.sh
RUN /home/tester/.dotfiles/ubuntu-setup.sh
