#!/bin/bash

# Verifique se o usuário atual é 'aluno_pc'
if [ "$(whoami)" != "aluno_pc" ]; then
    echo "Somente o usuário 'aluno_pc' pode executar esta cópia."
    exit 1
fi

# Verifique se o HD externo está conectado
if [ ! -d "/media/$(whoami)/Meu backup" ]; then
    echo "O HD externo 'Meu backup' não está conectado."
    exit 1
fi

# Copie os arquivos da pasta ~/Documentos para a raiz da partição 'Meu backup'
rsync -av --progress ~/Documentos/* "/media/$(whoami)/Meu backup/"

# Verifique se a cópia foi bem-sucedida
if [ $? -eq 0 ]; then
    echo "Cópia concluída com sucesso!"
else
    echo "Erro ao copiar os arquivos."
fi
