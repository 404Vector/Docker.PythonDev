FROM python:3.11.1

# python print speed up
ENV PYTHONUNBUFFERED 0

# update and install requirements
RUN apt-get update -y && \
    apt-get install -y openssh-server wget net-tools nano && \
    apt install -y tmux git && \
    pip install pipenv

# copy local file
COPY sshd_config /etc/ssh/sshd_config

# change directory to /mlflow
WORKDIR /mlflow

# expose port
EXPOSE 22

# cmd
CMD ["service", "ssh", "start"]
