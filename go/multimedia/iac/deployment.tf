resource "helm_release" "grpc_multimedia_release" {
  name            = var.project_name
  chart           = "edwynrrangel/grpc-server"
  namespace       = var.namespace
  version         = "0.1.0"
  cleanup_on_fail = true
  lint            = true
  timeout         = 60
  
  set {
    name  = "global.enabled"
    value = "true"
  }

  set {
    name  = "global.projectName"
    value = var.project_name
  }

  set {
    name  = "global.clusterName"
    value = var.cluster_name
  }

  set {
    name  = "global.namespace"
    value = var.namespace
  }

  set {
    name  = "global.image.repository"
    value = "edwynrangel/multimedia"
  }

  set {
    name  = "global.image.tag"
    value = "latest"
  }

  set {
    name  = "global.image.pullPolicy"
    value = "Always"
  }

  set {
    name = "app.replicaCount"
    value = "1"
  }

  set {
    name = "app.autoscaling.enabled"
    value = "false"
  }

  set {
    name = "app.service.type"
    value = "NodePort"
  }

  set {
    name = "app.service.name"
    value = "grpc"
  }

  set {
    name = "app.service.port"
    value = "50051"
  }

  set {
    name = "app.service.targetPort"
    value = "50051"
  }

  set {
    name = "app.service.nodePort"
    value = "30051"
  }

  set {
    name = "app.env[0].name"
    value = "MONGO_HOST"
  }

  set {
    name = "app.env[0].value"
    value = "${data.terraform_remote_state.infra.outputs.banking_service_mongodb_url}"
  }

  set {
    name = "app.env[1].name"
    value = "MONGO_PORT"
  }

  set {
    name = "app.env[1].value"
    value = "27017"
  }

  set {
    name = "app.env[2].name"
    value = "MONGO_DB"
  }

  set {
    name = "app.env[2].value"
    value = "multimedia"
  }

  set {
    name = "app.env[3].name"
    value = "MONGO_TLS"
  }

  set {
    name = "app.env[3].value"
    value = "true"
  }

  set {
    name = "app.secrets[0].secretKey"
    value = "MONGO_USERNAME"
  }

  set {
    name = "app.secrets[0].secretName"
    value = var.multimedia_app_secrets
  }

  set {
    name = "app.secrets[1].secretKey"
    value = "MONGO_PASSWORD"
  }

  set {
    name = "app.secrets[1].secretName"
    value = var.multimedia_app_secrets
  }

  set {
    name = "app.secrets[2].secretKey"
    value = "MONOG_TLS_CA"
  }

  set {
    name = "app.secrets[2].secretName"
    value = var.multimedia_app_secrets
  }

  set {
    name = "app.securityContext.runAsUser"
    value = "1000"
  }

  set {
    name = "app.securityContext.runAsGroup"
    value = "1000"
  }

  set {
    name = "app.resources.requests.memory"
    value = "200Mi"
  }

  set {
    name = "app.resources.requests.cpu"
    value = "75m"
  }

  set {
    name = "app.resources.limits.memory"
    value = "384Mi"
  }

  set {
    name = "app.resources.limits.cpu"
    value = "100m"
  }
}