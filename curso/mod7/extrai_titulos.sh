#!/usr/bin/env bash
#
# extrai_titulos.sh - Extrai titulos do blog
#
# Instagram:   @seven.matt
# Autor:       Matheus Mamede
# Manutenção:  Matheus Mamede
#
# ----------------------------------------------------------------------------------------#
# Este programa irá extrair titulos do blog LXER, colocar em um arquivo de texto e ler 
#monstrando cores na tela.
# 
# Exemplos:
#   $ ./extrai_titulos.sh
#   Neste exemplo o programa vai extrair titulos e mostrar na tela.
# ----------------------------------------------------------------------------------------#
# Histórico:
#
#   v1.0 15/03/2021, Matheus Mamede:
#       - Início do programa
#       
# ----------------------------------------------------------------------------------------#
# Testado em:
#   bash 4.4.20
# ----------------------------------------------------------------------------------------#

# -------------------------------------- VARIÁVEIS --------------------------------------------------#
ARQUIVO_DE_TITULOS="titulos.txt"

VERDE="\033[32;1m"
VERMELHO="\033[31;1m"
# ----------------------------------------------------------------------------------------#

# -------------------------------------- TESTES -----------------------------------------------------#
[ ! -x "$(which lynx)" ] && sudo apt install lynx -y #Lynx instalado?

# ----------------------------------------------------------------------------------------#

# -------------------------------------- EXECUÇÃO ---------------------------------------------------#
lynx -source http://lxer.com/ | grep blurb | sed 's/div.*line">//;s/<\/span.*//' > titulos.txt

while read -r titulos_lxer
do
    echo -e "${VERMELHO}Titulo: ${VERDE}$titulos_lxer"
 done < "$ARQUIVO_DE_TITULOS"



# ----------------------------------------------------------------------------------------#
