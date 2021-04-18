import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dados.dart';


bool valido(String valor){
 return valor.isEmpty ?false: true;
}

Future<String> getDadosProativaGo() async{
  http.Response response = await http.get("${Url}?op=LOGIN&usuario=$login&senha=$senha"
      "&so=$so&modelo=$modelo");
  dynamic erro;
  print(response.body);
  try{
    dadoProativaGo = jsonDecode(response.body);
    print(" **** ****** **** **** Resultado = ${dadoProativaGo['erro']}");
    print(dadoProativaGo);

  }catch(e){
    erro =  jsonDecode(response.body);
    dadoProativaGo = erro[0];
    print(" **** ****** **** **** Resultado = ${dadoProativaGo['erro']}");
    print(dadoProativaGo);
  };
 // dadoProativaGo = jsonDecode(response.body);
  //print(" **** ****** **** **** Resultado = ${dadoProativaGo['erro']}");
  print(dadoProativaGo);
  return dadoProativaGo['erro'];
}

alerta(BuildContext context,String texto,{Icon? icone})
{
  Widget mensagem;
  if (icone!=null){ mensagem = Column(children: [icone,Text(texto)],);
  }else{mensagem=Text(texto);}
  showDialog(context: context,
    builder:(context)=>AlertDialog(
      title: mensagem,
      actions: [ElevatedButton(onPressed: (){
        Navigator.of(context).pop();
      },
          child: Text('ok'))],
    ));
}
