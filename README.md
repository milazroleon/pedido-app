
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
```

---

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

# Ejemplos con curl
- curl -i 'http://<EXTERNAL-IP>/'
- curl -i 'http://<EXTERNAL-IP>/api/orders'
---
### Notas importantes

* El chart incluye subcharts para backend, frontend y PostgreSQL.
* El backend utiliza una API pública (`https://github.com/milazroleon/order-api.git`) para facilitar pruebas sin tener que construir la imagen local.
* La persistencia de datos en PostgreSQL se mantiene usando PVCs.
* Se configuran probes y HPA para el backend, asegurando disponibilidad y escalado automático según la carga.

