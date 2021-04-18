
String Url = "https://www.imerysproativo.com/proativogo/webservice/requisicao.php";
String login ="cesarxavier66@gmail.com";
String senha= "Jo2JWzcx";
String so="android";
String modelo = "modelo";

//INTERFACE
String plataforma='';
bool isTemaDark = false;
double altura=0;
double largura=0;
double densidadeH=0;
double menorTamanho=0;

bool gravarSenha = false;

Map<String,dynamic> dadoProativaGo={};

/*
Future<String> getDadosProativaGo() async{
  http.Response response = await http.get("${Url}?op=LOGIN&usuario=$login&senha=$senha"
      "&so=$so&modelo=$modelo");
  print(response.body);
  dadoProativaGo = jsonDecode(response.body);
  return dadoProativaGo['erro'];
}
*/

/*
Future<Map> getDadosProativaGo() async{
  http.Response response = await http.get("${Url}?op=LOGIN&usuario=$login&senha=$senha"
      "&so=$so&modelo=$modelo");
  print(response.body);
  dadoProativaGo = jsonDecode(response.body);
  return dadoProativaGo;
}*/
