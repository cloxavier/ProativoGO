import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proativago/telaInicial.dart';
import 'dados.dart';
import 'regras.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController contoleLogin = TextEditingController();
  TextEditingController contoleSenha = TextEditingController();
  String alertaErro="  ";
  int contaErros = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Container(
          width: largura,
          height: altura,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg_login_tela.jpg"),
              repeat: ImageRepeat.repeat,
            ),
          ),
          child: SingleChildScrollView(
            child: Stack(alignment: Alignment.topCenter, children: [
              //Imagem do topo

              //Corpo do form
              Container(
                margin: EdgeInsets.only(top: 70),
                width: largura * 0.9,
                height: largura,
                child: Card(
                  color: Colors.white.withOpacity(0.7),
                  child: Column(
                    children: [
                      SizedBox(height: 60),
                      //Titulo do form
                      Container(
                        child:
                            Text('Para acessar o Proativo GO faça seu login.'),
                      ),
                      //Campo de Login
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: TextField(
                          controller: contoleLogin,
                          decoration: InputDecoration(
                              labelText: "Login",
                              hintText: "E-mail ou usuário",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 1),
                              ),
                              /* focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1,color: Colors.blue)
                          ),*/
                              suffixIcon: Icon(Icons.login)),
                        ),
                      ),
                      //Campo de Senha
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
                        child: TextField(
                          controller: contoleSenha,
                          decoration: InputDecoration(
                              labelText: "Senha",
                              hintText: "Senha",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1)),
                              suffixIcon: Icon(Icons.lock)),
                        ),
                      ),
                      //Checkbox gravar senha
                      Container(
                        child: Row(
                          children: [
                            Checkbox(
                              value: gravarSenha,
                              onChanged: (valor) {
                                setState(() {
                                  gravarSenha = valor!;
                                  if (plataforma == TargetPlatform.android) {
                                    print("plataforma $plataforma");
                                  }
                                });
                              },
                            ),
                            Text("Gravar senha")
                          ],
                        ),
                      ),
                      //Botao login
                      Container(
                        width: largura * 0.8,
                        child: ElevatedButton(
                          child: Text("LOGIN"),
                          onPressed: () async{
                            if (valido(contoleLogin.text) &&
                                valido(contoleSenha.text)) {
                              //Tenta a conexão
                              login =contoleLogin.text;
                              senha=contoleSenha.text;
                              String resultado = await getDadosProativaGo();
                              setState(() {
                                //Se o login ou senha estiverem errados,avisa
                                if(resultado=="039"){
                                  login="";
                                  senha="";
                                  contaErros++;
                                  alertaErro="Login ou Senha inválidos! "
                                              "($contaErros/3).";
                                //  print(" ++++++ +++++ ++ erro $resultado +++ + +++++++ ");
                                }
                                //Se o login ou senha estiverem errados,loga
                                else if(resultado=="000"){

                                  //print(" vvvvv vvvv erro $resultado +++ + +++++++ ");
                                  alertaErro="Logado com sucesso! ";
                                  Navigator.pushReplacement(context,MaterialPageRoute(
                                      builder: (BuildContext context)
                                      =>telaInicial()));

                                }
                              });

                            } else {
                              alerta(context,
                                  "Todos os campos devem estar preenchidos!\n",
                                 icone: Icon(
                                   Icons.error,size: 40,color: Colors.red,));
                            }
                          },
                        ),
                      ),
                      //Botão esqueci minha senha
                      Container(
                        width: largura * 0.8,
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          child: Text("Esqueci minha senha"),
                          onPressed: () {},
                        ),
                      ),
                      //Texto com retorno do login
                      Container(
                        child: Text(
                         alertaErro ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25),
                decoration: BoxDecoration(shape: BoxShape.circle),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  "assets/images/logo.jpg",
                  width: 100,
                  height: 100,
                ),
              ),
            ]),
          ),
        ));
  }

  @override
  void initState() {
    login=" ";
    senha=" ";
  }
//


//
}
