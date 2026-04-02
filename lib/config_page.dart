import 'package:test01_db_interface/my_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'database.dart';

class ConfigPage extends StatefulWidget{
  const ConfigPage({super.key});
  
  @override
  State<StatefulWidget> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage>{
  
  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text("P Á G I N A  D E  C O N F I G U R A Ç Ã O", style: TextStyle(color: Colors.white),),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                color: Colors.indigo,
                height: screenSize.height * 0.25,
                width: screenSize.width * 0.85,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                color: Colors.indigo,
                height: screenSize.height * 0.4,
                width: screenSize.width * 0.85,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                color: Colors.indigo,
                height: screenSize.height * 0.15,
                width: screenSize.width * 0.85,
              ),
            ),
          )
        ],
      ),
    );
  }  
}