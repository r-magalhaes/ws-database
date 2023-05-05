FROM postgres

ARG POSTGRES_PASS

ENV POSTGRES_PASSWORD $POSTGRES_PASS

COPY database.sql /docker-entrypoint-initdb.d