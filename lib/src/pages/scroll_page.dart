import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _pagina1(),
          _pagina2(context)
        ],
      )
    );
  }

  Widget _pagina1(){
    return Stack(
      children: <Widget>[
        _colorFondo(),
        _imagenFondo(),
        _textos()
      ],
    );
  }

  Widget _colorFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0),
    );
  }

  Widget _imagenFondo(){
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/scroll-1.png'),
        fit: BoxFit.cover,
      ),
    ); 
  }

  Widget _textos(){
    final estilo = TextStyle(color: Colors.white, fontSize: 50.0);
    return SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(height: 50.0,),
          Text('18 °C', style: estilo),
          Text('Viernes', style: estilo),
          Expanded(child: Container(),),
          Icon(Icons.keyboard_arrow_down, size: 120.0, color: Colors.white)
        ],
      ),
    );
  }


  Widget _pagina2(BuildContext context){
    return Stack(
      children: <Widget>[
        _colorFondo(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 60.0),
          child: Column(    
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               RaisedButton(
               shape: StadiumBorder(),
               color: Colors.blue,
               onPressed: (){
                 Navigator.pushNamed(context, "basico");
               },
               child: Container(
                 padding: EdgeInsets.all(15.0),
                 child: Text("Diseño Básico", style: TextStyle(fontSize: 20.0, color: Colors.white))
                 )
             ),
             SizedBox(height: 20.0,),
             RaisedButton(
               shape: StadiumBorder(),
               color: Colors.blue,
               onPressed: (){
                 Navigator.pushNamed(context, "gradiente");
               },
               child: Container(
                 padding: EdgeInsets.all(15.0),
                 child: Text("Diseño Menu", style: TextStyle(fontSize: 20.0, color: Colors.white))
                 )
             ),
            ],
            ),
        ),
      ],
    );
  }  
}