FROM python:2.7

RUN apt-get update && apt-get install -y \
    python-software-properties \
    supervisor \
    nginx


# Supervisor and uwsgi logs go here
RUN mkdir logs

# If you want to set other environmental variables this is how you do it
ENV TERM dumb

# Move all files to Docker's code directory
COPY . /home/docker/code

# run pip install so the container has the packages you need
RUN pip install -r /home/docker/code/requirements.txt

# setup all the config files
RUN rm /etc/nginx/sites-enabled/default
RUN ln -s /home/docker/code/nginx.conf /etc/nginx/conf.d/
RUN ln -s /home/docker/code/supervisord.conf /etc/supervisor/conf.d/

EXPOSE 80

CMD ["supervisord", "-n"]