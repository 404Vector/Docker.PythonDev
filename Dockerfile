FROM python:3.11.1

# update and install requirements
RUN apt-get update -y && \
    apt-get install -y openssh-server wget net-tools nano && \
    apt install -y tmux git && \
    pip install pipenv

# copy local file
COPY sshd_config /etc/ssh/sshd_config
COPY start_macro.py /start_macro.py

# python print speed up
ENV PYTHONUNBUFFERED 0

#set password
RUN echo 'root:root' |chpasswd

#make .ssh
RUN mkdir /root/.ssh

# expose port
EXPOSE 22

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# cmd
ENTRYPOINT ["/bin/sh", "-c", "python3 start_macro.py & /bin/bash"]
