resource "kubernetes_service" "frontend-service" {
  metadata {
    name      = "frontend-service"
    namespace = kubernetes_namespace.capstone-namespace.metadata[0].name
  }
  spec {
    selector = {
      App = kubernetes_deployment.frontend-deployment.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = 80
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}


output "lb_status_front" {
  value = kubernetes_service.frontend-service.status
}
