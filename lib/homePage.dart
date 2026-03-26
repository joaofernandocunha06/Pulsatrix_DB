import 'package:flutter/material.dart';
import 'package:test01_db_interface/myWidgets.dart';
import 'package:provider/provider.dart';
import 'database.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = false;
  bool _login = true;

  final ScrollController _scrollController = ScrollController();

  void _simularCarregamento() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 3)); // Simula uma tarefa
    setState(() => _isLoading = false);
  }

  Future<List<Aluno>>? _futureAlunos = Future.value([]);

  @override
  void initState() {
    super.initState();
    _futureAlunos = Future.value([]);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

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
              width: screenSize.width * 2,
              height: screenSize.height / 2,
              image: AssetImage("assets/logo.png"),
            ),
          ),
          Column(
            children: [
              // --------------------- SEARCHBAR -------------------------------
              MySearchBar(
                reload: _simularCarregamento,
                onPressed: (novoFuture) {
                  setState(() {
                    _futureAlunos = novoFuture;
                  });
                },
              ),
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
                  child: FutureBuilder<List<Aluno>>(
                    future: _futureAlunos, // essa é a lista que eu vou usar
                    builder: (context, snapshot) {
                      /*
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      */

                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            'Erro: ${snapshot.error}',
                            style: TextStyle(fontSize: 30),
                          ),
                        );
                      }

                      if (snapshot.hasData && snapshot.data != null) {
                        final listaAlunos =
                            snapshot.data!; //confirma que não é nulo

                        if (listaAlunos.isEmpty) {
                          return Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withAlpha(130),
                                      spreadRadius: 5,
                                      blurRadius: 10,
                                      offset: const Offset(0, 5),
                                    )
                                  ],
                                color: Colors.white,
                                border: Border.all(width: 5, color: Colors.indigo),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              child: Padding(padding: EdgeInsets.all(8), child: Text(
                                'NENHUM ALUNO ENCONTRADO',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.bold
                                ),
                              ),),
                            ),
                          );
                        }

                        return ListView.builder(
                          controller: _scrollController,
                          primary: false,
                          itemCount: listaAlunos.length,
                          // Agora o .length funciona!
                          itemBuilder: (context, index) {
                            final aluno = listaAlunos[index];
                            return StudentWidget(
                              id: aluno.id,
                              name: aluno.nome,
                              age: aluno.idade,
                              isStudent: aluno.matricula,
                            );
                          },
                        );
                      }

                      // Caso padrão (estado inicial ou vazio)
                      return const Center(child: Text('Inicie uma pesquisa.'));
                    },
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
          if (_login)
            Container(
              color: Colors.black54,
              child: Center(
                child: Container(
                  width: 400,
                  height: 220,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.all(5),
                          child: Text(
                            "L O G I N",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "LOGIN",
                              filled: true,
                              fillColor: Colors.grey[200],
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: Colors.indigo,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "SENHA",
                              filled: true,
                              fillColor: Colors.grey[200],
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: Colors.indigo,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.indigo, width: 2),
                            ),
                            onPressed: () => setState(() {_login = false;}),
                            child: Text(
                              "ENTRAR",
                              style: TextStyle(color: Colors.indigo),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
