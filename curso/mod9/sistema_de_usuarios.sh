#!/usr/bin/env bash
#
# sistema_de_usuarios - Sistema para gerenciamento de usuários
#
# Instagram:   @seven.matt
# Autor:       Matheus Mamede
# Manutenção:  Matheus Mamede
#
# ----------------------------------------------------------------------------------------#
# Este Programa faz todas as funções de gerenciamento de usuários, como:
# inserir, deletar, alterar.
# 
# Exemplos:
#   $ cource sistema_de_usuarios
#   $ ListaUsuarios
# ----------------------------------------------------------------------------------------#
# Histórico:
#
#   v1.0 18/03/2021, Matheus Mamede:
#       - Início do programa
#       
#   
#       
# ----------------------------------------------------------------------------------------#
# Testado em:
#   bash 4.4.20
# ----------------------------------------------------------------------------------------#
# -------------------------------------- VARIÁVEIS --------------------------------------------------#
ARQUIVO_BANCO_DE_DADOS="banco_de_dados.txt"
SEP=:
TEMP=temp.$$
VERDE="\033[32;1m"
VERMELHO="\033[31;1m"
# ----------------------------------------------------------------------------------------#

# -------------------------------------- TESTES --------------------------------------------------#
[ ! -e "$ARQUIVO_BANCO_DE_DADOS" ] && echo "ERRO. Arquivo não existe." && exit 1
[ ! -r "$ARQUIVO_BANCO_DE_DADOS" ] && echo "ERRO. Arquivo não tem permissão de leitura." && exit 1
[ ! -w "$ARQUIVO_BANCO_DE_DADOS" ] && echo "ERRO. Arquivo não tem permissão de escrita." && exit 1

# ----------------------------------------------------------------------------------------#

# -------------------------------------- FUNÇÕES --------------------------------------------------#
MostraUsuarioNaTela(){

     local id="$(echo $1 | cut -d $SEP -f 1)"
     local nome="$(echo $1 | cut -d $SEP -f 2)"
     local email="$(echo $1 | cut -d $SEP -f 3)"

        echo -e "${VERDE}ID: ${VERMELHO}$id"
        echo -e "${VERDE}Nome: ${VERMELHO}$nome"
        echo -e "${VERDE}E-mail: ${VERMELHO}$email"
}


ListaUsuarios () {

    while read -r linha
    do 
        [ "$(echo $linha | cut -c1)" = "#" ] &&  continue 
        [ ! "$linha" ] && continue

        MostraUsuarioNaTela "$linha"
    done < "$ARQUIVO_BANCO_DE_DADOS"
}

ValidaExistenciaUsuario () {
    grep -i -q "$1$SEP" "$ARQUIVO_BANCO_DE_DADOS"

}

InsereUsuario () {
    local nome="$(echo $1 | cut -d $SEP -f 1)"

    if ValidaExistenciaUsuario "$nome"
    then
        echo "ERRO. Usuário já existe!" 
    else
        echo "$*" >> "$ARQUIVO_BANCO_DE_DADOS"
        echo "Usuário cadastrado com sucesso!"
    fi
    OrdenaLista
}

ApagaUsuario () {
    ValidaExistenciaUsuario "$1" || return 

    grep -i -v "$1$SEP" "$ARQUIVO_BANCO_DE_DADOS" > "$TEMP"
    mv "$TEMP" "$ARQUIVO_BANCO_DE_DADOS"

    echo "Usuário removido com sucesso!"
    OrdenaLista
}

OrdenaLista () {
    sort "$ARQUIVO_BANCO_DE_DADOS" > "$TEMP"
    mv "$TEMP" "$ARQUIVO_BANCO_DE_DADOS"
}
# ----------------------------------------------------------------------------------------#