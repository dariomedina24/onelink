#!/bin/bash

set -e

echo "======================================"
echo "   Onelink Setup Script for Linux"
echo "======================================"
echo ""

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Step 1: Update system packages
echo -e "${YELLOW}[1/5] Actualizando paquetes del sistema...${NC}"
sudo apt-get update -y
echo -e "${GREEN}✓ Completado${NC}\n"

# Step 2: Install Node.js LTS
echo -e "${YELLOW}[2/5] Instalando Node.js LTS...${NC}"
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs
echo -e "${GREEN}✓ Completado${NC}"
echo "   Node: $(node --version)"
echo "   npm: $(npm --version)"
echo ""

# Step 3: Install project dependencies
echo -e "${YELLOW}[3/5] Instalando dependencias del proyecto...${NC}"
npm install
echo -e "${GREEN}✓ Completado${NC}\n"

# Step 4: Build project
echo -e "${YELLOW}[4/5] Compilando proyecto...${NC}"
npm run build
echo -e "${GREEN}✓ Completado${NC}\n"

# Step 5: Ready to run
echo -e "${YELLOW}[5/5] Setup completado!${NC}\n"
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}Proyecto listo para ejecutarse${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo "Próximo paso: Inicia el servidor de desarrollo"
echo ""
echo -e "${YELLOW}Ejecuta:${NC}"
echo "  npm run dev"
echo ""
echo -e "${YELLOW}Luego accede desde tu navegador:${NC}"
echo "  http://192.168.100.187:3000"
echo ""
echo "Para detener el servidor: Ctrl+C"
echo ""
