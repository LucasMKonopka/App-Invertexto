import 'package:flutter/material.dart';
import 'package:app_invertexto/service/invertexto_service.dart';

class ConverterMoedas extends StatefulWidget {
  const ConverterMoedas({super.key});

  @override
  State<ConverterMoedas> createState() => _ConverterMoedasState();
}

class _ConverterMoedasState extends State<ConverterMoedas> {
  String? campo;

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
            TextField(
              decoration: InputDecoration(
                labelText: "Digite o código da moeda",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
              style: TextStyle(color: Colors.white, fontSize: 18),
              onSubmitted: (value) {
                setState(() {
                  campo = value;
                });
              },
            ),
            Expanded(
              child: FutureBuilder(
                future: conversorDeMoedas(campo),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      return Container(
                          width: 200.0,
                          height: 200.0,
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                            strokeWidth: 5.0,
                          ));
                    default:
                      if (snapshot.hasError) {
                        return Container();
                      } else {
                        return exibeResultado(context, snapshot);
                      }

                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget exibeResultado(BuildContext context, AsyncSnapshot snapshot) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: TextField(
        readOnly: true,
        decoration: InputDecoration(
        labelText: snapshot.data['USD_BRL']['price'].toString(),
        labelStyle: TextStyle(color: Colors.white, fontSize: 22.0),
        border: OutlineInputBorder(),
        ),
      ),
    );


  }
}
