````markdown
# Pedido-App

## Información del Proyecto
- **Universidad:** Universidad de La Sabana
- **Facultad:** Facultad de Ingeniería
- **Materia:** Patrones Arquitectónicos Avanzados

## Integrantes del Proyecto
| Nombre | Correo Electrónico |
|---|---|
| Valentina Alejandra López Romero | valentinalopro@unisabana.edu.co |
| Laura Camila Rodriguez Leon | laurarodleo@unisabana.edu.co |
| Mariana Valle Moreno | marianavamo@unisabana.edu.co |

---

## Descripción del Proyecto
Este repositorio contiene el **Helm Chart** y los manifiestos de Kubernetes para desplegar la aplicación **Pedido-App**, que incluye un **backend**, un **frontend** y una base de datos **PostgreSQL**. La arquitectura está optimizada para su despliegue en clústeres de Kubernetes y se integra con **ArgoCD** para gestionar dos entornos: `dev` y `prod`.

---

## 1. Despliegue con Helm Chart

Este chart permite una instalación flexible y configurable de la aplicación.

### 1.1 Prerrequisitos
Asegúrate de tener un clúster de Kubernetes en ejecución. Si usas **Minikube**, puedes levantarlo con los siguientes comandos para habilitar las funcionalidades necesarias:

```bash
minikube start --driver=docker --memory=2200mb --cpus=2
minikube addons enable ingress
minikube addons enable metrics-server
````

### 1.2 Instalación

1.  Clona el repositorio y navega al directorio del chart:

<!-- end list -->

```bash
git clone [https://github.com/milazroleon/pedido-app.git](https://github.com/milazroleon/pedido-app.git)
cd pedido-app/charts/pedido-app
```

2.  Actualiza las dependencias del chart:

<!-- end list -->

```bash
helm dependency update
```

3.  Instala la aplicación en el entorno de **desarrollo (`dev`)**:

<!-- end list -->

```bash
helm upgrade --install pedido-dev . -f values-dev.yaml
```

4.  Instala la aplicación en el entorno de **producción (`prod`)**:

<!-- end list -->

```bash
helm upgrade --install pedido-prod . -f values-prod.yaml
```

> **Nota:** Los archivos `values-dev.yaml` y `values-prod.yaml` contienen configuraciones específicas para cada entorno, incluyendo imágenes, etiquetas, réplicas, recursos y credenciales.

-----

## 2\. Configuración de ArgoCD

El proyecto está diseñado para funcionar con ArgoCD, utilizando una configuración de **GitOps**. Se crearon dos aplicaciones en ArgoCD para gestionar los entornos de `dev` y `prod`:

  * **pedido-app-dev:** Apunta al repositorio en la rama `main` y utiliza el archivo `values-dev.yaml`.
  * **pedido-app-prod:** Apunta al mismo repositorio en la rama `main` pero utiliza el archivo `values-prod.yaml`.

Ambas aplicaciones tienen **auto-sync habilitado** para que los cambios en el repositorio se reflejen automáticamente en el clúster.

-----

## 3\. Endpoints de la Aplicación

Una vez que los pods estén en estado `Running`, puedes acceder a la aplicación.

1.  Abre un túnel para acceder a los servicios de Minikube:
    ```bash
    minikube tunnel
    ```
2.  Obtén la IP del Ingress Controller para acceder a los endpoints:
    ```bash
    kubectl get ingress
    ```
3.  Accede a la aplicación:
      * **Frontend:** `http://<EXTERNAL_IP>/`
      * **Backend (API):**
          * `http://<EXTERNAL_IP>/api/orders`
          * `http://<EXTERNAL_IP>/questions`
          * `http://<EXTERNAL_IP>/questions/{id}/answers`

-----

## 4\. Aspectos Clave del Proyecto

  * **Estructura del Chart:** El chart principal incluye subcharts para cada componente de la aplicación (`backend`, `frontend` y `PostgreSQL`).
  * **Backend:** El backend usa una API pública (`https://github.com/milazroleon/order-api.git`) para simplificar la fase de pruebas y evitar la construcción de la imagen localmente.
  * **Persistencia:** La base de datos de PostgreSQL utiliza PVCs (**Persistent Volume Claims**) para garantizar la persistencia de los datos.
  * **Escalabilidad:** Se han configurado **probes** y **HPA** (**Horizontal Pod Autoscaler**) para el backend, asegurando alta disponibilidad y escalado automático en función de la carga de trabajo.

<!-- end list -->

```
```
