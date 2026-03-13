import 'package:flutter/material.dart';
import 'package:test01_db_interface/myWidgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = false;

  void _simularCarregamento() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 3)); // Simula uma tarefa
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final imageWidth = screenSize.width;
    final imageHeight = screenSize.height;

    return MaterialApp(
      home: Scaffold(
        // Esta é a tela que vai "puxar" da esquerda
        drawer: SizedBox(
          width: MediaQuery.of(context).size.width * 0.3, // Ocupa 30% da tela
          child: Drawer(
            child: Column(
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(color: Colors.blueAccent),
                  child: Center(child: Text("Configurações", style: TextStyle(color: Colors.white),)),
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
              colors: [Colors.white, Color.fromARGB(255, 128, 128, 128)],
            ),
          ),
          child: Stack(
            children: [
              // ------------------------ LOGO -----------------------------------
              Center(
                child: Image(
                  width: imageWidth * 2,
                  height: imageHeight / 2,
                  image: AssetImage("assets/logo.png"),
                ),
              ),
              Column(
                children: [
                  // ------------------- SEARCHBAR -------------------------------
                  MySearchBar(),

                  SizedBox(
                    // define o tamanho do espaço disponível para o listview
                    height: screenSize.height * ((84) / 100),
                    // ----------------- LIST VIEW -------------------------------
                    child: ListView.builder(
                      itemCount: 6,
                      itemBuilder: (context, index) =>
                          ProvisoryWidget(index: index),
                    ),
                  ),
                ],
              ),
              //----------------------- BOTÃO CANTO ----------------------------
              Positioned(
                bottom: 30,
                right: 30,
                child: SizedBox(
                  height: 80,
                  width: 80,
                  child: ElevatedButton(
                    onPressed: () => _simularCarregamento(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      fixedSize: const Size(80, 80),
                      padding: EdgeInsets.zero,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.zero
                      ),
                    ),
                    child: const Icon(Icons.add, size: 30),
                  ),
                ),
              ),
              if (_isLoading)
                Container(
                  color: Colors.black.withValues(alpha: 0.5), // Escurece a tela
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
