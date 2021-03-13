#!/usr/bin/env bash
#
# listaUsuarios.sh - Extrai Usuários do /ect/passwd
#
# Instagram:   @seven.matt
# Autor:       Matheus Mamede
# Manutenção:  Matheus Mamede
#
# ----------------------------------------------------------------------------------------#
# Irá extrair usuários do /etc/passwd, havendo possibilidade de colocar em maiúsculo e em 
#ordem  alfabética.
# 
# Exemplos:
#   $ ./listaUsuarios.sh -s -m
#   Neste exemplo ficará em maiúsculo e em ordem alfabética.
# ----------------------------------------------------------------------------------------#
# Histórico:
#
#   v1.0 10/03/2021, Matheus Mamede:
#       - Início do programa
#       
# ----------------------------------------------------------------------------------------#
# Testado em:
#   bash 4.4.20
# ----------------------------------------------------------------------------------------#

# -------------------------------------- VARIÁVEIS --------------------------------------------------#
USUARIOS="$(cat /etc/passwd | cut -d : -f 1)"
MENSAGEM_USO="
  $(basename $0) - [OPÇÕES]

        -h - Menu de ajuda
        -v - Versão
        -s - Ordernar a saída
        -m - Coloca em maiúsculo
"
VERSAO="v1.0"
CHAVE_ORDENA=0
CHAVE_MAIUSCULO=0
# ----------------------------------------------------------------------------------------#


# -------------------------------------- EXECUÇÃO --------------------------------------------------#

while test -n "$1"
do
    case "$1" in 
    -h) echo "$MENSAGEM_USO" && exit 0              ;;
    -v) echo "$VERSAO" && exit 0                    ;;
    -s) CHAVE_ORDENA=1                              ;;
    -m) CHAVE_MAIUSCULO=1                           ;;
    *) echo "Opção inválida, valie o -h " && exit 1 ;;
    esac 
    shift
done

set -x
[  $CHAVE_ORDENA -eq 1 ] && USUARIOS=$(echo "$USUARIOS" | sort)
[ $CHAVE_MAIUSCULO -eq 1 ] && USUARIOS=$(echo "$USUARIOS" | tr [a-z] [A-Z])
set +x

echo "$USUARIOS"

# ----------------------------------------------------------------------------------------#
