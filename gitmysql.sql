 Command line instructions
Git global setup

git config --global user.name "Jairo Girotto"
git config --global user.email "jct@trf4.jus.br"

Create a new repository

git clone https://git.trf4.jus.br/jct/mysql-config.git
cd mysql-config
touch README.md
git add README.md
git commit -m "add README"
git push -u origin master

Existing folder

cd existing_folder
git init
git remote add origin https://git.trf4.jus.br/jct/mysql-config.git
git add .
git commit -m "Initial commit"
git push -u origin master

Existing Git repository

cd existing_repo
git remote add origin https://git.trf4.jus.br/jct/mysql-config.git
git push -u origin --all
git push -u origin --tags
