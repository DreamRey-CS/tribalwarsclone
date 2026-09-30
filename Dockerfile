FROM nimmis/apache-php5

RUN apt-get update && apt-get install -y \
        mysql-client \
        php5-mysql
# [Optional] Helpers
RUN apt-get install -y \
        vim \
        bash
ADD app/ /usr/src/tribalwars/
RUN rm -rf /usr/src/tribalwars/templates_c/* /usr/src/tribalwars/tribalwars/wereld1/templates_c/* /usr/src/tribalwars/tribalwars/wereld1/admin/templates_c/*
ADD scripts/initcron.sh /usr/src/tribalwars-scripts/
RUN chmod +x /usr/src/tribalwars-scripts/initcron.sh
WORKDIR /usr/src/tribalwars
RUN ["/bin/bash", "/usr/src/tribalwars-scripts/initcron.sh"]
CMD cron && php -S 0.0.0.0:80
