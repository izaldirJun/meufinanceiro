#!/bin/bash

set -e

if ! command -v docker-compose &> /dev/null
then
    echo "docker-compose não encontrado. Tentando instalar..."

    sudo apt update

    # Tenta instalar o plugin (versão nova do docker-compose)
    if sudo apt install -y docker-compose-plugin; then
        echo "docker-compose-plugin instalado com sucesso."
    else
        echo "Falha ao instalar docker-compose-plugin, tentando instalar docker-compose tradicional..."
        if sudo apt install -y docker-compose; then
            echo "docker-compose instalado com sucesso."
        else
            echo "❌ Não foi possível instalar docker-compose automaticamente."
            echo "Por favor, instale manualmente seguindo: https://docs.docker.com/compose/install/"
            exit 1
        fi
    fi
else
    echo "docker-compose já está instalado."
fi

echo "Subindo containers..."
docker-compose up -d
