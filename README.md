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

- [1. Instalación del Chart con Helm](#1-instalacion-del-chart-con-helm)
- [2. Endpoints de Acceso](#2-endpoints-de-acceso)

---

## 1. Instalación del Chart con Helm
### 1.1 Clonar el repositorio
```bash
git clone https://github.com/milazroleon/pedido-app.git
cd pedido-app/charts/pedido-app
```
### 1.2 Levantar Minikube
```bash
minikube start --driver=docker --memory=2200mb --cpus=2
minikube addons enable ingress
minikube addons enable metrics-server
```
### 1.3 Actualizar dependencias
```bash
helm dependency update
```
### 1.4 Instalar en entorno dev
```bash
helm upgrade --install pedido-dev . -f values-dev.yaml
```
### 1.5 Instalar en entorno prod
```bash
helm upgrade --install pedido-prod . -f values-prod.yaml
``` 
### 1.6 Abrir el túnel de Minikube
```bash
minikube tunnel
```
### 1.7 Ver estado de los recursos
```bash
kubectl get pods,svc
```

---

## 2. Endpoints de Acceso
### 2.1 Obtener la IP del Ingress Controller
```bash
kubectl get ingress
```
### 2.2 Verficar accesibilidad vía Ingress
- **Frontend**: http://<EXTERNAL_IP>/
- **Backend**:
  - Para listar preguntas: http://<EXTERNAL_IP>/questions
  - Para listar respuestas de una pregunta: http://<EXTERNAL_IP>/questions/{id}/answers
    
---




