import 'package:test01_db_interface/homePage.dart';
import 'package:test01_db_interface/CreatePage.dart';
import 'package:test01_db_interface/myWidgets.dart';
import 'package:flutter/material.dart';
import 'database.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  //final database = AppDatabase();

  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // Esta é a tela que vai "puxar" da esquerda
        drawer: SizedBox(
          width: MediaQuery.of(context).size.width * 0.3, // Ocupa 30% da tela
          child: MyDrawer(),
        ),
        body: MyHomePage(),
      ),
      routes: {
        '/createpage':(context) => CreatePage(),
      },
    );
  }
}