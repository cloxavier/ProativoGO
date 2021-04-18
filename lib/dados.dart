import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';

//import 'dart:async';
String erroColumn='erro';
String statusColumn='status';
String respColumn='resp';
String idequipamentoColumn='idequipamento';
String conexaoColumn='conexao';
String idusuarioColumn='idusuario';
String usuarioColumn='usuario';
String idempresaColumn='idempresa';
String razao_socialColumn='razao_social';
String nome_fantaziaColumn='nome_fantazia';
String departamentoColumn='departamento';
String turmaColumn='turma';
String adminColumn='admin';
String gestorColumn='gestor';
String gestorturmaColumn='gestorturma';

class LoginEstruct {
  String erro;
  String status;
  String resp;
  String idequipamento;
  String conexao;
  String idusuario;
  String usuario;
  String idempresa;
  String razao_social;
  String nome_fantazia;
  String departamento;
  String turma;
  String admin;
  String gestor;
  String gestorturma;

  LoginEstruct.FromMap(Map map) {
    erro = map[erroColumn];
    status = map[statusColumn];
    resp = map[respColumn];
    idequipamento = map[idequipamentoColumn];
    conexao = map[conexaoColumn];
    idusuario = map[idusuarioColumn];
    usuario = map[usuarioColumn];
    idempresa = map[idempresaColumn];
    razao_social = map[razao_socialColumn];
    nome_fantazia = map[nome_fantaziaColumn];
    departamento = map[departamentoColumn];
    turma = map[turmaColumn];
    admin = map[adminColumn];
    gestor = map[gestorColumn];
    gestorturma = map[gestorturmaColumn];
  }
  Map toMap(){
    Map<String,dynamic> map = {
      erroColumn:erro,
      statusColumn:status,
      respColumn:resp,
      idequipamentoColumn:idequipamento,
      conexaoColumn:conexao,
      idusuarioColumn:idusuario,
      usuarioColumn:usuario,
      idempresaColumn:idempresa,
      razao_socialColumn:razao_social,
      nome_fantaziaColumn:nome_fantazia,
      departamentoColumn:departamento,
      turmaColumn:turma,
      adminColumn:admin,
      gestorColumn:gestor,
      gestorturmaColumn:gestorturma,
    };
    List<String> chaves(){
      List<String> chave = [erroColumn,statusColumn,respColumn,
      idequipamentoColumn,conexaoColumn,idusuarioColumn,usuarioColumn,
      idempresaColumn,razao_socialColumn,nome_fantaziaColumn,
      departamentoColumn, turmaColumn, adminColumn,gestorColumn,
      gestorturmaColumn,];
    return chave;
    };
    return map;
  }

  @override
  String toString() {
    return "$erroColumn:$erro\n$statusColumn:$status\n"
    "$respColumn:$resp\n$idequipamentoColumn:$idequipamento\n"
    "$conexaoColumn:$conexao\n$idusuarioColumn:$idusuario\n"
    "$usuarioColumn:$usuario\n$idempresaColumn:$idempresa\n"
    "$razao_socialColumn:$razao_social\n$nome_fantaziaColumn:$nome_fantazia\n"
    "$departamentoColumn:$departamento\n$turmaColumn:$turma\n"
    "$adminColumn:$admin\n$gestorColumn:$gestor\n"
    "$gestorturmaColumn:$gestorturma";
  }
}

class Empresa{
  String IDEMPRESA;
  String RAZAO_SOCIAL;
  String NOME_FANTAZIA;
  String CNPJ;
  String CONTRATADA;
  String DATA_CADASTRO;

 Empresa(this.IDEMPRESA,this.RAZAO_SOCIAL,this.NOME_FANTAZIA,this.CNPJ,this.CONTRATADA,this.DATA_CADASTRO);

  Map toMap() {
    Map<String, dynamic> map = {
      'IDEMPRESA': IDEMPRESA,
      'RAZAO_SOCIAL': RAZAO_SOCIAL,
      'NOME_FANTAZIA': NOME_FANTAZIA,
      'CNPJ': CNPJ,
      'CONTRATADA': CONTRATADA,
      'DATA_CADASTRO': DATA_CADASTRO,
    };
  }
    Empresa.FromMap(Map map) {
    IDEMPRESA =map['IDEMPRESA'];
    RAZAO_SOCIAL = map['RAZAO_SOCIAL'];
    NOME_FANTAZIA = map['NOME_FANTAZIA'];
    CNPJ =map['CNPJ'];
    CONTRATADA = map['CONTRATADA'];
    DATA_CADASTRO =map['DATA_CADASTRO'];
  }
}

class FichaLista{

 String idficha="";
 String nro="";
 String local="";
 String localizao="";
 String departamento="";
 String classificao ="";
 String status = "";
 List<String> chaves =['idficha','nro', 'local','localizao','departamento',
                      'classificao','status'];

 FichaLista(this.idficha,this.nro,this.local,this.localizao,
             this.departamento,this.classificao,this.status);


 Map toMap() {
   Map<String, dynamic> map = {
     'idficha': idficha,
     'nro': nro,
     'local': local,
     'localizao': localizao,
     'departamento': departamento,
     'classificao': classificao,
     'status': status,
   };
 }
 FichaLista.FromMap(Map map) {
   idficha =map['idficha'];
   nro = map['nro'];
   local = map['local'];
   localizao =map['localizao'];
   departamento = map['departamento'];
   classificao =map['classificao'];
   status =map['status'];
 }

 @override
  String toString() {
    return    "idficha:${this.idficha}\nnro:$nro\n"
              "local:$local\nlocalizao:$localizao\n"
              "departamento:$departamento\nclassificao:$classificao\n"
              "status:$status";
 }
}
//ANALISAR SE VAI SER NECESSÁRIO MANTER
class Acao{

  String idacao= "";
  String idficha= "";
  String data= "";
  String descricao= "";
  String data_alerta= "";
  String data_prazo="";
  String data_conclusao= "";
  String avaliacao= "";
  String status= "";
  List<String> responsaveis= [];

  Acao(this.idacao,this.idficha,this.data,this.descricao,this.data_alerta,
      this.data_prazo,this.data_conclusao,this.responsaveis);

  Map toMap() {
    Map<String, dynamic> map = {
      "idacao": 'idacao',
      "idficha" : idficha,
      "data" : data,
      "descricao" : descricao,
      "data_alerta" : data_alerta,
      "data_prazo" : data_prazo,
      "data_conclusao" : data_conclusao,
      "avaliacao" : avaliacao,
      "status" : status,
      "responsaveis" : responsaveis,
    };

  }
  Acao.FromMap(Map map) {
    idacao= map['idacao'];
    idficha = map['idficha'];
    data = map['data'];
    descricao = map['descricao'];
    data_alerta = map['data_alerta'];
    data_prazo = map['data_prazo'];
    data_conclusao = map['data_conclusao'];
    avaliacao = map['avaliacao'];
    status = map['status'];
    responsaveis = map['responsaveis'];
  }


}
//
// TIPOS CRIADOS
LoginEstruct log;
List<Empresa> empresas=[];
List<FichaLista> fichasListas=[];
List<dynamic> acoes=[];
List<dynamic> planosAcoes=[];

//Requisição anterior
//String Url = "https://www.imerysproativo.com/proativogo/webservice/requisicao.php";
//String Url = "http://192.168.80.100/proativogo/webservice/requisicao.php";
String Url = "http://192.168.80.182/proativogo/webservice/requisicao.php";
//192.168.80.182
String login = "cesarxavier66@gmail.com";
String senha = "Jo2JWzcx";
String so = "android";
String modelo = "modelo";
//String idequipamento ="{3E6285B6-7047-D86F-B15E-48A4C9B5048B}";//usando com o primeiro link
//String idequipamento = "{CACF8042-7103-D5DA-6BD4-14D2403E19CA}";
String idequipamento = "{C2178332-8273-620E-6B6C-77082B44E370}";
////////
String status = "Equipamento[status]";
String resp = "Equipamento[resp]";
String conexao = "Equipamento[conexao]";
String usuario = "Equipamento[usuario]";
String idempresa = "Equipamento[idempresa]";
String razao_social = "Equipamento[razao_social]";
String nome_fantazia = "Equipamento[nome_fantazia]";
String departamento = "Equipamento[departamento]";
String turma = "Equipamento[turma]";
String admin = "Equipamento[admin]";
String gestor = "Equipamento[gestor]";
String gestorturma = "Equipamento[gestorturma]";
//bool logado = false;

/////////////////////////////////////////
//LISTA DOS DADOS A RECEBER
////////////////////////////////////////
List<dynamic> empresaRec=[];
List<dynamic> empresaObservadaRec=[];
List<dynamic> departamentoRec=[];
List<dynamic> localRec=[];
List<dynamic> localizacaoRec=[];
List<dynamic> fichaListaRec=[];
List<dynamic> planoAcoesRec=[];
List<dynamic> acoesRec=[];

//List<String> lEmpresas=[];

////////
//operadores
String operLogin = "LOGIN";

//INTERFACE
String plataforma;

bool isTemaDark = false;
double altura;
double largura;
double densidadeH;
double menorTamanho;

bool gravarSenha = false;
List<String> listaRequests = [];


//valores individuais
int nfichas = 0;
int nacoes = 0;

//Mapas de requisição
Map<String, dynamic> mapaLogin = {
  "usuario": login,
  "senha": senha,
  "so": so,
  "modelo": modelo,
  "idequipamento": idequipamento
};
Map<String, dynamic> mapaReq = {
  'LOGIN': {
    "usuario": login,
    "senha": senha,
    "so": so,
    "modelo": modelo,
    "idequipamento": idequipamento
  },
  'FICHASLISTA': {
    "conexao": conexao,
    "idempresa": idempresa,
  },
  'LOCAL' :{
    "conexao": conexao,
    "idempresa": idempresa,
  },
  'PEGAEMPRESA': {
    "conexao": conexao,
    "idempresa": idempresa,
  },
  ops[4]: {
    "usuario": login,
    "senha": senha,
    "so": so,
    "modelo": modelo,
    "idequipamento": idequipamento
  },
  ops[5]: {
    "usuario": login,
    "senha": senha,
    "so": so,
    "modelo": modelo,
    "idequipamento": idequipamento
  },
  ops[6]: {"conexao": login},
  ops[7]: {
    "usuario": login,
    "senha": senha,
    "so": so,
    "modelo": modelo,
    "idequipamento": idequipamento
  },
  ops[8]: {
    "usuario": login,
    "senha": senha,
    "so": so,
    "modelo": modelo,
    "idequipamento": idequipamento
  },
  ops[9]: {
    "usuario": login,
    "senha": senha,
    "so": so,
    "modelo": modelo,
    "idequipamento": idequipamento
  },
  ops[10]: {
    "usuario": login,
    "senha": senha,
    "so": so,
    "modelo": modelo,
    "idequipamento": idequipamento
  },
  ops[11]: {
    "usuario": login,
    "senha": senha,
    "so": so,
    "modelo": modelo,
    "idequipamento": idequipamento
  },
  ops[12]: {
    "usuario": login,
    "senha": senha,
    "so": so,
    "modelo": modelo,
    "idequipamento": idequipamento
  },
  ops[13]: {
    "conexao": conexao,
  },
  ops[14]: {
    "conexao": conexao,
  }
};

List<String> ops = [
  "LOGIN",
  "NOVAFICHA",
  "ANALISE",
  "ANALISEEXC",
  "PLANOACAO",
  "EFICACIA",
  "FICHASLISTA",
  "ACAONOVA",
  "ACAOALTERA",
  "PEGAACOES",
  "EMPRESA",
  "LOCAL",
  "LOCALIZACAO",
  "DEPARTAMENTO",
  "CLASSIFICACAO",
  'PEGAEMPRESA',
  'PEGAEMPRESAOBSERVADA'
];

Map<String, dynamic> dadosProativoGo;
List<dynamic> dadosProativoGoL = [];
//List<Map<String,dynamic>> listaProativoGo=[];
/*
Future<String> getDadosProativaGo() async{
  http.Response response = await http.get("${Url}?op=LOGIN&usuario=$login&senha=$senha"
      "&so=$so&modelo=$modelo");
  print(response.body);
  dadosProativaGo = jsonDecode(response.body);
  return dadosProativaGo['erro'];
}
*/

/*
Future<Map> getDadosProativaGo() async{
  http.Response response = await http.get("${Url}?op=LOGIN&usuario=$login&senha=$senha"
      "&so=$so&modelo=$modelo");
  print(response.body);
  dadosProativaGo = jsonDecode(response.body);
  return dadosProativaGo;
}*/
//Esttruturas
//Login
