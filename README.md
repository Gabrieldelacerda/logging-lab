# Logging Lab

This project builds a centralized logging pipeline for the Nginx multi-site lab using Fluent Bit, Loki and Grafana.

Nginx sends its container logs through Docker's Fluentd logging driver to Fluent Bit. Fluent Bit parses the Nginx access logs and forwards them to Loki with labels such as HTTP method, path and status code.

The pipeline was validated end to end with real requests to the Nginx container. Logs were successfully parsed and queried in Loki using labels such as `status="200"`.

Grafana connects to Loki through the observability stack. The Loki datasource and the Nginx 5xx alert rule are provisioned automatically from configuration stored in the observability-stack-lab repository.

The alerting flow was also tested with a controlled HTTP 500 response. The event reached Loki with `status="500"` and Grafana activated the 5xx alert successfully.

The main stack is Fluent Bit 5.1.2, Loki 2.9.0, Grafana, Nginx and Docker Compose.

To start the complete local environment:

bash start.sh

The script starts the observability stack, the logging stack and nginx-multisite-lab-V2.

Loki listens on port 3100 and Fluent Bit receives logs on port 24224.
