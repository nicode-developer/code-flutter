Commit - Comentário de Alteração
Branch - Canal no Repositório

Create a New Repository

- echo "# Repository-Name" >> README.md
- git init
- git add *
- git commit -m "first commit"
- git branch -M main
- git remote add origin https://github.com/Owner/Repository-Name.git
- git push -u origin main


Push an Existing Repository

- git remote add origin https://github.com/Owner/Repository-Name.git
- git branch -M main
- git push -u origin main

-----------------

Exemplo (e. g.)

- git init
- git remote add origin https://github.com/Owner/Repository-Name.git
- git add *
- git commit -m "Commit Inicial"
- git branch -M main
- git push -u origin main

-----------------

Enviar

- git add *
- git commit -m "Commit Inicial"
- git push origin main

Pegar

- git pull origin main

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

- git init
- git {Inicializar o repositório}

- git add *
- git add {Adicionando todos os arquivo da pasta}

- git commit -m "Comentário de atualização"

- git branch -M main
- git branch -M {Em qual canal vai ser atualizado}

- git remote add origin https://github.com/Owner/Repository-Name.git
- git remote add origin {URL do Repositório}

- git push -u origin main
- git push {-u Indica que estar criando o canal} origin {Canal onde vai fazer upload do arquivo}

-----------------

- git branch
- Mostra o tanto de canais

- git checkout main
- git checkout {Mudar para o canal...}

- git checkout -b new-main
- git {Criando um canal local} -b {Nome do canal}

- git checkout -d new-main
- git {Apagar um canal local} -d {Nome do canal}

- git reset --hard origin/main
-git {Volta os arquivo anterior} --hard {Canal onde vai ser restado}

- git pull origin new-main
- git {Puxa arquivos} origin {Para este canal}

- git push --delete origin new-main
- git push {--delete Indica que estar deletando o canal} origin {Canal que vai ser deletado}

- git push origin main
- git push origin {Canal existente onde vai fazer upload do arquivo}

- git merge new-main
- git {Juntar os canais diferentes} {Este canal vai juntar com o canal ativo}