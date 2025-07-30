FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# Expose MariaDB default port
EXPOSE 3306

# Start MariaDB
ENTRYPOINT ["/entrypoint.sh"]
