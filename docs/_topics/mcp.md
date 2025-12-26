---
title: MCP
render_with_liquid: false
---

# `MCP`: Model Control Plane

`backend service that hosts and orchestrates AI models and the agent capabilities`

`the management layer that controls models and routing (model selection, versions, telemetry, access, policy, deployments)`

- it’s about operational control, policy, orchestration and governance

## `Github's MCP`:
- used by GitHub Copilot CLI
- hosts models, routes requests, and manages model selection and versioning
- runs multistep plans, tool integrations, and agent workflows
- enforces access control, data handling rules, and auditing
- lets organizations plug in custom models, tools, or connectors
- collects usage, logs, and performance metrics

## Other Example Products:
- `Seldon Core` - Open-source ML deployment platform with a control plane for managing model serving
- `Google Vertex AI` - GCP's unified ML platform with model deployment management
- `Azure Machine Learning` - Microsoft's MLOps platform with model management capabilities



# `MCP`: Model Context Protocol

`a structured envelope for what you send to / receive from a model (messages, resources, provenance, controls)`

- it’s about input/output data shape, provenance and runtime constraints

The terms "MCP" refer to two different concepts in AI and cloud/Kubernetes contexts:


# **Key Differences Summary**: Model Control Plane vs Model Context Protocol

| Aspect      | Model Control Plane       | Model Context Protocol       |
|-------------|---------------------------|------------------------------|
| **Purpose** | Deploy & manage models    | Connect models to data/tools |
| **Layer**   | Infrastructure/Operations | Application/Integration      |
| **Focus**   | Model lifecycle & serving | Context & information access |
| **Users**   | ML Engineers, DevOps      | AI App Developers            |
| **Scope**   | Production ML systems     | AI assistant integrations    |


