# Pedido App 

## Información del Proyecto
- **Universidad:** Universidad de La Sabana  
- **Facultad:** Facultad de Ingeniería  
- **Materia:** Patrones Arquitectónicos Avanzados 

## Integrantes del Proyecto
| Nombre | Correo Electrónico |
|--------|-------------------|
| Valentina Alejandra López Romero | valentinalopro@unisabana.edu.co |
| Laura Camila Rodriguez Leon | laurarodleo@unisabana.edu.co |
| Mariana Valle Moreno | marianavamo@unisabana.edu.co |

## Estructura de la Documentación
Este repositorio contiene los manifiestos de Kubernetes y el Helm Chart para desplegar la aplicación **Pedido App** (Frontend + Backend + PostgreSQL).

- [Instalación del Chart con Helm](instalación-del-chart-con-helm)
- [Endpoitns de Acceso](endpoints-de-acceso)

---

## Instalación del Chart con Helm
### 1. Clonar el repositorio
```bash
git clone https://github.com/milazroleon/pedido-app.git
cd pedido-app/charts/pedido-app
```
### 2. Levantar Minikube
```bash
minikube start --driver=docker --memory=2200mb --cpus=2
minikube addons enable ingress
minikube addons enable metrics-server
```
### 3. Actualizar dependencias
```bash
helm dependency update
```
### 4. Instalar en entorno dev
```bash
helm upgrade --install pedido-dev . -f values-dev.yaml
```
### 5. Instalar en entorno prod
```bash
helm upgrade --install pedido-prod . -f values-prod.yaml
``` 
### 6. Abrir el túnel de Minikube
```bash
minikube tunnel
```
### 7. Ver estado de los recursos
```bash
kubectl get pods,svc
```
---

## Endpoints de Acceso
### 1. Obtener la IP del Ingress Controller
```bash
kubectl get ingress
```
- **Frontend**: http://<EXTERNAL_IP>/
- **Backend**:
  - Para listar preguntas: http://<EXTERNAL_IP>/questions
  - Para listar respuestas de una pregunta: http://<EXTERNAL_IP>/questions/{id}/answers




