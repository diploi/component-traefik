<img alt="icon" src=".diploi/icon.svg" width="32">

# Traefik Component for Diploi

### NOTE! Experimental, not yet released

[![launch with diploi badge](https://diploi.com/launch.svg)](https://diploi.com/component/traefik)
[![component on diploi badge](https://diploi.com/component.svg)](https://diploi.com/component/traefik)
[![latest tag badge](https://badgen.net/github/tag/diploi/component-traefik)](https://diploi.com/component/traefik)

Launch a trial, no registration needed
https://diploi.com/component/traefik

Uses the official [Traefik](https://hub.docker.com/_/traefik) Docker image.

This component provides Traefik as a reverse proxy and load balancer with file-based configuration support.

## Operation

### Getting started

1. **Sign up** at `https://console.diploi.com/` using your GitHub account.
2. In your dashboard, click **Create Project +**
3. Under **Pick Components**, choose **Traefik**  
   If you want to expand your Traefik setup with other tools, like databases or monitoring, here you can add them.
4. In **Pick Add-ons**, select any databases or tools supported on Diploi.
5. In **Repository**, choose **Create Repository** which will generate a new GitHub repo for you.
6. Click **Launch Stack**

### Configuration

The base Traefik configuration is loaded from `traefik.yml` in the root of the component. This file contains:

- Entry point is HTTP on port 80 (Diploi will take care of https)
- API and Dashboard configuration (port 8080) (NOTE! Disabled)
- File provider for dynamic configuration
- Kubernetes provider for automatic service discovery
- Logging configuration

#### Customizing Configuration

You can customize the Traefik configuration by:

1. **Editing `traefik.yml`**: Modify the base static configuration file
2. **Adding dynamic configuration**: Place YAML files in the `dynamic/` directory for routers, middlewares, and services

### Development

Traefik runs with the same configuration in both development and production environments. The configuration file is mounted as a ConfigMap in Kubernetes.

### Production

Traefik runs as a Deployment in production with the configuration loaded from the `traefik.yml` file. The dashboard is accessible on port 8080 (DISABLED FOR NOW).

## Links

- [Adding Traefik to a project](https://docs.diploi.com/building/components/traefik)
- [Traefik documentation](https://doc.traefik.io/traefik/)
- [Traefik file provider](https://doc.traefik.io/traefik/providers/file/)
