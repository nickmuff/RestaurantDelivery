

import 'package:aula1/banco/usuarioDAO.dart';
import 'package:aula1/restaurante.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'banco/restauranteDAO.dart';

class telaHome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => telaHomeState();
}

class telaHomeState extends State<telaHome>{
  final nome = UsuarioDAO.usuarioLogado.nome;

  List<Restaurante> restaurantes = [];

  Future<void> carregarRestaurantes() async{
    final lista = await RestauranteDAO.listarTodos();
    setState(() {
      restaurantes = lista;
    });
  }

  @override
  void initState(){
    super.initState();
    carregarRestaurantes();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Olá, $nome!'),
        actions: [
          Icon(Icons.construction_rounded)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 50,
          child: ListView.builder(
            itemCount: restaurantes.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (Context, index){
              final r = restaurantes[index];
              return ElevatedButton(
               onPressed: (){},
              child: Text(r.nome ?? 'Sem nome')                ],
              );
            }
        ),
      ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.shopping_basket_sharp), label: 'carrinho'),
        BottomNavigationBarItem(icon: Icon(Icons.savings_rounded), label: 'descontos'),
        BottomNavigationBarItem(icon: Icon(Icons.delivery_dining), label: 'meus pedidos'),
      ]),
    );
  }
}

class ImagensSlides  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        for (final color in Colors.primaries)
          Container(width: 160, color: color),
      ],
    );
  }

}