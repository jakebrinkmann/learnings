---
tags: [architecture, principles, cloud-native]
---
# 12-Factor App Methodology

Cloud-native principles for building scalable, resilient web apps.

1. **Codebase**: One codebase tracked in revision control, many deploys.
2. **Dependencies**: Explicitly declare and isolate dependencies.
3. **Config**: Store configuration in the environment (not code).
4. **Backing Services**: Treat backing services (DBs, queues) as attached resources.
5. **Build, Release, Run**: Strictly separate build and run stages.
6. **Processes**: Execute the app as one or more stateless processes.
7. **Port Binding**: Export services via port binding.
8. **Concurrency**: Scale out via the process model.
9. **Disposability**: Maximize robustness with fast startup and graceful shutdown.
10. **Dev/Prod Parity**: Keep development, staging, and production as similar as possible.
11. **Logs**: Treat logs as event streams.
12. **Admin Processes**: Run admin/management tasks as one-off processes.