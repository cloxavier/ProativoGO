import 'package:flutter/material.dart';

class Dados extends StatefulWidget {
  @override
  _DadosState createState() => _DadosState();
}

class _DadosState extends State<Dados> {
  String Erro='';
  String Status='';
  String Resposta='';
  String idEquip='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("ProativaGo")),
      body:Container()/*Column(
        children: [
          FutureBuilder(
              future: getDadosProativaGo(),
              builder: (context ,snapshot){
                switch(snapshot.connectionState){
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(child: Text("Carrregando dados...",
                      textAlign: TextAlign.center,));
                  default:
                    if(snapshot.hasError){
                      return Center(child: Text("Erro Carrregando dados...",
                        textAlign: TextAlign.center,));
                    }else{
                      Erro =snapshot.data["erro"];
                      Status = (snapshot.data["status"]=="PA")?"Pendente análise":Status;
                      Resposta=snapshot.data["resp"];
                      idEquip = snapshot.data["idequipamento"];
                      return Column(

                        children: [
                          Text("Numero do erro: $Erro"),
                          Text("Status: $Status"),
                          Text("Situação do Dispositivo: $Resposta"),
                          Text("ID: $idEquip"),
                        ],

                      ) ;
                    }
                }
              }),
          Container(
            child: Dados(),
          )
        ],
      ) */,
    );
  }
}
