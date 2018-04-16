FROM ubuntu:trusty
MAINTAINER  ranfeng <ranfeng@chingo.cn>

RUN apt-get update && \
    apt-get install -y --no-install-recommends cron mysql-client && \
    mkdir /backup
	
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV CRON_TIME="0 0 * * *" \
    MYSQL_DB="--all-databases" \
	MAX_BACKUPS=3
ADD run.sh /run.sh
VOLUME ["/backup"]

CMD ["/run.sh"]
