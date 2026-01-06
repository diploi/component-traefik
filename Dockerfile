FROM traefik:v3.0

# This will be set by the GitHub action to the folder containing this component.
ARG FOLDER=/app

# Copy everything to a staging location
COPY . /tmp/build-context

# Create directory for Traefik configuration
RUN mkdir -p /etc/traefik/dynamic

# Conditionally copy everything based on FOLDER variable
# If FOLDER=/app, copy everything from root to /etc/traefik
# If FOLDER=/app/myfolder, copy everything from that folder to /etc/traefik
RUN \
  if [ "$FOLDER" = "/app" ]; then \
    shopt -s dotglob && \
    cp -r /tmp/build-context/* /etc/traefik/ ; \
  else \
    SOURCE_DIR="/tmp/build-context${FOLDER#/app}"; \
    if [ -d "$SOURCE_DIR" ]; then \
      shopt -s dotglob && \
      cp -r "$SOURCE_DIR"/* /etc/traefik/ ; \
    fi ; \
  fi && \
  rm -rf /tmp/build-context

# Expose Traefik ports
EXPOSE 80

# Run Traefik with the configuration file
CMD ["traefik", "--configfile=/etc/traefik/traefik.yml"]
