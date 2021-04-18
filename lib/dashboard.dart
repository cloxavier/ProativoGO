import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as chart;
class itemPie{
  String nomes;
  double valores;
  Color cores;
  itemPie(this.nomes,this.valores,this.cores);

  itemPie.fromMap(Map map){
    nomes=map['nome'];
    valores=map['valores'];
    cores=map['cores'];

  }
}
class dadosPie{

//String nomes;
//double valores;
//Color cores;
//Color coresPadrao;
  List<itemPie> series=[];
  List<chart.Series<itemPie,String>> _serieFinalPie=[];
// charts.Series<LinearSales, int>
  dadosPie();

  /* getSeries(){
     _series =[];
    for(int x=0;x<_series.length;x++){
      _series.add(itemPie(nomes,valores,cores));
    }
     return _series;
   }*/
/*dadosPie.fromMap(Map map){
     //nomes=map['nome'];
     //valores=map['valores'];
     //cores=map['cores'];
     series.add(itemPie(map['nome'],map['valores'],map['cores']));
    }*/
  dadosPie.fromListOfMap(List<dynamic> lista){
    lista.forEach((map) {
      // nomes=map['nome'];
      //valores=map['valores'];
      //cores=map['cores'];
      series.add(itemPie(map['nome'],map['valores'],map['cores']));
    });
  }
  addItemSerie(List<dynamic> item){
    //nomes=item[0];
    //valores=item[1];
    //cores=item[2];
    series.add(itemPie(item[0], item[1], item[2]));
  }
  addItem(String nome,double valor,Color cor){
    //nomes=nome;
    //valores=valor;
    //cores=cor;
    series.add(itemPie(nome,valor,cor));
  }
  limpaSerieFinal(){
    _serieFinalPie=[];
  }
  limpaSeries(){
    series=[];
  }
  limpaTodasAsSeries(){
    series=[];
    _serieFinalPie=[];
  }

  /*
    List<itemPie> _series=[];
List<chart.Series<itemPie,String>> _serieFinalPie=[];
    * */
  List<chart.Series<itemPie,String>>  pegaSerieFinalPie(series,{String idR}){

    _serieFinalPie.add(
        chart.Series(
            data: series,
            domainFn:  (itemPie item,_)=> item.nomes,
            measureFn: (itemPie item,_)=> item.valores,
            colorFn: (itemPie item,_)=> chart.ColorUtil.fromDartColor(item.cores),
            id:idR??'Fatias',
            labelAccessorFn: (itemPie row,_)=> '${row.valores}'
        )
    );

    return _serieFinalPie;
  }
}


class GraficoPie extends StatelessWidget {
  const GraficoPie({
    Key key,
    @required this.grafico,
    this.appbar=false,
    this.tituloPagina="Dash Board",
    this.tituloGrafico="Titulo do gráfico",
    this.altura,
    this.largura,
    this.animar=true,
    this.duracao=500,
  }) : super(key: key);

  final dadosPie grafico;
  final String tituloPagina;
  final String tituloGrafico;
  final bool appbar;
  final double largura;
  final double altura;
  final bool animar;
  final int duracao;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:appbar==false?null:
      AppBar(title: Text(tituloPagina)),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 5),

        child: Container(
          width:largura==null? MediaQuery.of(context).size.width:largura,
          height:altura==null? MediaQuery.of(context).size.height*.8:altura,
          margin: EdgeInsets.symmetric(vertical: 5),
          child: chart.PieChart(
            grafico.pegaSerieFinalPie(grafico.series),
            animate: animar,
            animationDuration: Duration(milliseconds: duracao),
            behaviors: [
              chart.DatumLegend(
                outsideJustification: chart.OutsideJustification.startDrawArea,
                position: chart.BehaviorPosition.bottom,
                horizontalFirst: false,
                desiredMaxColumns: 1,
                cellPadding: EdgeInsets.only(right: 4,bottom: 4,top: 4),
                entryTextStyle: chart.TextStyleSpec(
                  color: chart.MaterialPalette.teal.shadeDefault,
                  fontFamily: 'Georgia',
                  fontSize: 12,
                ),
              ),
              chart.ChartTitle(tituloGrafico,
                  innerPadding: 30,
                  behaviorPosition: chart.BehaviorPosition.top,
                  titleOutsideJustification:
                  chart.OutsideJustification.middleDrawArea,
                  titleStyleSpec: chart.TextStyleSpec(
                    color: chart.ColorUtil.fromDartColor(Colors.blue),
                    fontSize: 22,
                  )
              ),
            ],
            defaultRenderer: chart.ArcRendererConfig(
                customRendererId: '${DateTime.now().toString()}',
                arcWidth:40,
                arcRendererDecorators: [
                  chart.ArcLabelDecorator(

                  )
                ]
            ),
          ),
        ),
      ),
    );
  }
}
