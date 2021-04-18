import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proativago/telaInicial.dart';
//import 'apresentacaoDosDados.dart';
import 'dados.dart';
import 'regras.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController contoleLogin = TextEditingController();
  final TextEditingController contoleSenha = TextEditingController();
  String alertaErro=" ";
  int contaErros = 0;
  bool senhaInvisivel = true;
  bool progressoVisivel =false;
  bool iconeVisivel = false;

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
                height: largura*1.05,
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
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: "Login",
                              hintText: "E-mail ou usuário",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 1),
                              ),
                              /* focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1,color: Colors.blue)
                          ),*/
                              suffixIcon: Icon(Icons.login)
                          ),

                              onChanged: (nLogin) {
                                setState(() {
                                  mapaLogin['usuario'] = nLogin;
                                });

                              }),
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
                              suffixIcon: IconButton(
                                icon: senhaInvisivel?Icon(Icons.visibility)
                                    :Icon(Icons.visibility_off),
                                color: senhaInvisivel? Colors.blue:Colors.red,
                                onPressed: (){
                                 setState(() {
                                   senhaInvisivel= !senhaInvisivel;
                                 });

                                }
                              )),
                          obscuringCharacter: "*",
                          obscureText: senhaInvisivel,
                          onSubmitted: (valor) async
                          {
                            setState(() {
                              iconeVisivel=false;
                              alertaErro="Conectando ";
                              progressoVisivel =true;
                            });

                            String resp =await testaLogin();

                            setState(() {
                              alertaErro=resp;
                              print("Retornou o alerta erro:\n$alertaErro");
                              progressoVisivel = false;
                            });
                          },
                          onChanged: (nSenha){
                            setState(() {
                              mapaLogin['senha'] = nSenha;
                            });
                          },
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
                                  gravarSenha = valor;
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
                          onPressed: () async
                            {
                              setState(() {
                                iconeVisivel=false;
                                alertaErro="Conectando ";
                                progressoVisivel =true;
                              });

                              String resp =await testaLogin();

                              setState(() async{
                                alertaErro=resp;
                                print("Retornou o alerta erro:\n$alertaErro");
                                progressoVisivel = false;
                              });
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
                        child:Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Visibility(
                                visible: iconeVisivel,
                                child: Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: Icon(Icons.error,color: Colors.red,)),
                              ),
                              Text("$alertaErro" ),
                              Visibility(
                                  visible: progressoVisivel,
                                  child: Container(
                                      padding: EdgeInsets.only(left: 5),
                                      width: largura*0.05,
                                      height: largura*0.04,
                                      child: LinearProgressIndicator())
                              )

                        ],)
                           /* :Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                         "$alertaErro" ),
                                Visibility(
                                  visible: progressoVisivel,
                                    child: Container(
                                      padding: EdgeInsets.only(left: 5),
                                        width: largura*0.05,
                                        height: largura*0.04,
                                        child: LinearProgressIndicator())
                                )
                              ],
                            ),*/
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
    super.initState();
    login=" ";
    senha=" ";

  }
//
Future<String> testaLogin()async{
  if (valido(contoleLogin.text) &&
      valido(contoleSenha.text)) {
    //Tenta a conexão
    login =contoleLogin.text;
    senha=contoleSenha.text;
    print("Senha $senha Login: $login");
    print("ABAIXO O MAPA DE LOGIN");
    print(mapaLogin);
    //modo fixo
    /*  http.Response response = await http.get("${Url}?op=LOGIN&usuario=$login&senha=$senha"
      "&so=$so&modelo=$modelo");
    String resultado = await getDadosProativaGo();*/
    String resultado = await getDadosProativaGo(operLogin, mapaReq:mapaLogin);

    print("Printando resultado : $resultado");

    setState(() {
      //Se o login ou senha estiverem errados,avisa
     //alerta(context,'$resultado',conteudo: "vai entrar!");
      if(resultado=="110" || resultado=="101"){
        print("Entrou e estou Printando o resultado : $resultado");
        alertaErro="Servidor indisponível!";
        iconeVisivel=true;
        progressoVisivel = false;
      }
     print("Saiu e estou Printando o resultado : $resultado");
      if(resultado=="039"){
        print("Printando resultado interno : $resultado");
          login="";
          senha="";
          contaErros++;
          if(contaErros==2){iconeVisivel=true;}else{iconeVisivel=false;}
          if (contaErros==3){exit(0);}
          alertaErro=(contaErros<=1)?"Login ou Senha inválidos! "
              :"Atenção última tentativa!"
              "($contaErros/3).";
         // alerta(context,'$resultado',conteudo: " O alerta erro é $alertaErro");
      }
      //Se o login ou senha estiverem errados,loga
      else if(resultado=="000"){
        contaErros=0;
          salvaLogin();
          alertaErro="Logado com sucesso! ";

           if(log.status=="AP") {

             Navigator.pushReplacement(context, MaterialPageRoute(
                 builder: (BuildContext context) =>telaInicial()));//Dados()));
           }else{
             alerta(context,"Olá ${log.usuario}",
                 conteudo:"Por favor, aguarde a liberação do dispositivo!",
             icone: Icon(Icons.info,size: 35,color: Colors.blue,)            
             );
           }
            //=>telaInicial()));
          }
    });

  } else {
    alerta(context,
        "Todos os campos devem estar preenchidos!\n",
        icone: Icon(
          Icons.error,size: 40,color: Colors.red,));
  }
  return '$alertaErro';
}


}
