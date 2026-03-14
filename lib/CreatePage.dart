import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget{
  const CreatePage ({super.key});

  @override
  State<StatefulWidget> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  @override
  Widget build(BuildContext context) {

  final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text("C R E A T E  P A G E", style: TextStyle(color: Colors.white),)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40, bottom: 40),
              child: Container(
                width: screenSize.width * 0.9,
                height: screenSize.height * 0.1,
                color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("TEST")],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}