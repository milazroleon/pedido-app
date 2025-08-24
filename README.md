<<<<<<< HEAD

# Pedido-App Helm Chart

Este repositorio contiene el chart de Helm para desplegar la aplicación **Pedido-App**, que incluye **backend**, **frontend** y **base de datos PostgreSQL**. Está diseñado para integrarse con **ArgoCD** y soportar dos entornos: `dev` y `prod`.



## Instalación manual con Helm

Para instalar el chart manualmente en tu clúster Kubernetes:

1. Clonar el repositorio:

```bash
git clone <URL_DEL_REPOSITORIO>
cd pedido-app
````

2. Instalar el chart en el entorno de desarrollo (`dev`):

```bash
helm install pedido-app-dev ./charts/pedido-app -f values-dev.yaml -n default
```

3. Instalar el chart en el entorno de producción (`prod`):

```bash
helm install pedido-app-prod ./charts/pedido-app -f values-prod.yaml -n default
```

> Nota: `values-dev.yaml` y `values-prod.yaml` permiten configurar parámetros como **imágenes, tags, réplicas, recursos y credenciales** según el entorno.

4. Verificar que los pods estén corriendo:

```bash
kubectl get pods -n default
=======
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
>>>>>>> ee7e4771ad0e33da78ec2e932a6b42a8b7461822
```

---

<<<<<<< HEAD
## Configuración de ArgoCD

Se crearon **dos aplicaciones** en ArgoCD, una para cada entorno:

1. **pedido-app-dev**

   * Rama: `main`
   * Values: `values-dev.yaml`
   * Auto-sync habilitado para reflejar automáticamente los cambios en Git al clúster de desarrollo.

2. **pedido-app-prod**

   * Rama: `main`
   * Values: `values-prod.yaml`
   * Auto-sync habilitado para reflejar automáticamente los cambios en Git al clúster de producción.

> Cada aplicación de ArgoCD apunta al mismo repositorio, pero usa distintos values para separar la configuración de **desarrollo** y **producción**. Esto permite cambiar imágenes o recursos en un entorno sin afectar al otro.

---
## Endpoints de la aplicación

### Frontend
- `http://<EXTERNAL-IP>/`

### Backend (API)
- `http://<EXTERNAL-IP>/api/orders`
---
### Notas importantes

* El chart incluye subcharts para backend, frontend y PostgreSQL.
* El backend utiliza una API pública (`https://github.com/milazroleon/order-api.git`) para facilitar pruebas sin tener que construir la imagen local.
* La persistencia de datos en PostgreSQL se mantiene usando PVCs.
* Se configuran probes y HPA para el backend, asegurando disponibilidad y escalado automático según la carga.
=======
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



>>>>>>> ee7e4771ad0e33da78ec2e932a6b42a8b7461822

