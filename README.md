# linux-experience-iac
Script bash para criar automaticamente usuários, grupos, diretórios e permissões.

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