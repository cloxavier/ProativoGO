import 'package:flutter/material.dart';
import 'dados.dart';
import 'regras.dart';
import 'fichaEditor.dart';

class Dados extends StatefulWidget {
  @override
  _DadosState createState() => _DadosState();
}

class _DadosState extends State<Dados> {
 // String Erro;
  int numeroDeFichas =0;
  String statusDaRec = '';
  String resposta="Aguardando...";
  //String idEquip;
  int fichaSel = 0;
  String selecao="LOGIN";
  String reqSelescao = "erro";
  String itemRetornado="Aguardando seleção ou digitação";
 // TextEditingController controlaRequiscao = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("ProativaGo - (${dadosProativoGo['usuario']})")),
      body:Container(
        child: Column(children: [
          Row(children: [Text('Total $numeroDeFichas Registros // '),
            Text('Item selecionado $fichaSel')],),
         /* Row(children: [Text('Status da requisição: $statusDaRec')],),*/
          /*SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              //DropDown operação
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                 //   horizontal: largura * margem),
                //width: largura * 0.25,
                alignment: Alignment.center,
                child: DropdownButton<String>(
                  value: selecao,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 20,
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 19,
                  ),
                  underline: Container(
                    height: 2,
                    color: Colors.blueAccent,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      selecao = newValue;
                     // mesAtual = mesesAbrev.indexOf(newValue) + 1;
                    });
                  },
                  items: ops.map<DropdownMenuItem<String>>(
                          (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                ),
              ),
              //opções
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                //   horizontal: largura * margem),
                //width: largura * 0.25,
                alignment: Alignment.center,
                child: DropdownButton<String>(
                  value: reqSelescao,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 20,
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 19,
                  ),
                  underline: Container(
                    height: 2,
                    color: Colors.blueAccent,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      reqSelescao = newValue;
                     *//* itemRetornado=dadosProativaGo[newValue];
                      controlaRequiscao.text = dadosProativoGo[newValue];
                       mesAtual = mesesAbrev.indexOf(newValue) + 1;*//*
                    });
                  },
                  items: listaRequests.map<DropdownMenuItem<String>>(
                          (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                ),
              ),

              //

            ],),
          ),*/
         /* TextField(
            controller: controlaRequiscao,
            decoration: InputDecoration(
              labelText:itemRetornado,
              hintText: "Selecione da caixa requisição para auto preencimento!"
            ),
          ),*/
          ElevatedButton(
              onPressed:fichaListaRec!=null? ()async{
            print("===================================================");
            print('$reqSelescao:${dadosProativoGo[reqSelescao]}');
            print("===================================================");
            String resultado =
             await getDadosProativaGo( selecao,
                mapaReq:{
              'conexao':dadosProativoGo['conexao'],
              reqSelescao:dadosProativoGo[reqSelescao]});
              //  if (selecao=="FICHASLISTAS"){print('${fichaListaRec.chaves}');}
            //resposta="";
            setState(() {
              statusDaRec = resultado;

              numeroDeFichas = dadosProativoGoL.length;

              /* for(int i=0; i<numeroDeFichas;i++){
                resposta += "Ficha numero(${i+1})\n\n";
              dadosProativoGoL[i].forEach((key, value) {
                resposta += "$key=$value\n";});
                resposta += "**********************\n\n";
              }*/
            });

          }:null, child: Text("Pesquisa")),
          Container(height: altura*0.65,
            child:fichaListaRec!=null? ListView.builder(
              //itemCount: dadosProativoGoL.length, //PEGA O TAMANHO DO MAPA
              itemCount: fichaListaRec.length, //PEGA O TAMANHO DO MAPA
              itemBuilder: (BuildContext context, int index) {
                //String key = empresaRec[index].keys.elementAt(index);//PEGA AS CHAVES DO MAPA
                return new Column(
                  children: <Widget>[
                    ListTile(
                      title:
                      //Text(   "${fichasListas[index].toString()}" /*['local']*/
                      Text("Ficha: ${index+1}\n${fichaListaRec[index]}" /*['local']*/
                         /* " - ${dadosProativoGoL[index]['localizao']}"*/), //COLOCA AS CHAVES NO TITULO
                      /*subtitle:  Text("${dadosProativoGoL[index]['departamento']}"
                          "\nStatus = ${dadosProativoGoL[index]['status']}"),*///COLOCA OS VALORES NO SUB TITULO
                      onTap: ()async{
                        print('Este é a ficha $index');
                        setState(() {
                          fichaSel=index+1;
                        });
                        String retL = await getDadosProativaGo('LOCAL', mapaReq: {
                          'conexao':log.conexao,
                          'idempresa':idempresa
                        });
                        String retLz = await getDadosProativaGo('LOCALIZACAO', mapaReq: {
                          'conexao':log.conexao,
                          'idempresa':idempresa,
                          'idlocal':localRec[0]['idlocal']
                        });
                        String ret = await getDadosProativaGo('PEGAACOES', mapaReq: {
                        'conexao':log.conexao,
                        'idficha':fichaListaRec[index]['idficha']
                        });

                        Navigator.push(context,MaterialPageRoute(
                            builder: (BuildContext context)
                       =>EditorFichas(
                         ficha:fichaListaRec[index],indice: index,)
                        ));
                      },
                    ),
                    new Divider(
                      height: 3.0,
                      thickness: 1,
                      color: Colors.blueAccent,
                    ),
                  ],
                );},
            )
                :Text("Não há fichas para visualização!"),)
        ],),
      ),
    );
  }
}


/*
ListView.builder(
                 itemCount: empresaRec.length, //PEGA O TAMANHO DO MAPA
                 itemBuilder: (BuildContext context, int index) {
                   //String key = empresaRec[index].keys.elementAt(index);//PEGA AS CHAVES DO MAPA
                   return new Column(
                     children: <Widget>[
                       ListTile(
                         title: new Text("${empresaRec[index]['RAZAO_SOCIAL']}"), //COLOCA AS CHAVES NO TITULO
                         subtitle: new Text("${empresaRec[index]['NOME_FANTAZIA']}"),//COLOCA OS VALORES NO SUB TITULO
                      onTap: (){
                           print('Este é o $index');
                       },
                       ),
                       new Divider(
                         height: 2.0,
                       ),
                     ],
                   );},
               ),
* */