FROM php:7.3-fpm-alpine

# -D user without password
# -G add to group
RUN addgroup developer && adduser -D -G developer developer

WORKDIR /app

COPY app /app

RUN chown -R developer:developer /app

COPY cmd.sh /

RUN chmod +x /cmd.sh

EXPOSE 5000

USER developer


ENTRYPOINT ["/cmd.sh"]