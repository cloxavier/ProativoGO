import 'package:flutter/material.dart';

class telaInicial extends StatefulWidget {
  @override
  _telaInicialState createState() => _telaInicialState();
}

class _telaInicialState extends State<telaInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Logado! (Em Desenvolvimento!)"),
        ),
        body: Container(child:
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Você conseguiu Logar com suceso!\nEm desenvolvimento!"),
                Icon(Icons.build,size: 35,)],
            ),
          ),));
  }
}
