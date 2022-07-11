#!/bin/bash

#### Copiando os arquivos #######
echo "##### Criando um novo Projeto #####"
echo "Digite o nome do Projeto: "
read nome_projeto



if [ -d $nome_projeto ];
then
    echo "Este nome já existe!"
    echo "Favor usar outro nome."
else

    while true; do echo -n .; sleep 1; done &
    trap "kill $!" SIGTERM SIGKILL

    echo "Running comand $0"
    # 'wordpress' é a pasta a ser copiada
    cp -r wordpress $nome_projeto
    echo done

    kill $!
    
    
    echo -e "\n"
    echo " Projeto Criado com sucesso"
    
    ### Configurando o Banco de Dados #######
    echo -e "\n"
    
    echo "##### Configurando o Banco de Dados: #####"
    echo -e "\n"

    echo "Digite o NOME Banco de Dados: "
    read nome_banco
    echo "Digite o USUÁRIO Banco de Dados: "
    read nome_usuario
    echo "Digite a SENHA do Banco de Dados: "
    read senha

    ./.config-bd.sh $nome_projeto $nome_banco $nome_usuario $senha
        
    echo -e "\n"
    echo "Banco de Dados Configurado com sucesso!"
fi


