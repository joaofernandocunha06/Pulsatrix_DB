import 'package:flutter/material.dart';
import 'package:test01_db_interface/myWidgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = false;
  List<(String, int, bool)> students = [
    ("Arcélius Foreguiden Stormz", 20, true),
    ("Chronos abysslute", 32, true),
    ("Vércalébre", 11, false),
    ("Zamazenta de Véritraz Sergate", 51, true),
    ("Lúmela Novaluma", 23, false),
    ("Tyrant", 15, true)
  ];

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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

    return Container(
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
          // -------------------------- LOGO -----------------------------------
          Center(
            child: Image(
              width: imageWidth * 2,
              height: imageHeight / 2,
              image: AssetImage("assets/logo.png"),
            ),
          ),
          Column(
            children: [
              // --------------------- SEARCHBAR -------------------------------
              MySearchBar(reload: _simularCarregamento),
              SizedBox(
                // define o tamanho do espaço disponível para o listview
                height: screenSize.height * ((84) / 100),
                child: RawScrollbar(
                  controller: _scrollController,
                  thumbColor: Colors.indigo,
                  thumbVisibility: true,
                  trackVisibility: true,
                  thickness: 20,
                  radius: const Radius.circular(5),
                  // ----------------- LIST VIEW -------------------------------
                  child: ListView.builder(
                    controller: _scrollController,
                    primary: false,
                    itemCount: students.length,
                    itemBuilder: (context, index) =>
                        ProvisoryWidget(name: students[index].$1, age: students[index].$2, isStudent:  students[index].$3),
                  ),
                ),
              ),
            ],
          ),
          // como o código sabe lidar com isso? quer dizer, é literalmente
          // um IF, não um widget, mas se cair dentro do IF, ele
          // interpreta como um? Como exatamente? Tem alguma coisa haver
          // com o Container, ele é o único widget ali
          if (_isLoading)
            Container(
              color: Colors.black.withValues(alpha: 0.5), // Escurece a tela
              child: const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
