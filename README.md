## Desafio Gran Cursos

### O Desafio

O desafio consiste na construção de APP utilizando o Flutter e uma API com NodeJs ou PHP capaz de realizar login utilizando uma conta Google ou Facebook, fazer uma listagem de notícias e também mostrar uma listagem de eventos para os usuários que estão logados.

### Resultados

### Tecnologias e Dependências

#### APP

A aplicação foi contruída inteiramento utilizando o **Flutter** e contou com as seguintes dependências:

- **firebase_core e firebase_auth** para gerenciamento de autentiçação;
- **google_sign_in** para utilizar a SDK de login do Google;
- **flutter_facebook_auth** para utilizar a SDK de login do Facebook;
- **provider** como auternativa para gerenciamento de estados na aplicação;
- **http** para realizar chamadas à API;
- **flutter_secure_storage** para armazenar de forma segura o token JWT gerado pelo Firebase;
- **flutter_signin_button** para conseguir botões padronizados;
- **cupertino_icons** para utilização de ícones;

#### API

Já na API as tecnologias utilizadas foram o **NodeJs** e o **Typescript** que por sua vez utilizaram as seguintes dependências:

- **express** como framework base da API;
- **firebase-admin** para gerenciar autenticação e banco de dados do Firebase;
- **dotenv** possibilitando a utilização de variáveis ambiente;
- **cors**, **express-async-errors** e **reflect-metadata** para facilitar o desenvolviemento e utilização do Typescript;

### Testando a aplicação

#### Pré-requisitos

- NodeJS e Flutter instalados;
- Celular Android com depuração USB ativada;

#### Rodando o APP

```bash
# Acesse a app
cd app

# Baixe as dependências
flutter pub get

# Execute a aplicação
flutter run
```

Para utilizar a API de forma local é necessário:

- Encontrar o IP local da máquina utilizando `hostname -I` no Linux por exemplo;
- Substituir o IP encontrado no arquivo `app/lib/constants.dart`;
- Deixar apenas a linha que contém o IP descomentada;
- Rodar a aplicação novamente.

#### Rodando a API

A API já está hospedada na Heroku, caso seja necessário rodar a aplicação localmente basta:

```bash
# Acesse a api
cd api

# Baixe as dependências
npm i
# ou
yarn

# Execute a aplicação
npm run dev
# ou
yarn dev
```

### Observações

- O arquivo `.env` foi incluído no reposítório para que fosse possível realizar testes localmente.
- Ao fazer o login com Facebook, não é mais possível alternar o usuário nas próximas tentativas de login, aparentemente este é um erro com a SDK do Facebook. ([link](https://developers.facebook.com/docs/facebook-login/reauthentication/))

### Futuras melhorias

- Passar à utilizar um token JWT gerado na api e não aquele gerado pelo Firebase.
- Deslogar automaticamente o usuário com token JWT expirado.
- Salvar estado das páginas de notícias e eventos para evitar o recarregamento.
- Alterar dinamicamente as opções da `BottomNavigationBar`.
- Melhorar o design principalmente das telas de login e perfil.
