import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget{
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {

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
                  Color.fromARGB(255, 153, 153, 153)
                ]
            )
          ),
          child: Column(
            children: [MySearchBar()],
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child:
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(11), bottomRight: Radius.circular(11)),
              border: Border(
                left: BorderSide(width: 5, color: Colors.white),
                right: BorderSide(width: 5, color: Colors.white),
                bottom: BorderSide(width: 5, color: Colors.white)
              )
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 80, top: 10, right: 80, bottom: 20),
              child: SearchBar(
                hintStyle: WidgetStateProperty.all(
                    TextStyle(
                      fontFamily: "Oswald_font",
                      fontSize: 20
                    )
                ),
                hintText: "Pesquisar...",
                backgroundColor: WidgetStatePropertyAll<Color>(Colors.white),
              )
            ),
          )
        ),
      ]
    );
  }
}