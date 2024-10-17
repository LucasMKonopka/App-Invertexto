import 'package:app_invertexto/service/invertexto_service.dart';
import 'package:app_invertexto/view/busca_cep_page.dart';
import 'package:app_invertexto/view/por_extenso_page.dart';
import 'package:app_invertexto/view/converter_moeda.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/imgs/invertexto.png',
                fit: BoxFit.contain, height: 40),
          ],
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Icon(Icons.edit, color: Colors.white, size: 70),
                  Text(
                    "Por Extenso",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  )
                ],
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PorExtensoPage()));
              },
            ),
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Icon(Icons.home, color: Colors.white, size: 70),
                  SizedBox(width: 20),
                  Text(
                    "Busca CEP",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  )
                ],
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BuscaCepPage()));
              },
            ),
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Icon(Icons.currency_bitcoin, color: Colors.white, size: 60),
                  SizedBox(width: 20),
                  Text(
                    "Converter Moeda",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ConverterMoedas()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
