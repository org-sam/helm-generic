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
    └── configmap.yaml       # ConfigMap (opcional)
    └── externalsecret.yaml       # External Secret (opcional)
```

## Exemplo de uso

```bash
helm install frontend ./generic-front \
  --set image.repository=minha-app \
  --set image.tag=v1.0.0 \
  --set container.name=frontend
```

