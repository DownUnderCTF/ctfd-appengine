FROM ctfd/ctfd

COPY ./uploaders.py /opt/CTFd/CTFd/utils/uploads/uploaders.py
COPY ./auth.py /opt/CTFd/CTFd/auth.py
COPY ./config.ini /opt/CTFd/CTFd/config.ini
COPY ./favicon.ico /opt/CTFd/CTFd/themes/core/static/img/favicon.ico
COPY ./docker-entrypoint.sh /opt/CTFd/docker-entrypoint.sh

RUN chmod +x /opt/CTFd/docker-entrypoint.sh
