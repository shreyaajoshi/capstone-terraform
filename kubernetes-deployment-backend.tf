resource "kubernetes_deployment" "backend-deployment" {
  metadata {
    name = "backend-deployment"
    labels = {
      App = "capstone-app"
    }
    namespace = kubernetes_namespace.capstone-namespace.metadata[0].name
  }

  spec {
    replicas                  = 1
    progress_deadline_seconds = 60
    selector {
      match_labels = {
        App = "capstone-app"
      }
    }
    template {
      metadata {
        labels = {
          App = "capstone-app"
        }
      }
      spec {
        container {
          image = "drehnstrom/events-internal-deloitte:v1.0"
          name  = "capstone-backend"

          port {
            container_port = 8082
          }

          resources {
            limits = {
              cpu    = "0.2"
              memory = "2562Mi"
            }
            requests = {
              cpu    = "0.1"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}