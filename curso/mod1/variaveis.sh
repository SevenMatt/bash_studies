#!/usr/bin/env bash

NOME   = "Matheus

 Mamede"

echo "$NOME"

NUMERO_1  =23
NUMERO_2  =45

TOTAL=$(($NUMERO_1+$NUMERO_2))

echo "$TOTAL"

SAIDA_CAT="$(cat /etc/passwd | grep mamede)"

echo "$SAIDA_CAT"

echo "---------------------------------"

echo "Parametro 1: $1"
echo "Parametro 2: $2"

echo "Todos os parâmetros: $*"

echo "Quantos Parâmetros: $#"

echo "Saída do último comando: $?"

echo "PID: $$"

echo $0
