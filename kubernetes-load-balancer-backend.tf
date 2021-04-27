resource "kubernetes_service" "backend-service" {
  metadata {
    name      = "backend-service"
    namespace = kubernetes_namespace.capstone-namespace.metadata[0].name
  }
  spec {
    selector = {
      App = kubernetes_deployment.backend-deployment.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = 8082
      target_port = 8082
    }

    type = "LoadBalancer"
  }
}


output "lb_status_back" {
  value = kubernetes_service.backend-service.status
}
