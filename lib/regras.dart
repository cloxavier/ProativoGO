import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dados.dart';
import 'dart:async';

bool valido(String valor) {
  return valor.isEmpty ? false : true;
}

//Faz requisição de dados
Future<String> getDadosProativaGo(
    String operacao,
    {String url,
    String reqStr, //Tem prioridade sobre mapaReq
    Map<String, dynamic> mapaReq = const {}}) async {
  // ignore: unnecessary_statements
  url ?? Url;
  print("\n\n                   ======== OPERAÇÃO"
      "  $operacao ========\nmapReq: $mapaReq\n"
      "============================================FIM DA OPERAÇÃO======================================\n\n");
  operacao = (operacao == null) ? "LOGIN" : operacao;
  print('o operação ====== $operacao =============');
  String Requis = "";

  if (reqStr == null) {

    if (mapaReq.isEmpty) {
      Requis = "&usuario=$login&senha=$senha&so=$so&modelo=$modelo";
    } else {
      //mapa.forEach((k,v){domapa +="&$k=$v";});
      mapaReq.forEach((k, v) => Requis += "&$k=$v");
    }
  } else {
    Requis = reqStr;
  }
  print('Requisições: $operacao$Requis');

  /* http.Response response = await http.get("${Url}?op=LOGIN&usuario=$login&senha=$senha"
      "&so=$so&modelo=$modelo");*/
  print("REQUISÇÃO: $Url?op=$operacao$Requis");
  var myurl =Uri.parse("$Url?op=$operacao$Requis");

  http.Response response=null;
  
  try{
    var myurl =Uri.parse("$Url?op=$operacao$Requis");
    response = await http.get(myurl).timeout(Duration(seconds: 20));

    print("O RESPONSE É: => $response");

  }//"$Url?op=$operacao$Requis");}
  catch(e){
    print("Ocorreu o erro abaixo\n");
    var erro = e.toString();
   if(erro.contains('errno = 110') || erro.contains('errno = 101')|| erro.contains('errno = 103'))
      { erro='110';}
    print(e.toString());
    return erro;
  }
  //VARIÀVEL TESTE
  List<Map<String,dynamic>> listaMapa=[];
  //dynamic erro;
  var retorno;
  print("Printando o response: ${response.body.runtimeType}");
  print("Printando o response: ${response.body.toString()}");

  // ALTERAR DEPOIS. TENTAR ENTENDER O BD SE ISSO É UMA POSSIBILIDADE.
  var rest = jsonDecode(response.body.replaceAll('\\', ""));

  print('===================================PRINT DO CORPO==============================');
  print(response.body);
  print('Tipo ${rest.runtimeType}');
  print('=================================== FIM CORPO==============================');

  try {
    if (operacao=='LOGIN') {

      if(rest.runtimeType.toString() != 'List<dynamic>'){
        dadosProativoGo = jsonDecode(response.body.replaceAll('\\', ""));
      }
      else{
        print('==========================================');
        print('NÃO LOGOU!');
        print('==========================================');
        dadosProativoGo = rest[0];
      }

      print(
          '===================================== INICIO PRINT LOGIN==============================');
      print(dadosProativoGo);

      print(
          '===================================== FIM PRINT LOGIN ================================');
      retorno = dadosProativoGo['erro'] ?? response.statusCode.toString();
    }else{
      dadosProativoGoL = jsonDecode(response.body.replaceAll('\\', ""));

      //ARAMZENA EM VARIÁVEIS AS BUSCAS
      switch(operacao){
        case "FICHASLISTA":
          {
            fichaListaRec =dadosProativoGoL;
            if(dadosProativoGoL!=null){dadosProativoGoL.forEach((element)
            {fichasListas.add(FichaLista.FromMap(element));});
            }else{
              print('==========================================');
              print('Não pegou a FICHASLISTA!');
              print('==========================================');

              return 'nulo';}
          }
          break;
        case "PEGAEMPRESA":
          { empresaRec =dadosProativoGoL;
          if(dadosProativoGoL!=null){ dadosProativoGoL.forEach((element)
                {
                  empresas.add(Empresa.FromMap(element));
                });}else{
            print('==========================================');
            print('Não pegou a PEGAEMPRESAS!');
            print('==========================================');

            return 'nulo';}
          }
          break;
        case "PEGAEMPRESAOBSERVADA":
          if(dadosProativoGoL!=null){empresaObservadaRec =dadosProativoGoL;}
          else{
            print('==========================================');
            print('Não pegou a PEGAEMPRESAOBSERVADA!');
            print('==========================================');
            return 'nulo';
          }

          break;
        case "LOCAL":
          if(dadosProativoGoL!=null){localRec =dadosProativoGoL;}
          else{
            print('==========================================');
            print('Não pegou a LOCAL!');
            print('==========================================');
            return 'nulo';
          }
          break;
        case "LOCALIZACAO":
          if(dadosProativoGoL!=null){localizacaoRec =dadosProativoGoL;}
          else{
            print('==========================================');
            print('Não pegou a LOCALIZACAO!');
            print('==========================================');
            return 'nulo';
          }
          break;
        case "PEGAACOES":
          if(dadosProativoGoL!=null){acoesRec =dadosProativoGoL;}
          else{
            print('==========================================');
            print('Não pegou a PEGAACOES!');
            print('==========================================');
            return 'nulo';
          }
          break;
        case "PLANOACAO":
          if(dadosProativoGoL!=null){planoAcoesRec =dadosProativoGoL;}
          else{
            print('==========================================');
            print('Não pegou a PLANOACAO!');
            print('==========================================');
            return 'nulo';
          }
          break;
        default:
          {print('==========================================');
          print('ESTA NÃO É UMA REQUISIÇÃO CONHECIDA!');
          print('==========================================');}
          break;
      }
      //
      retorno =(operacao=='LOGIN')? dadosProativoGoL[0]['erro']:response.statusCode.toString();
      /*print(" Retornando uma lista em dadosProativoGoL = $retorno");
    print(dadosProativoGoL);*/
    }
  } catch (e) {
    print("PEGOU UM ERRO AQUI AGORA!\n");
      print ("O ERRO FOI: ${e.toString()}");
      retorno= e.toString();
      return retorno;
  }
  // dadosProativaGo = jsonDecode(response.body);
  //print(" **** ****** **** **** Resultado = ${dadosProativaGo['erro']}");
 // print(dadosProativoGo);
  if (retorno=='000'&& operacao=='LOGIN'){
    log= LoginEstruct.FromMap(dadosProativoGo);

      if (listaRequests.isEmpty){
          dadosProativoGo.forEach((key, value) {
          listaRequests.add(key.toString() );
          });
      }
  }

 /* print("Este listaRequest: $listaRequests <<<<<<<<fim<<<<<<<<");*/
  retorno=retorno??response.statusCode.toString();

  return retorno;
}


//Analisar a necessida pois o login também é salvo na estrutrua logStruct
void salvaLogin(){
  status=dadosProativoGo['status'];
  conexao=dadosProativoGo['conexao'];
  resp=dadosProativoGo['resp'];
  idequipamento=dadosProativoGo['idequipamento'];
  usuario=dadosProativoGo['usuario'];
  idempresa=dadosProativoGo['idempresa'];
  razao_social=dadosProativoGo['razao_social'];
  nome_fantazia=dadosProativoGo['nome_fantazia'];
  departamento=dadosProativoGo['departamento'];
  turma=dadosProativoGo['turma'];
  admin=dadosProativoGo['admin'];
  gestor=dadosProativoGo['gestor'];
  gestorturma=dadosProativoGo['gestorturma'];
}


List<String> listaFromMap(List<dynamic> lista,String op){
  List<String> listaRetorno=[];
  Map<String,dynamic> aux={};
  aux = lista[0];
  List<String> chaves=[];
  var auxiliar;
  if(lista==null)lista=['--'];
  print("ÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇ");
  aux.forEach((key, value) { chaves.add('$key');});
  print("ÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇ");
    if (lista.isNotEmpty ){
      lista.forEach((element) {
        auxiliar = element[op].toString()??"0";
        listaRetorno.add(auxiliar);
        element.forEach((key,value){
          print('$key -- : -- $value');
         //if('$key'==op)listaRetorno.add(value.toString());
        });
      });}else{
      lista=[{"--":"--"}];
      listaRetorno=["--"];}
  print("LISTA DE RETORNO >>>> >>>> $listaRetorno");

  return listaRetorno;
}


//Le e escreve dados texto no dispositivo

//Abre arquivo
/*Future<File> getPreferencia() async {
  */ /*import 'dart:io' as io;
// for a file
  io.File(path).exists();
// for a directory
  io.Directory(path).exists();*/ /*
  final directory = await getApplicationDocumentsDirectory();
  return File("${directory.path}/preferencias.json" );
}
//Salva dados string
Future<File> salvaPreferencia() async {
  String data = json.encode(preferencias);

  final file = await getPreferencia();
  return file.writeAsString(data);
}*/
//Ledados string
/*Future<String> lePreferencia() async {
  try {
    final file = await getPreferencia();
    return file.readAsString();
  } catch (e) {
    return null;
  }
}*/

alerta(BuildContext context, String titulo, {String conteudo, Icon icone}) {
  Widget mensagem;
  if (icone != null) {
    mensagem = Column(
      children: [icone, Text(titulo)],
    );
  } else {
    mensagem = Text(titulo);
  }
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: mensagem,
            content: (conteudo==null)?null:Text(conteudo),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Ok'))
            ],
          ));
}

Future<String> buscaDados(String op, Map<String,dynamic> opcoes)async{
  return await getDadosProativaGo(op,mapaReq: opcoes);
}

/*
Future<String> fazRequisicoesNecessarias(BuildContext context)async{
  String retorno="";
  String requiscao="FICHASLISTA";
  try {
    print("**************************************************************************1");
    String fichalistaLida = await getDadosProativaGo('FICHASLISTA',
        mapaReq: {'conexao': log.conexao,
          'idempresa': idempresa});
    print("FICHASLISTA $fichalistaLida");
    print("**************************************************************************2");
    requiscao="LOCAL";
    String localLido = await getDadosProativaGo('LOCAL', mapaReq: {
      'conexao': log.conexao,
      'idempresa': idempresa
    }) ;
    print("**************************************************************************3");
    print("LOCAL $localLido");
    requiscao="LOCALIZACAO";
    String localizacaoLida = await getDadosProativaGo('LOCALIZACAO', mapaReq: {
      'conexao': log.conexao,
      'idempresa': idempresa,
      'idlocal': localRec[0]['idlocal']
    }) ;
    print("LOCALIZACAO $localizacaoLida");
    print("**************************************************************************4");
    requiscao="ACOES";
    String pegaAcaoLida = await getDadosProativaGo('PEGAACOES', mapaReq: {
      'conexao': log.conexao,
      'idficha': fichaListaRec[1]['idficha']
    });
    String pegaPlanoAcaoLida = await getDadosProativaGo('PLANOACAO', mapaReq: {
      'conexao': log.conexao,
      'idficha': fichaListaRec[1]['idficha']
    });
    print("PEGAACOES $pegaAcaoLida");
    var x=0;
    var y=0;
    retorno = "$fichalistaLida , $localLido , $localizacaoLida, $pegaAcaoLida, $pegaPlanoAcaoLida, ";
    if (fichaListaRec.isNotEmpty){
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
    }
    print("Numero de ações: ${acoes.length}");
    print("Numero de Planos de ações: ${planosAcoes.length}");


  }
  catch(e){
    print("Houve um Erro ao Pegar as Requisições: => $requiscao");
  }
  print("***************************************************************************");

  print ('Numero de acões $nacoes (((((((((()))))))))))((((((((((((((((((())))))))))))))()');

  return retorno;
}
*/
