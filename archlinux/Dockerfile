FROM archlinux:latest

# Installing minimum deps

RUN packman -Syu
RUN packman -S git

RUN git clone https://github.com/Phreno/.dotfiles.git /home/root/.dotfiles

WORKDIR /home/root/.dotfiles/archlinux
RUN chown -R root:root ./
RUN chmod +x setup.sh
RUN ./setup.sh
