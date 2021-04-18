import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proativago/dados.dart';
import 'package:proativago/regras.dart';
import 'dados.dart';

//Map<String,dynamic> fichaRecebida={};

class EditorFichas extends StatefulWidget {
  Map<String,dynamic> ficha={};
  int indice =0;
  EditorFichas({this.ficha,this.indice});

  @override
  _EditorFichasState createState() => _EditorFichasState();
}

class _EditorFichasState extends State<EditorFichas>{

  TextEditingController controleIdFicha = TextEditingController();
  TextEditingController controleNro = TextEditingController();
  TextEditingController controleLocal = TextEditingController();
  TextEditingController controleLocalizacao = TextEditingController();
  TextEditingController controleDepartamento = TextEditingController();
  TextEditingController controleClassificacao = TextEditingController();
  TextEditingController controleStatus = TextEditingController();
  String descricao="";
  String prazo="";
  String avaliacao="";
  @override
  void initState() {
     descricao=(acoesRec.isNotEmpty)?acoesRec[0]['descricao']:"Sem dados!";
     prazo=(acoesRec.isNotEmpty)?acoesRec[0]['data_prazo']:"Sem dados!";
     avaliacao=(acoesRec.isNotEmpty)?acoesRec[0]['avaliacao']:"Sem dados!";
     controleIdFicha.text = widget.ficha['idficha']??"vazio";
     controleNro.text =  widget.ficha['nro']??"vazio";
     controleLocal.text =  widget.ficha['local']??"vazio";
     controleLocalizacao.text =  widget.ficha['localizao']??"vazio";
     controleDepartamento.text =  widget.ficha['departamento']??"vazio";
     controleClassificacao.text =  widget.ficha['classificao']??"vazio";
     controleStatus.text =  widget.ficha['status']??"vazio";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${log.razao_social}\n${log.usuario} - ${log.turma}"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
                child: TextField(
                  readOnly: true,
                  controller: controleIdFicha,
                  decoration: InputDecoration(
                      labelText: widget.ficha.keys.elementAt(0),
                      hintText: "Senha",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1)),
                      suffixIcon: IconButton(
                          icon: Icon(Icons.label_outline),

                          color: Colors.blue,
                          onPressed: (){
                            setState(() {
                              //senhaInvisivel= !senhaInvisivel;
                            });
                          }
                      )),
                  obscuringCharacter: "*",
                  obscureText: false,
                  onSubmitted: (valor)=> {'testaLogin()'},
                  onChanged: (nSenha){
                    setState(() {
                      //mapaLogin['senha'] = nSenha;
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
                child: TextField(
                  readOnly: true,
                  controller: controleNro,
                  decoration: InputDecoration(
                      labelText: widget.ficha.keys.elementAt(1),
                      hintText: widget.ficha.keys.elementAt(1),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1)),
                      suffixIcon: IconButton(
                          icon: Icon(Icons.help),
                          color: Colors.blue,
                          onPressed: (){
                            setState(() {
                              //senhaInvisivel= !senhaInvisivel;
                            });
                          }
                      )),
                  obscuringCharacter: "*",
                  obscureText: false,
                  onSubmitted: (valor)=> {'testaLogin()'},
                  onChanged: (nSenha){
                    setState(() {
                      //mapaLogin['senha'] = nSenha;
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
                child: TextField(
                  readOnly: true,
                  controller: controleLocal,
                  decoration: InputDecoration(
                      labelText: widget.ficha.keys.elementAt(2),
                      hintText: widget.ficha.keys.elementAt(2),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1)),
                      suffixIcon: IconButton(
                          icon: Icon(Icons.location_on),

                          color: Colors.blue,
                          onPressed: (){
                            setState(() {
                              //senhaInvisivel= !senhaInvisivel;
                            });
                          }
                      )),
                  obscuringCharacter: "*",
                  obscureText: false,
                  onSubmitted: (valor)=> {'testaLogin()'},
                  onChanged: (nSenha){
                    setState(() {
                      //mapaLogin['senha'] = nSenha;
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
                child: TextField(
                  readOnly: true,
                  controller: controleLocalizacao,
                  decoration: InputDecoration(
                      labelText: widget.ficha.keys.elementAt(3),
                      hintText: widget.ficha.keys.elementAt(3),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1)),
                      suffixIcon: IconButton(
                          icon: Icon(Icons.location_city),

                          color: Colors.blue,
                          onPressed: (){
                            setState(() {
                              //senhaInvisivel= !senhaInvisivel;
                            });
                          }
                      )),
                  obscuringCharacter: "*",
                  obscureText: false,
                  onSubmitted: (valor)=> {'testaLogin()'},
                  onChanged: (nSenha){
                    setState(() {
                      //mapaLogin['senha'] = nSenha;
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
                child: TextField(
                  readOnly: true,
                  controller: controleDepartamento,
                  decoration: InputDecoration(
                      labelText: widget.ficha.keys.elementAt(4),
                      hintText: widget.ficha.keys.elementAt(4),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1)),
                      suffixIcon: IconButton(
                          icon: Icon(Icons.account_balance_outlined),

                          color: Colors.blue,
                          onPressed: (){
                            setState(() {
                              //senhaInvisivel= !senhaInvisivel;
                            });
                          }
                      )),
                  obscuringCharacter: "*",
                  obscureText: false,
                  onSubmitted: (valor)=> {'testaLogin()'},
                  onChanged: (nSenha){
                    setState(() {
                      //mapaLogin['senha'] = nSenha;
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
                child: TextField(
                  readOnly: true,
                  controller: controleClassificacao,
                  decoration: InputDecoration(
                      labelText: widget.ficha.keys.elementAt(5),
                      hintText: widget.ficha.keys.elementAt(5),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1)),
                      suffixIcon: IconButton(
                          icon: Icon(Icons.assignment_turned_in_outlined),

                          color: Colors.blue,
                          onPressed: (){
                            setState(() {
                              //senhaInvisivel= !senhaInvisivel;
                            });
                          }
                      )),
                  obscuringCharacter: "*",
                  obscureText: false,
                  onSubmitted: (valor)=> {'testaLogin()'},
                  onChanged: (nSenha){
                    setState(() {
                      //mapaLogin['senha'] = nSenha;
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
                child: TextField(
                  controller: controleStatus,
                  decoration: InputDecoration(
                      labelText: widget.ficha.keys.elementAt(6),
                      hintText: widget.ficha.keys.elementAt(6),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1)),
                      suffixIcon: IconButton(
                          icon: Icon(Icons.check),

                          color: Colors.blue,
                          onPressed: (){
                            setState(() {
                              //senhaInvisivel= !senhaInvisivel;
                            });
                          }
                      )),
                  obscuringCharacter: "*",
                  obscureText: false,
                  onSubmitted: (valor)=> {'testaLogin()'},
                  onChanged: (nSenha){
                    setState(() {
                      //mapaLogin['senha'] = nSenha;
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
                child: Text("Descrição:\n$descricao "
                ,
                                  ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
                child: Text("Prazo: $prazo"
                  ,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
                child: Text("Analise:\n$avaliacao"
                  ,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
                child:(acoesRec.isNotEmpty)
                    ?Text("Data da Conclusão: ${acoesRec[0]['data_conclusao']}")
                    :Text("Data da Conclusão: Sem dados!"),
              ),

            ],
          ),
        ) ,
      ),
    );
  }
}
//(acoesRec.isNotEmpty)?acoesRec[0]['descricao']:"Sem dados!"