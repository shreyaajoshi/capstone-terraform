resource "kubernetes_deployment" "frontend-deployment" {
  metadata {
    name = "frontend-deployment"
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
          image = "drehnstrom/events-external-deloitte:v1.0"
          name  = "capstone-frontend"

        env {
            name  = "SERVER"
            value = "http://backend-service:8082"
          }

          port {
            container_port = 8080
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