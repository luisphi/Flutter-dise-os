import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 
import 'package:disenos/src/pages/scroll_page.dart';
import 'package:disenos/src/pages/gradiente_page.dart';
import 'package:disenos/src/pages/basico_page.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {

    //Codigo para hacer que el texto superior, como la hora o las notificaciones sean blancas
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños',
      initialRoute: 'scroll',

      routes: {
        'basico': (BuildContext context) => BasicoPage(),
        'scroll': (BuildContext context) => ScrollPage(),
        'gradiente': (BuildContext context) => GradientePage(),
      },
    );
  }
}