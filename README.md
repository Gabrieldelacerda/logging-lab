# Logging Lab

Fourth project in a series building a complete DevOps pipeline from scratch. Infrastructure, CI/CD, and metrics were already covered — this one adds logs.

## What it does

Nginx containers ship logs to Fluent Bit via Docker's fluentd driver. Fluent Bit forwards everything to Loki. Grafana queries Loki as a second data source alongside Prometheus and displays the logs with label filtering by status code, path and method.

There's also an alert rule for 5xx errors.

## Stack

- **Fluent Bit** — log collection agent
- **Loki** — log storage and querying
- **Grafana** — already running from the observability stack, Loki added as a data source

## Running

```bash
bash start.sh
```

Loki on port 3100, Fluent Bit on 24224.

## Note

The fluentd logging driver change lives in nginx-multisite-lab's docker-compose.yml. Both stacks need to be running for logs to flow.

## Related projects

- [Project 1 — nginx-multisite-lab](https://github.com/Gabrieldelacerda/nginx-multisite-lab)
- [Project 2 — cicd-pipeline-aws](https://github.com/Gabrieldelacerda/cicd-pipeline-aws)
- [Project 3 — observability-lab](https://github.com/Gabrieldelacerda/observability-lab)
