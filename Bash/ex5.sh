#! /bin/bash

echo "Digite o Primeiro nome"
read NOME1

echo "Digite o Segundo nome"
read NOME2

if [ -z $NOME1 -o -z $NOME2 ]; then
	echo "Os nomes não foram informados"
elif [ $NOME1 = $NOME2 ]; then
        echo "Os nomes são iguais: " $NOME1 $NOME2
else
	echo "Os nomes sao diferentes" $NOME1 $NOME2
fi

firefox  "https://www.google.com/search?q=$NOME1+$NOME2"

