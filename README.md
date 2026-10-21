# Event Management Frontend

React Single Page Application for University Event Management System.

- **Published Image:** `ghcr.io/induwara90/event-management-frontend:latest`
- **Default Port:** `8080` (serves the SPA and reverse-proxies `/api` and `/uploads` to backend)

## Local Development

```bash
npm install
npm run dev
```

For testing the full stack with backend and MySQL, use the root workspace `docker-compose.yml`:
```bash
docker compose up -d
```

- App UI: `http://localhost:8080`
- API (proxied): `http://localhost:8080/api`

## Automated VM Deployment

CI/CD is automated using GitHub Actions (`.github/workflows/publish-frontend.yml`):
1. On `git push origin main`, GitHub Actions builds the production React bundle + Nginx image and pushes it to GHCR.
2. It automatically SSHs into the production VM and restarts the frontend container with zero downtime.
