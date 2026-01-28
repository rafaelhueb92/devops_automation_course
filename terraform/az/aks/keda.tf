resource "kubernetes_namespace" "keda" {
  metadata {
    name = "keda"
  }
}

resource "helm_release" "keda" {
  name       = "keda"
  namespace  = kubernetes_namespace.keda.metadata[0].name
  repository = "https://kedacore.github.io/charts"
  chart      = "keda"
  version    = "2.13.2"

  set {
    name  = "replicaCount"
    value = 1
  }

  depends_on = [kubernetes_namespace.keda]
}
