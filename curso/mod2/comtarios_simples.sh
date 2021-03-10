#!/usr/bin/env bash

#Lynx instalado?
[ ! -x "$(wich lynx)"] && printf "${AMARELO}precisamos instalar o ${VERDE}Lynx${AMARELO}, por favor, digite sua senha:${SEM_COR}\n" && sudo apt install

# Sem parâmetros obrigatórios?
[ -z $1] && printf "${VERMELHO} [ERRO] - Informe os parâmetros obrigatórios. Consulte a opção -h\n" && exit 1