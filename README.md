# 🐳 docker-installer

Scripts automatizados para instalar Docker Engine en **Ubuntu 22.04** y **Debian 12**.

---

## 📋 Descripción

**Problema que resuelve:**  
La instalación manual de Docker requiere múltiples pasos (clave GPG, repositorio, paquetes, configuración de usuario). Este proceso es tedioso y propenso a errores.

**Solución:**  
Scripts que automatizan la instalación completa de Docker según tu sistema operativo.

---

## ⚙️ INSTALACIÓN

### 1. Clonar repositorio

```bash
git clone https://github.com/Carlos-Silva-Sys/docker-installer.git
cd docker-installer
```

### 2. Elegir tu sistema operativo

#### 🐧 Ubuntu 22.04

```bash
chmod +x install-docker-ubuntu22.sh
sudo ./install-docker-ubuntu22.sh
```

#### 🐧 Debian 12

```bash
chmod +x install-docker-debian12.sh
sudo ./install-docker-debian12.sh
```

### 3. Verificar que Docker funciona

```bash
docker run hello-world
```

> **Nota:** Para usar Docker sin `sudo`, cierra sesión y vuelve a entrar.

---

## ✅ Lo que hace el script

| Paso | Acción |
|------|--------|
| 1 | Actualiza el sistema |
| 2 | Instala `ca-certificates` y `curl` |
| 3 | Descarga y guarda la clave GPG de Docker |
| 4 | Agrega el repositorio oficial de Docker |
| 5 | Instala Docker Engine y plugins |
| 6 | Prueba Docker con `hello-world` |
| 7 | Agrega tu usuario al grupo `docker` |
| 8 | Muestra instrucciones finales |

---

## 🛠️ COMANDOS ÚTILES

```bash
# Ver versión de Docker
docker --version

# Ver contenedores activos
docker ps

# Ver contenedores (incluyendo detenidos)
docker ps -a

# Ver imágenes descargadas
docker images

# Ver espacio usado por Docker
docker system df
```

---

## 📁 Estructura del proyecto

```
docker-installer/
├── README.md
├── install-docker-ubuntu22.sh
└── install-docker-debian12.sh
```

---

## 🔗 Proyectos relacionados

- [owncloud-docker-installer](https://github.com/Carlos-Silva-Sys/owncloud-docker-installer) - OwnCloud con Docker en 1 minuto
- [owncloud-ubuntu22-installer](https://github.com/Carlos-Silva-Sys/owncloud-ubuntu22-installer) - OwnCloud con script nativo

---

## 📝 Autor

Carlos Silva  
GitHub: [@Carlos-Silva-Sys](https://github.com/Carlos-Silva-Sys)

---

## 📌 Nota de seguridad

Estos scripts están diseñados específicamente para **Ubuntu 22.04** y **Debian 12**. No los ejecutes en otras versiones sin verificar compatibilidad.
