# Minishell

<p align="center">
  <img src="https://img.shields.io/github/languages/top/ziliolu/42_minishell?color=#FFFFFF&style=flat-square" />
  <img src="https://img.shields.io/badge/status-in%20process-yellow?style=flat-square" />
  <img src="https://img.shields.io/github/last-commit/ziliolu/42_minishell?color=#FFFFFF&style=flat-square" />
</p>

Partner: [Ivo Marques](https://github.com/Pastilhex)

## Compile

- make -n "-Wall -Wextra -Werror"
- make

## Simples Command & global variables

- [x] /bin/ls
- [ ] /bin/pwd

- [x] #write nothing
- [ ] #spaces
- [ ] #tab

## Arguments

- [ ] /bin/ls -la
- [ ] /bin/echo 42porto
- [ ] /bin/echo $HOME 42porto
- [ ] /bin/find minishell

## echo

- [ ] echo
- [x] echo 42porto
- [ ] echo -n 42porto
- [ ] $HOME
- [ ] echo Ola eu sou o aluno $USERNAME da 42porto
- [ ] echo -n Estou_a_gostar_do_

## exit

- [ ] exit
- [ ] exit 1
- [ ] echo $?

## Evaluation Tests

- [ ] ls > t1
- [ ] ls > t1 > t2
- [ ] ls > t1 > t2 > t2
- [ ] echo test > t1 << eof
- [ ] echo test << eof > t1
