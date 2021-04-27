resource "kubernetes_namespace" "capstone-namespace" {
  metadata {
    name = "capstone-app"
  }
}