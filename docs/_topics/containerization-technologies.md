---
title: Computer Networks
render_with_liquid: false
---

# Containerization Technologies

System containers (lightweight VM-like):\
`LXC/LXD`

Container runtimes / clients: \
`Docker` \| `Podman`

Local multi-service composition:
`Docker Compose` \| `Kubernetes`

Full Kubernetes distributions / enterprise & managed K8s:\
`OpenShift` \
`EKS (Amazon Elastic Kubernetes Service)`\
`GKE (Google Kubernetes Engine)`\
`AKS (Azure Kubernetes Service)`

Lightweight/local Kubernetes for dev & edge:\
`Minikube` \| `Kind` \| `K3s` \| `MicroK8s`

Kubernetes management / multi-cluster:\
`Rancher`

Alternative schedulers / orchestrators (non‑Kubernetes):\
`Mesos` \| `Nomad` \| `ECS (Amazon Elastic Container Service)`


## Docker Compose vs Kubernetes

Use `Docker Compose` 
- for local development/test environments
- simple single-host stacks, quick prototypes
- your team wants minimal ops overhead

Use `Kubernetes` 
- for production-grade
- multi-node orchestration with advanced features (scaling, self‑healing, service mesh, operators)
- fine-grained scheduling, autoscaling, complex networking
- run many services in production
- you want to adopt cloud-native patterns, operators, service meshes, or large-scale deployments


<table class="table table-hover table-bordered">
  <thead>
    <tr>
      <th>Feature</th>
      <th>Docker Compose</th>
      <th>Kubernetes</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Purpose</strong></td>
      <td>Lightweight tool to define and run multi-container apps on a single Docker host (development & simple deployments).</td>
      <td>Full container orchestration platform for running containers across many hosts with declarative APIs, scheduling, and a large ecosystem.</td>
    </tr>
    <tr>
      <td><strong>Scope</strong></td>
      <td>Service composition, basic networking, volumes, environment variables, simple scaling on a single host.</td>
      <td>Scheduling, rolling updates, autoscaling, service discovery, complex networking, persistent volumes, secrets, RBAC, autoscalers, controllers/operators.</td>
    </tr>
    <tr>
      <td colspan="3"><strong>Feature-by-feature comparison</strong></td>
    </tr>
    <tr>
      <td><strong>Deployment model</strong></td>
      <td>docker-compose.yml (imperative up/down, or declarative file used by the CLI).</td>
      <td>YAML manifests (Deployments, Services, StatefulSets, DaemonSets, Jobs) applied with kubectl or via controllers.</td>
    </tr>
    <tr>
      <td><strong>Scaling</strong></td>
      <td>Can run multiple replicas with <code>docker compose up --scale</code> (single host). <code>deploy.replicas</code> in compose file is for Swarm, not for standalone docker-compose.</td>
      <td>Horizontal Pod Autoscaler (HPA) across cluster nodes using metrics (CPU/memory/custom).</td>
    </tr>
    <tr>
      <td><strong>Scheduling &amp; multi-node</strong></td>
      <td>Limited to one host (unless you use Swarm or other tooling).</td>
      <td>Schedules pods across multiple nodes with constraints (nodeSelector, taints/tolerations, affinities).</td>
    </tr>
    <tr>
      <td><strong>High availability &amp; self-healing</strong></td>
      <td>Restarts on failure on the same host; needs external tooling for HA.</td>
      <td>Built-in health checks (readiness/liveness), restarts, rescheduling on node failure.</td>
    </tr>
    <tr>
      <td><strong>Networking &amp; load balancing</strong></td>
      <td>Simple user-defined networks and port mappings.</td>
      <td>ClusterIP, NodePort, LoadBalancer types, Ingress controllers, CNI plugins for advanced networking.</td>
    </tr>
    <tr>
      <td><strong>Storage</strong></td>
      <td>Volumes bound to host or volume drivers; limited portability.</td>
      <td>PersistentVolumes + PersistentVolumeClaims with many provisioners (cloud disks, NFS, CSI drivers).</td>
    </tr>
    <tr>
      <td><strong>Configuration &amp; secrets</strong></td>
      <td>Env files, environment variables, simple secrets via files or environment.</td>
      <td>ConfigMaps and Secrets, RBAC-controlled access, encryption at rest options.</td>
    </tr>
    <tr>
      <td><strong>Observability &amp; ecosystem</strong></td>
      <td>Limited built-in tooling — rely on Docker tooling and ad-hoc solutions.</td>
      <td>Large ecosystem — Prometheus, Grafana, Jaeger, service meshes (Istio/Linkerd), operators, Helm charts.</td>
    </tr>
    <tr>
      <td><strong>Complexity &amp; ops</strong></td>
      <td>Simple to learn and operate.</td>
      <td>Significantly higher learning curve and operational overhead (cluster control plane, upgrades, security, networking).</td>
    </tr>
</table>
