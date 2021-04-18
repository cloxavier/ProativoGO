import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proativago/regras.dart';

import 'dados.dart';

/*const String optE = 'NOME_FANTAZIA';
const String optF = 'descricao' ?? "--";
const String optL = 'DESCRICAO' ?? "--";*/

class NovaFicha extends StatefulWidget {
  @override
  _NovaFichaState createState() => _NovaFichaState();
}

class _NovaFichaState extends State<NovaFicha> {
  // Future ret = getDadosProativaGo("PEGAEMPRESA",mapaReq: {"conexao":log.conexao});
  //Future<String> retorno =  pegaAsEmpresas() as Future<String>;
  /*String reqSelecaoEmp = empresaRec[0][optE];
  String reqSelecaoFil = localRec.isNotEmpty ? localRec[0][optF] : "--";
  String reqSelecaoLocz = localRec.isNotEmpty ? localizacaoRec[0][optF] : "--";

  List<String> lEmpresas = listaFromMap(empresaRec, optE);
  List<String> lFilial = localRec.isNotEmpty ? listaFromMap(localRec, optF) : [
    "--"
  ];
  List<String> lLocalizacao = localRec.isNotEmpty ? listaFromMap(
      localizacaoRec, optL) : ["--"];*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Proativo GO"),
          actions: [
            Column(
              children: [Text('${log.usuario}'), Text('${log.turma}')],
              mainAxisAlignment: MainAxisAlignment.center,
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Cadastro de Ocorrência",
                    style: Theme.of(context).textTheme.headline5),
              ),
              SingleChildScrollView(
                child: Container(
                  height: altura * 0.8,
                  child: ListView.builder(
                    itemCount: empresaRec.length, //PEGA O TAMANHO DO MAPA
                    itemBuilder: (BuildContext context, int index) {
                      //String key = empresaRec[index].keys.elementAt(index);//PEGA AS CHAVES DO MAPA
                      return new Column(
                        children: <Widget>[
                          ListTile(
                            title: new Text(
                                "${empresaRec[index]['RAZAO_SOCIAL']}"),
                            //COLOCA AS CHAVES NO TITULO
                            subtitle: new Text(
                                "${empresaRec[index]['NOME_FANTAZIA']}"),
                            //COLOCA OS VALORES NO SUB TITULO
                            onTap: () {
                              print('Este é o $index');
                            },
                          ),
                          new Divider(
                            height: 2.0,
                          ),
                        ],
                      );
                    },
                  ),
                )
                /* Column(

            children: [
            Container(
            width: largura,
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.grey[300]
            ),
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Empresa",
                    style: Theme
                        .of(context)
                        .textTheme
                        .subtitle1,),
                  DropdownButton<String>
                    (
                    value: reqSelecaoEmp,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 20,
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 14,
                    ),
                    underline: Container(
                      height: 2,
                      color: Colors.blueAccent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        reqSelecaoEmp = newValue;
                        //itemRetornado=dadosProativaGo[newValue];
                        //controlaRequiscao.text = dadosProativoGo[newValue];
                        // mesAtual = mesesAbrev.indexOf(newValue) + 1;
                      });
                    },
                    items: lEmpresas.map<DropdownMenuItem<String>>(
                            (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: SingleChildScrollView(child: Text(value),
                              scrollDirection: Axis.horizontal,),
                          );
                        }).toList(),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: largura,
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.grey[300]
            ),
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Filial",
                    style: Theme
                        .of(context)
                        .textTheme
                        .subtitle1,),
                  DropdownButton<String>
                    (

                    value: reqSelecaoFil,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 20,
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 14,
                    ),
                    underline: Container(

                      height: 2,
                      color: Colors.blueAccent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        reqSelecaoFil = newValue;
                        //itemRetornado=dadosProativaGo[newValue];
                        //controlaRequiscao.text = dadosProativoGo[newValue];
                        // mesAtual = mesesAbrev.indexOf(newValue) + 1;
                      });
                    },
                    items: lFilial.map<DropdownMenuItem<String>>(
                            (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: SingleChildScrollView(child: Text(value),
                              scrollDirection: Axis.horizontal,),
                          );
                        }).toList(),
                  ),
                ],
              ),
            ),
          ),
          itemFicha(
              context, "Local da Ocorrencia", reqSelecaoLocz, lLocalizacao),
          /////////////////////////////////////////////////////////////////////////////////////

    /////////////////////////////////////////////////////////////////////////////////////
    ],
    )*/
                ,
              ),
            ],
          ),
        ));
  }

  Container itemFicha(BuildContext context, String titulo, String controle,
      List<String> lista) {
    return Container(
      width: largura,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.grey[300]),
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$titulo",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            DropdownButton<String>(
              value: controle,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 20,
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 14,
              ),
              underline: Container(
                height: 2,
                color: Colors.blueAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  controle = newValue;
                  //itemRetornado=dadosProativaGo[newValue];
                  //controlaRequiscao.text = dadosProativoGo[newValue];
                  // mesAtual = mesesAbrev.indexOf(newValue) + 1;
                });
              },
              items: lista.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: SingleChildScrollView(
                    child: Text(value),
                    scrollDirection: Axis.horizontal,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

/*
DropdownButton<String>(
          value: _value,
          items: <DropdownMenuItem<String>>[
            new DropdownMenuItem(
              child: new Text('one'),
              value: 'one',
            ),
            new DropdownMenuItem(
              child: new Text('two'),
              value: 'two'
            ),
          ],
          onChanged: (String value) {
            setState(() => _value = value);
          },)
* */
