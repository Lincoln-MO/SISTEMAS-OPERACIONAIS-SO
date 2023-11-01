#! /bin/bash

echo "Digite o Primeiro nome"
read NOME1

echo "Digite o Segundo nome"
read NOME2

if [ $NOME1 = $NOME2 ]; then
	echo "Os nomes sâo iguais: " $NOME1 $NOME2
else
        echo "Os nomes são distintos: " $NOME1 $NOME2
fi

