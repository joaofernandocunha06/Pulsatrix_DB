import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget{
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final imageWidth = screenSize.width;
    final imageHeight = screenSize.height;

    return MaterialApp(
      home: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Color.fromARGB(255, 128, 128, 128)
                ]
            ),
          ),
          child:
          Stack(children: [
            Center(
              child: Image(
                width: imageWidth * 2,
                height: imageHeight / 2,
                image: AssetImage("assets/logo.png"),
              )
            ),
            Column(
              children: [
                MySearchBar(),
                //SizedBox(height: 30, child: Container(color: Colors.blue,))
                ],
              ),
            ],
          ),
        )
      )
    );
  }
}

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsetsGeometry.only(bottom: 10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child:
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Color.fromARGB(255, 166, 166, 166),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(9),
                  bottomRight: Radius.circular(9),
                ),
              ),
              padding: EdgeInsets.only(left: 5, right: 5, bottom: 7),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(9),
                    bottomLeft: Radius.circular(9),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 80, right: 80, bottom: 20, top: 10),
                  child: SearchBar(
                    hintText: "Pesquisar...",
                    backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 222, 222, 222)),
                    shape: WidgetStatePropertyAll<OutlinedBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9)
                        )
                    ),
                  ),
                ),
              ),
            )
            )
          ]
      ),
    );
  }
}