FROM node:22-alpine AS build

WORKDIR /app

# Same-origin /api (proxied by nginx to the backend container).
ARG VITE_API_BASE_URL=/api
ENV VITE_API_BASE_URL=$VITE_API_BASE_URL

COPY package.json package-lock.json ./
RUN npm ci

COPY . .
RUN npm run build

FROM nginxinc/nginx-unprivileged:alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --chown=nginx:nginx --from=build /app/dist/ /usr/share/nginx/html/

EXPOSE 8080

# The image runs as the non-root nginx user supplied by the base image.
USER nginx

# Checks that Nginx can load the configuration used in production. The VM
# workflow also calls /healthz through the published port after each deploy.
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 CMD nginx -t || exit 1
