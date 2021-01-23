<h1 align="center">Desafio Gran Cursos Online</h1>

O desafio consiste na construção de APP utilizando o Flutter e uma API com NodeJs ou PHP capaz de realizar login utilizando uma conta Google ou Facebook, fazer uma listagem de notícias e também mostrar uma listagem de eventos para os usuários que estão logados.

<p align="center">
 <a href="#tech">Tecnologias</a> •
 <a href="#test">Testando a aplicação</a> • 
 <a href="#obse">Observações</a> • 
 <a href="#melh">Melhorias</a>
</p>

---

<a name="tech"></a>

## :wrench: Tecnologias

### :iphone: APP

A aplicação foi contruída inteiramento utilizando o **[Flutter][0]** e contou com as seguintes dependências:

- **[firebase_core][1] e [firebase_auth][2]** para gerenciamento de autentiçação;
- **[google_sign_in][3]** para utilizar a SDK de login do Google;
- **[flutter_facebook_auth][4]** para utilizar a SDK de login do Facebook;
- **[provider][5]** como auternativa para gerenciamento de estados na aplicação;
- **[http][6]** para realizar chamadas à API;
- **[flutter_secure_storage][7]** para armazenar de forma segura o token JWT gerado pelo Firebase;
- **[flutter_signin_button][8]** para conseguir botões padronizados;
- **[cupertino_icons][9]** para utilização de ícones.

### :package: API

Já na API as tecnologias utilizadas foram o **[NodeJs][10]** e o **[Typescript][11]** que por sua vez utilizaram as seguintes dependências:

- **[express][12]** como framework base da API;
- **[firebase-admin][13]** para gerenciar autenticação e banco de dados do Firebase;
- **[dotenv][14]** possibilitando a utilização de variáveis ambiente;
- **[cors][15]**, **[express-async-errors][16]** e **[reflect-metadata][17]** para facilitar o desenvolviemento e utilização do Typescript.

Vale ressaltar que a opção escolhida para o banco de dados foi o [Firebase Firestore][18], pois assim foi possível manter o sistema de autenticação e o gerenciando do banco de dados centralizados em uma única plataforma, o [Firebase][19].

<a name="test"></a>

## :construction: Testando a aplicação

### :white_check_mark: Pré-requisitos

- NodeJS e Flutter instalados;
- Celular Android com depuração USB ativada;

### :iphone: Rodando o APP

```bash
# Clone este repositório
git clone https://github.com/ErickCReis/Desafio-Gran-Cursos.git

# Acesse a pasta do projeto
cd Desafio-Gran-Cursos

# Acesse a pasta do APP
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

### :package: Rodando a API

A API já está hospedada na [Heroku][20], caso seja necessário rodar a aplicação localmente basta:

```bash
# Clone este repositório (caso ainda não tenha feito)
git clone https://github.com/ErickCReis/Desafio-Gran-Cursos.git

# Acesse a pasta do projeto
cd Desafio-Gran-Cursos

# Acesse a pasta da API
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

<a name="obse"></a>

## :warning: Observações

- O arquivo `.env` foi incluído no reposítório para que fosse possível realizar testes localmente.
- Ao fazer o login com Facebook, não é mais possível alternar o usuário nas próximas tentativas de login, aparentemente este é um erro com a SDK do Facebook. ([link](https://developers.facebook.com/docs/facebook-login/reauthentication/))

<a name="melh"></a>

## :pencil: Melhorias

- Passar à utilizar um token JWT gerado na api e não aquele gerado pelo Firebase.
- Deslogar automaticamente o usuário com token JWT expirado.
- Salvar estado das páginas de notícias e eventos para evitar o recarregamento.
- Alterar dinamicamente as opções da `BottomNavigationBar`.
- Melhorar o design principalmente das telas de login e perfil.

[0]: https://flutter.dev/
[1]: https://pub.dev/packages/firebase_core
[2]: https://pub.dev/packages/firebase_auth
[3]: https://pub.dev/packages/google_sign_in
[4]: https://pub.dev/packages/flutter_facebook_auth
[5]: https://pub.dev/packages/provider
[6]: https://pub.dev/packages/http
[7]: https://pub.dev/packages/flutter_secure_storage
[8]: https://pub.dev/packages/flutter_signin_button
[9]: https://pub.dev/packages/cupertino_icons
[10]: https://nodejs.org/
[11]: https://www.typescriptlang.org/
[12]: https://expressjs.com/
[13]: https://www.npmjs.com/package/firebase-admin
[14]: https://www.npmjs.com/package/dotenv
[15]: https://www.npmjs.com/package/cors
[16]: https://www.npmjs.com/package/express-async-errors
[17]: https://www.npmjs.com/package/reflect-metadata
[18]: https://firebase.google.com/products/firestore
[19]: https://firebase.google.com/
[20]: https://www.heroku.com/
