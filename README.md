# Event Management frontend

Published image: `ghcr.io/induwara90/event-management-frontend:latest`.

Production builds call the API at same-origin `/api`. Nginx inside the image proxies `/api` and `/uploads` to the `backend` service on the Docker network.

## Local UI only

```bash
docker compose up -d --build
```

Full stack (MySQL + API + UI) from the parent workspace or the backend `deploy/` folder:

```bash
docker compose up -d
```

- App: http://localhost:8080
- API (direct): http://localhost:8081

## CI/CD

Push to `main` → GitHub Actions builds/pushes the image → SSHs to the VM and runs `/opt/event-management/deploy.sh`.

Required secrets: `VM_HOST`, `VM_USER`, `VM_SSH_PRIVATE_KEY` (same as backend). See backend `DEPLOY.md`.
