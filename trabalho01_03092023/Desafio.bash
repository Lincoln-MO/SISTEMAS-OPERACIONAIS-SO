#!/bin/bash

# Endereço de e-mail para receber alertas
email="lincolnoliveira10@gmail.com"

# Limite de uso da CPU em porcentagem
limite_cpu=70

# Limite de uso de memória em porcentagem
limite_memoria=70

# Limite de uso de espaço em disco em porcentagem
limite_disco=70

# Função para verificar o uso da CPU

#Esta função verifica o uso da CPU. Ela utiliza o comando top para coletar informações sobre a CPU em tempo real.
#top -b -n 1 gera uma saída única do top.
#grep "%Cpu(s)" filtra a linha que contém informações sobre a CPU.
##awk '{print $8}' pega o valor da coluna que indica o uso da CPU.
#cut -d. -f1 remove a parte decimal do valor.
#Se o uso da CPU exceder o limite configurado ($limite_cpu), ele emite um alerta.

verificar_cpu() {
    uso_cpu=$(top -b -n 1 | grep "%Cpu(s)" | awk '{print $8}' | cut -d. -f1)
    if [ "$uso_cpu" -gt "$limite_cpu" ]; then
        echo "Uso da CPU acima do limite: $uso_cpu%"
        enviar_alerta "Uso da CPU acima do limite: $uso_cpu%"
    fi
}

# Função para verificar o uso de memória

#Esta função verifica o uso de memória. Ela utiliza o comando `free` para obter informações sobre a memória disponível no sistema.
#awk '/Mem:/ {print int($3/$2*100)}' calcula a porcentagem de uso de memória.
#Se o uso de memória exceder o limite configurado ($limite_memoria), ele emite um alerta.

verificar_memoria() {
    uso_memoria=$(free | awk '/Mem:/ {print int($3/$2*100)}')
    if [ "$uso_memoria" -gt "$limite_memoria" ]; then
        echo "Uso de memória acima do limite: $uso_memoria%"
        enviar_alerta "Uso de memória acima do limite: $uso_memoria%"
    fi
}

# Função para verificar o uso de espaço em disco

#Esta função verifica o uso de espaço em disco. Ela utiliza o comando `df` para obter informações sobre as partições de disco no sistema.
#awk '$NF == "/" {print int($5)}' extrai a porcentagem de uso da partição raiz (/).
#Se o uso de espaço em disco exceder o limite configurado ($limite_disco), ele emite um alerta.

verificar_disco() {
    uso_disco=$(df -h | awk '$NF == "/" {print int($5)}')
    if [ "$uso_disco" -gt "$limite_disco" ]; then
        echo "Uso de espaço em disco acima do limite: $uso_disco%"
        enviar_alerta "Uso de espaço em disco acima do limite: $uso_disco%"
    fi
}

# Função para enviar alertas por e-mail

#Esta função envia alertas por e-mail. Ela utiliza o comando mail para enviar um e-mail com um assunto e corpo especificados.

enviar_alerta() {
    assunto="Alerta de Monitoramento"
    echo "$1" | mail -s "$assunto" "$email"
}

# Verificar o uso da CPU, memória e espaço em disco (chamamos as funções `verificar_cpu`, `verificar_memoria` e `verificar_disco`)

verificar_cpu
verificar_memoria
verificar_disco
