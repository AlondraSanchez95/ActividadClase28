#!/bin/bash

echo "Bienvenido al entorno del proyecto"

instalaciones() { 
    PROGRAMA=$1
    COMANDO_INSTALACION=$2

    echo "Verificando $PROGRAMA..."
    if ! command -v "$PROGRAMA" &> /dev/null
    then
        echo "[!] $PROGRAMA no está instalado. Instalando ahora..."
        sudo yum update &> /dev/null
        sudo $COMANDO_INSTALACION
    else
        echo "[ OK ] $PROGRAMA ya está presente en el sistema."
    fi
}

creacion () {
    NOMBRE=$1
    echo "Verificando si existe carpeta"
    if [ -d "/ActividadClase28/$NOMBRE" ]
    then
        echo "La carpeta $NOMBRE ya existe"
    else
        mkdir $NOMBRE
        echo "Carpeta $NOMBRE creada"
    fi
}

instalaciones "python3" "yum install python3 -y"
instalaciones "vim" "yum install vim -y"
instalaciones "git" "yum install git -y"
instalaciones "docker" "sudo dnf update -y && sudo dnf install -y docker docker-compose-plugin && sudo systemctl enable --now docker"
creacion "automation"
creacion "scripts"
creacion "app"
creacion "helper"
creacion ".gitignore"
creacion "carpetaPrueba"
