# Linux Experience
Bootcamp sobre administração de sistema linux.
## Desafio de código
Script bash para criar automaticamente usuários, grupos, diretórios e permissões, conforme a especificação dada no desafio.

### Execução
    ./infrastart.sh

### Criação dos grupos
"GRP_ADM" "GRP_VEN" "GRP_SEC"
### Criação dos diretórios
* /shared/publico - **grupo:** root - **permissão:** 777
* /shared/adm - **grupo:**  GRP_ADM - **permissão:** 770
* /shared/ven - **grupo:**  GRP_VEN - **permissão:** 770
* /shared/sec - **grupo:**  GRP_SEC - **permissão:** 770 
### Criação de usuários
##### GRP_ADM
* carlos
* maria
* joao
##### GRP_VEN
* debora 
* sebastiana
* roberto
##### GRP_SEC
* josefina
* amanda
* rogerio