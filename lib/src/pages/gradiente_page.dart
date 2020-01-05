import 'package:flutter/material.dart';

import 'dart:math';
import 'dart:ui';

class GradientePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondoApp(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _titulos(),
                _menuBotones()
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: _bottonNavigationBar(context)
    );
  }

  Widget _fondoApp(){
    final _gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.6),
          end: FractionalOffset(0.0, 1.0),
          colors: [
            Color.fromRGBO(52, 54, 101, 1.0), 
            Color.fromRGBO(35, 37, 57, 1.0)
            ]
        )
      ),
    );

    final _cajaRosa = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        width: 360.0,
        height: 360.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80.0),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(236, 98, 188, 1.0),
              Color.fromRGBO(241, 142, 172, 1.0),
            ]
          )
        ),
      ),
    );  
    
    return Stack(
      children: <Widget>[
        _gradiente,
        //SIRVE PARA UBICAR UN ELEMENTO SABIENDO LA POSICION DETERMINADA
        Positioned(
          top: -100.0,
          child: _cajaRosa,
        )
        
      ],
    );
  }

  Widget _titulos(){
    return Container(
      padding: EdgeInsets.all(15.0),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Título Principal", style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 10.0,),
            Text("Este es el subtitulo o para tener mas información de la aplicación",
                style: TextStyle(color: Colors.white, fontSize: 18.0))
          ],
        ),
      ),
    );
  }

//SE CREA TODA LA ESTRUCTURA DE LOS BOTONES PARA CAMBIAR EL TEMA
  Widget _bottonNavigationBar(BuildContext context){

    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
        primaryColor: Colors.pinkAccent,
        textTheme: Theme.of(context).textTheme.copyWith(
          caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0))
        )
      ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_view_day),
            title: Text("Calendario")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.graphic_eq),
            title: Text("Estadísticas")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stay_current_portrait),
            title: Text("Configuración")
          ),
        ],
      ),
    );
  }


  Widget _menuBotones(){
    return Table(
      children: [
        TableRow(
          children: [
            _crearMenu(Colors.blue, Icons.border_all, 'General'),
            _crearMenu(Colors.purpleAccent, Icons.directions_bus, 'Bus'),
          ]
        ),
        TableRow(
          children: [
            _crearMenu(Colors.blueGrey, Icons.dns, 'Direcciones'),
            _crearMenu(Colors.blue, Icons.filter_list, 'Filtros'),
          ]
        ),
        TableRow(
          children: [
            _crearMenu(Colors.red, Icons.phone_android, 'Llamadas'),
            _crearMenu(Colors.pinkAccent, Icons.settings_brightness, 'Seetings'),
          ]
        ),
        TableRow(
          children: [
            _crearMenu(Colors.cyan, Icons.youtube_searched_for, 'Youtube'),
            _crearMenu(Colors.blue, Icons.wifi, 'Wifi'),
          ]
        ),
      ]
    );
  }

  Widget _crearMenu(Color color, IconData icon, String label){
    //Para agregar Blur, esto hacer lenta la app
    //BackdropFilter( filter: ImageFilter.blur(sigmaX: 0.1, sigmaY: 0.3),
    return Container(
        height: 180.0,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Color.fromRGBO(62, 66, 107, 0.7),
          borderRadius: BorderRadius.circular(15.0)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(height: 5.0,),
            CircleAvatar(
              backgroundColor: color,
              radius: 35.0,
              child: Icon(icon, color: Colors.white, size: 30.0,),
            ), 
            Text(label, style: TextStyle(color: color, fontSize: 16.0),),
            SizedBox(height: 5.0,),
          ],
        ),
      );
  }
}