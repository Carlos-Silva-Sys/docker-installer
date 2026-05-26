#!/bin/bash
# ================================================================================
# INSTALADOR DE DOCKER EN UBUNTU 22.04 LTS
# ================================================================================
# Autor: Carlos Silva
# GitHub: Carlos-Silva-Sys
# ================================================================================

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

print_status() { echo -e "${BLUE}[*]${NC} $1"; }
print_success() { echo -e "${GREEN}[✓]${NC} $1"; }

if ! grep -q "22.04" /etc/os-release 2>/dev/null; then
    echo -e "${RED}[✗] Este script solo funciona en Ubuntu 22.04 LTS${NC}"
    exit 1
fi

clear
echo ""
echo "================================================================================"
echo -e "${BLUE}  INSTALADOR DE DOCKER EN UBUNTU 22.04 LTS${NC}"
echo "================================================================================"
echo ""

print_status "Actualizando sistema..."
apt update && apt upgrade -y
print_success "Sistema actualizado"

print_status "Instalando dependencias..."
apt install -y ca-certificates curl
print_success "Dependencias instaladas"

print_status "Agregando clave GPG de Docker..."
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc
print_success "Clave GPG agregada"

print_status "Agregando repositorio de Docker..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
print_success "Repositorio agregado"

print_status "Instalando Docker Engine..."
apt update
apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
print_success "Docker Engine instalado"

print_status "Verificando instalación..."
docker run hello-world
print_success "Docker funciona correctamente"

print_status "Agregando usuario al grupo docker..."
usermod -aG docker $SUDO_USER
print_success "Usuario agregado al grupo docker"

echo ""
echo "================================================================================"
echo -e "${GREEN}✅ INSTALACIÓN DE DOCKER COMPLETADA${NC}"
echo "================================================================================"
echo ""
echo "📌 Para usar Docker sin sudo, cierra sesión y vuelve a entrar"
echo "================================================================================"
