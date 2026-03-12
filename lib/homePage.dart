import 'package:flutter/material.dart';
import 'package:test01_db_interface/myWidgets.dart';

class MyHomePage extends StatelessWidget{
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final imageWidth = screenSize.width;
    final imageHeight = screenSize.height;

    return MaterialApp(
      home: Scaffold(
        drawer: Scaffold(
          // Esta é a tela que vai "puxar" da esquerda
          drawer: SizedBox(
            width: MediaQuery.of(context).size.width * 0.3, // Ocupa 30% da tela
            child: Drawer(
              child: Column(
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(color: Colors.blueGrey),
                    child: Center(child: Text("Configurações")),
                  ),
                  ListTile(
                    leading: const Icon(Icons.dark_mode),
                    title: const Text("Tema Escuro"),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
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
              // ------------------------ LOGO -----------------------------------
              Center(
                  child: Image(
                    width: imageWidth * 2,
                    height: imageHeight / 2,
                    image: AssetImage("assets/logo.png"),
                  )
              ),
              Column(
                children: [
                  // ------------------- SEARCHBAR -------------------------------
                  MySearchBar(),

                  SizedBox( // define o tamanho do espaço disponível para o listview
                    height: screenSize.height * ((84)/100),
                    // ----------------- LIST VIEW -------------------------------
                    child: ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) => ProvisoryWidget(index: index),
                    ),
                  ),
                ],
              ),
              Positioned(
                  bottom: 30,
                  right: 30,
                  child: SizedBox(
                      height: 80,
                      width: 80,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,      // Cor do botão
                          foregroundColor: Colors.white,     // Cor do ícone/texto
                          fixedSize: const Size(80, 80),
                          padding: EdgeInsets.zero,// LARGURA e ALTURA iguais para o quadrado
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero, // Remove os cantos arredondados
                          ),
                        ),
                        child: const Icon(Icons.add, size: 30),
                      )
                  )
                ),
              ],
            ),
          )
        ),
      )
    );
  }
}