FROM debian:bookworm-slim

# Paquetes mínimos (bash para nuestros scripts)
RUN apt-get update && \
    apt-get install -y --no-install-recommends bash ca-certificates tzdata && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copiamos solo lo necesario
COPY scripts/ scripts/
COPY docker/entrypoint.sh /entrypoint.sh

# Permisos
RUN chmod +x /app/scripts/health.sh /entrypoint.sh

# Variables por defecto
ENV HEARTBEAT_SECONDS=300

# Volumen para logs (se montará desde el host)
VOLUME ["/logs"]

ENTRYPOINT ["/entrypoint.sh"]
