import 'package:flutter/material.dart';

import 'package:proativago/apresentacaoDosDados.dart';
import 'package:proativago/dashboard.dart';
import 'novaficha.dart';
import 'dados.dart';
import 'regras.dart';

class telaInicial extends StatefulWidget {
  @override
  _telaInicialState createState() => _telaInicialState();
}

class _telaInicialState extends State<telaInicial> {
  dadosPie grafico = dadosPie();
  GraficoPie graficoStatus;
  String retornoFichasLisata="Buscando dados";
  String banco = "Protivo conexão: Valores Recebidos \n${log.toString()}";
  bool buscando = false;
  int locais=0;
  int localizacoes=0;
  @override
  void initState() {
    super.initState();
    atualiza();


  }
  void atualiza()async{
    print("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT");
    setState(() {
      buscando= true;

    });

    String retorno = await fazRequisicoesNecessarias(context);
    print("O retorno é: $retorno");
      setState(() {

        nfichas = fichaListaRec.length;

        nacoes = acoes.length;
        buscando = false;
        print("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT2");
      });

    /*print("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT2");
    setState(() {
      print("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT3");
      nfichas = fichaListaRec.length;
      print("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT4");
      nacoes = acoes.length;
      print("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT5");
    });*/
    atualizaGrafico();
  }
  //
  void atualizaGrafico(){
    print("LOCAIS E LOCALIZAÇÕES $locais/$localizacoes");
    double total=(locais+localizacoes)==0?100:(locais+localizacoes).toDouble();
    double loc =locais==0?50:locais.toDouble();
    double locz=localizacoes==0?50:localizacoes.toDouble();
    grafico.limpaTodasAsSeries();
    grafico.addItem("Total",total , Colors.red);
    grafico.addItem("Locais (${(loc/total*100).toStringAsFixed(1)}%)", loc, Colors.yellow);
    grafico.addItem("Localizações (${(locz/total*100).toStringAsFixed(1)}%)",locz, Colors.blue);

    setState(() {
     graficoStatus= GraficoPie(
       grafico: grafico,
       tituloGrafico: "Grafico de Locais",
        altura: altura*0.8,
        animar: false);
    });

  }

  //
  /* "status:$status\n"
      "resp:$resp\n"
      "idequipamento:$idequipamento\n"
      "usuario:usuario\n"
      "idempresa:$idempresa\n"
      "razao_social:$razao_social\n"
      "nome_fantasia:$nome_fantazia\n"
      "departamento:$departamento\n"
      "turma:$turma\n"
      "admin:$admin\n"
      "gestor:$gestor\n"
      "gestorturma:$gestorturma\n"
      "conexao:$conexao\n";*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(children:[ Text("IMERYS - Proativo GO")]),
              Row(children: [
                Icon(Icons.account_circle_outlined),
                Text("${log.usuario} - ${log.razao_social}",
                style: TextStyle(
                  fontSize: 14
                ),)
              ],)
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.blue, Colors.lightBlueAccent])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Imerys - ProativoGO',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(bottom: 10,top: 10),
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(49),
                          ),
                          width: largura * 0.2,
                          height: largura * 0.20,
                          child: Image.asset(
                            'assets/images/logo.jpg',
                          )),

                      Text(
                        '${log.usuario} - ${log.razao_social}',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )),
              ExpansionTile(
                title: Text('Formulários'),
                children: [
                  //EXPANSIVIES
                  ListTile(
                    leading: Icon(Icons.list_alt),
                    title: Text("Lista de Formulários"),
                    trailing: Icon(Icons.arrow_right),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(
                          builder: (BuildContext context) =>Dados()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.list_alt),
                    title: Text("Novo Formulário"),
                    trailing: Icon(Icons.arrow_right),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.list_alt),
                    title: Text("Novo Formulário"),
                    trailing: Icon(Icons.arrow_right),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              //CARD SAIR
              Card(
                elevation: 5,
                child: ListTile(
                  leading: Icon(Icons.list_alt),
                  title: Text("Sair"),
                  trailing: Icon(Icons.clear),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(8),
         // width: menorTamanho * 0.8,
          height: altura * 0.95,
          child: SingleChildScrollView(
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Container(
                    height: altura*.5,

                    child: Card(
                        elevation: 7,
                        child: Container(child:graficoStatus)),),
                  Container(


                    child: Card(
                      elevation: 7,
                      child: Column(

                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(

                              mainAxisAlignment: MainAxisAlignment.spaceAround ,
                              children: [
                              Text(('Total de fichas: $nfichas')),
                              Text('Total de ações $nacoes'),
                            ],),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(

                              mainAxisAlignment: MainAxisAlignment.spaceAround ,
                              children: [
                                //Lembrar de criar variáveis
                                Text(('Total Locais: $locais')),
                                Text('Total de Localiações $localizacoes'),
                              ],),
                          ),
                          //info buscando dasdos
                          Visibility(
                              visible: true,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                Text(retornoFichasLisata),
                                Container(
                                    height: 20,
                                    width: 20,
                                    child: Visibility(
                                        visible:buscando ,
                                        child: CircularProgressIndicator())
                                )
                              ],))
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text("DADOS RECEBIDOS DO LOGIN"),
                      Text(banco),
                    ],
                  ),
                  IconButton(
                      onPressed: () async {
                        //
                        String retEmp = await buscaDados(
                                "PEGAEMPRESA", {"conexao": log.conexao})
                            .then((value) {
                          return buscaDados("LOCAL", {
                            "conexao": log.conexao,
                            'idempresa': empresaRec[0]['IDEMPRESA']
                          }).then((value) {
                            print("Valor do buscando dados $value ");
                            return null;

                          });
                        });

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    NovaFicha()));
                        //
                      },
                      icon: Icon(Icons.build, size: 35)),
                ],
              ),
            ),
          ),
        ));
  }
  Future<String> fazRequisicoesNecessarias(BuildContext context)async{
    String retorno="";
    String requisicao = "FICHASLISTA";
    try {
      String fichalistaLida = await getDadosProativaGo('FICHASLISTA',
          mapaReq: {'conexao': log.conexao,
            'idempresa': idempresa});
      print("FICHASLISTA $fichalistaLida");
      if(fichalistaLida!="nulo"){await pegaOutrosDados();
      }else{
        setState(() {
          buscando=false;
          retornoFichasLisata="Não foram encontradas fichas!";
        });
      }
      requisicao = "LOCAL";
     String localLido = await getDadosProativaGo('LOCAL', mapaReq: {
        'conexao': log.conexao,
        'idempresa': idempresa
      }).then((value){
       setState(() {
         locais=localRec.length;
         atualizaGrafico();
       });
       return null;
     }) ;

      requisicao = "LOCALIZACAO";
      String localizacaoLida = await getDadosProativaGo('LOCALIZACAO', mapaReq: {
        'conexao': log.conexao,
        'idempresa': idempresa,
        'idlocal': localRec[0]['idlocal']

      }).then((value) {
        setState(() {
          localizacoes=localizacaoRec.length;
          atualizaGrafico();
        });
        return null;
      }) ;
      requisicao = "ACAO";
      String pegaAcaoLida = await getDadosProativaGo('PEGAACOES', mapaReq: {
        'conexao': log.conexao,
        'idficha': fichaListaRec[1]['idficha']
      });
      String pegaPlanoAcaoLida = await getDadosProativaGo('PLANOACAO', mapaReq: {
        'conexao': log.conexao,
        'idficha': fichaListaRec[1]['idficha']
      });

      retorno = "$fichalistaLida , $localLido , $localizacaoLida, $pegaAcaoLida, $pegaPlanoAcaoLida, ";
      /*if (fichaListaRec.isNotEmpty){
        List<bool> pegaAcoesLido=[];
        fichaListaRec.forEach((element)async {
          y++;
          print("*********************$y********************$y***************************$y");
          String pgacoes = await getDadosProativaGo('PEGAACOES', mapaReq: {
            'conexao':log.conexao,
            'idficha':element['idficha']
          });
          retorno+= '$pgacoes\n';
          if(acoesRec.isNotEmpty){x++;
          print("Ação $x");
          acoes.add(acoesRec);
          nacoes=x;
          }
          String pacao = await getDadosProativaGo('PLANOACAO', mapaReq: {
            'conexao':log.conexao,
            'idficha':element['idficha']
          });
          retorno+= '$pacao\n';
          planosAcoes.add(planoAcoesRec);
          print("LOOP\n\n Loop $y");
        });
      }*/
      setState(() {
        locais=localRec.length;
        localizacoes=localizacaoRec.length;
      });
    }
    catch(e){
      print("Houve um erro ao pegar as requisições: => $requisicao");
    }
    print("***************************************************************************");
    print ('Numero de acões $nacoes (((((((((()))))))))))((((((((((((((((((())))))))))))))()');
    return retorno;
  }

  void pegaOutrosDados()async{
    String retorno='';
    if (fichaListaRec.isNotEmpty){
      List<bool> pegaAcoesLido=[];
      fichaListaRec.forEach((element)async {
      String pgacoes = await getDadosProativaGo('PEGAACOES', mapaReq: {
          'conexao':log.conexao,
          'idficha':element['idficha']
        });
        retorno+= '$pgacoes\n';
        if(acoesRec.isNotEmpty){

        acoes.add(acoesRec);

        }
        String pacao = await getDadosProativaGo('PLANOACAO', mapaReq: {
          'conexao':log.conexao,
          'idficha':element['idficha']
        });
        retorno+= '$pacao\n';
        planosAcoes.add(planoAcoesRec);

      });
    }

  }
}


