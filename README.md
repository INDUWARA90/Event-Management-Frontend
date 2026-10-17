# Event Management frontend

The published image is `ghcr.io/induwara90/event-management-frontend:latest`.

This UI calls the backend at `http://localhost:8081/api`. Run MySQL + backend with the workspace or backend `docker-compose.yml` so that port is live.

## Run with the GitHub image

From this folder (UI only):

```bash
docker compose up -d --no-build
```

From the parent `Event Managemnet` folder (frontend + backend + MySQL):

```bash
docker compose up -d --no-build
```

- Frontend: http://localhost:8080
- Backend API: http://localhost:8081
