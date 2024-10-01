# terraform/main.tf
provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_deployment" "app" {
  metadata {
    name = "nodejs-app"
  }
  spec {
    replicas = 3
    selector {
      match_labels = {
        app = "nodejs-app"
      }
    }
    template {
      metadata {
        labels = {
          app = "nodejs-app"
        }
      }
      spec {
        container {
          image = "my-react-app-emmanueliyanda>/nodejs-app:latest"
          name  = "app"
          port {
            container_port = 3000
          }
        }
      }
    }
  }
}
