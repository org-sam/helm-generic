# Helm Generic

Chart Helm genérico para deploy de aplicações.

## Descrição

Este repositório contém um chart Helm reutilizável para deploy de aplicações em clusters Kubernetes.

## Estrutura do Projeto

```
generic-front/
├── Chart.yaml          # Metadados do chart
├── values.yaml         # Valores padrão
└── templates/
    ├── _helpers.tpl    # Templates auxiliares
    ├── deployment.yaml # Deployment da aplicação
    ├── service.yaml    # Service Kubernetes
    └── ingress.yaml    # Ingress (opcional)
    └── scaledobject.yaml    # Keda (opcional)
```

## Configuração

### Valores principais

```yaml
# Configuração da imagem
image:
  repository: "nginx"
  tag: "latest"
  pullPolicy: IfNotPresent

# Configuração do container
container:
  name: "frontend"
  port: 3000

# Réplicas
replicaCount: 1

# Service
service:
  enabled: true
  type: ClusterIP
  port: 80
  targetPort: 3000

# Ingress (opcional)
ingress:
  enabled: false
  className: "alb"
  hosts:
    - host: "exemplo.com"
      paths:
        - path: /
          pathType: Prefix

# KEDA (opcional)
autoscaling:
  enabled: false
  minReplicas: 1
  maxReplicas: 5
  triggers:
    - type: cpu
      metricType: Utilization
      metadata:
        value: "70"
```

### Exemplo de uso

```bash
helm install frontend ./generic-front \
  --set image.repository=minha-app \
  --set image.tag=v1.0.0 \
  --set container.name=frontend
```

