import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {

  final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubTitulo = TextStyle(fontSize: 18.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _imagen(),
            _titulo(),
            _rowButtons(),
            _texto(),
            _texto(),
            _texto()
          ],
        ),
      )
      );
  }

Widget _imagen(){
  return Container(
    width: double.infinity,
    child: Image(
      image: NetworkImage('https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
      fit: BoxFit.cover,
      height: 250.0,
    ),
  );
}
//Información del titulo
  Widget _titulo(){
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Lago de Alemania', style: estiloTitulo),
                  SizedBox(height: 7.0,),
                  Text('Este lago es maravilla', style: estiloSubTitulo)
                ],
              ),
            ),
            Icon(Icons.star, color: Colors.red, size: 30.0,),
            Text('41', style: TextStyle(fontSize: 20.0),)
          ],
        ),
      ),
    );
  }

//Retorna la columna de Botones
  Widget _rowButtons(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _button(Colors.blue, Icons.phone, "CALL"),
        _button(Colors.red, Icons.near_me, "DIRECTION"),
        _button(Colors.blue, Icons.share, "SHARE"),
      ]  
    );
  }

//Crear el botón individual, dado que se repiten
  Widget _button(Color color, IconData icon, String label){
    return GestureDetector(
      onTap: (){},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, color: color, size: 40.0,),
          SizedBox(height: 4.0,),
          Text(label, style: TextStyle(color: color, fontSize: 15.0))
        ],
      ),
    );
  }

//Crear el último apartado con el texto
  Widget _texto(){
    return Container(
      padding: EdgeInsets.all(32),
      child: Text(
          'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
          'Alps. Situated 1,578 meters above sea level, it is one of the '
          'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
          'half-hour walk through pastures and pine forest, leads you to the '
          'lake, which warms to 20 degrees Celsius in the summer. Activities '
          'enjoyed here include rowing, and riding the summer toboggan run.',
          textAlign: TextAlign.justify,
      ),
    );
  }
}