import 'package:flutter/material.dart';
import 'package:test01_db_interface/my_widgets.dart';
import 'package:provider/provider.dart';
import 'database.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = false;
  bool _confirmDelete = false;
  int? _hold_id;
  String? _hold_search;

  final ScrollController _scrollController = ScrollController();
  final SearchController searchControllerHome = SearchController();

  void _simularCarregamento() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2)); // Simula uma tarefa
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
          // Color.fromARGB(255, 128, 128, 128)
          colors: [Colors.white, Color.fromARGB(255, 128, 128, 128)],
        ),
      ),
      child: Stack(
        children: [
          // -------------------------- LOGO -----------------------------------
          /*Center(
            child: Image(
              width: screenSize.width * 2,
              height: screenSize.height / 2,
              image: AssetImage("assets/logo.png"),
            ),
          ),*/
          Column(
            children: [
              // --------------------- SEARCHBAR -------------------------------
              MySearchBar(
                reload: _simularCarregamento,
                searchController: searchControllerHome,
                onPressed: (novoFuture) {
                  setState(() {
                    _futureAlunos = novoFuture;
                  });
                },
              ),
              SizedBox(
                // define o tamanho do espaço disponível para o listview
                height: screenSize.height * ((84) / 100),
                // ----------------- LIST VIEW -------------------------------
                child: FutureBuilder<List<Aluno>>(
                  future: _futureAlunos, // essa é a lista que eu vou usar
                  builder: (context, snapshot) {

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
                                ),
                              ],
                              color: Colors.white,
                              border: Border.all(
                                width: 5,
                                color: Colors.purple,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                'NENHUM ALUNO ENCONTRADO',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.purple,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      }

                      return RawScrollbar(
                        controller: _scrollController,
                        thumbColor: Color(0xffcf5eff),
                        thumbVisibility: true,
                        trackVisibility: true,
                        thickness: 20,
                        radius: const Radius.circular(5),
                        child: ListView.builder(
                          controller: _scrollController,
                          itemCount: listaAlunos.length,
                          itemBuilder: (context, index) {
                            final aluno = listaAlunos[index];
                            return StudentWidget(
                              id: aluno.id,
                              name: aluno.nome,
                              necessidade: aluno.necessidade,
                              condition: aluno.condition,
                              demo: aluno.demo,
                              date: aluno.data,
                              age: aluno.idade,
                              isStudent: aluno.matricula,
                              access: true,

                              search: searchControllerHome.text,

                              deleting: (idRecebido, searchRecebido){
                                  setState(() {
                                    _hold_id = idRecebido;
                                    _hold_search = searchRecebido;
                                    _confirmDelete = true;
                                  });
                              },

                              onPressed: (novosAlunos) {
                                setState(() {
                                  _futureAlunos = novosAlunos;
                                });
                              },
                            );
                          },
                        ),
                      );
                    }

                    // Caso padrão (estado inicial ou vazio)
                    return const Center(child: Text('Inicie uma pesquisa.'));
                  },
                ),
              ),
            ],
          ),
          // como o código sabe lidar com isso? quer dizer, é literalmente
          // um IF, não um widget, mas se cair dentro do IF, ele
          // interpreta como um? Como exatamente? Tem alguma coisa haver
          // com o Container, ele é o único widget ali
          if (_confirmDelete)
            Container(
              color: Colors.black.withValues(alpha: 0.5), // Escurece a tela
              child: const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            ),
          if (_confirmDelete)
            Container(
              color: Colors.black54,
              child: Center(
                child: Container(
                  width: 400,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.only(bottom: 10), child: Text(
                          "Tem certeza que deseja remover o aluno?",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                        Padding(
                          padding: const EdgeInsets.only(top: 7, bottom: 2),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.green, width: 3),
                            ),
                            onPressed: () {
                              setState(() {
                                _hold_id = null;
                                _hold_search = null;
                                _simularCarregamento();
                                _confirmDelete = false;
                              });
                            },
                            child: Text(
                              "NÃO REMOVER",
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 7, bottom: 2),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.red, width: 3),
                            ),
                            onPressed: () {
                              final db = Provider.of<AppDatabase>(
                                context,
                                listen: false,
                              );
                              db.deleteAlunos(_hold_id!);
                              _futureAlunos = db.findAlunosBasic(_hold_search!);
                              _simularCarregamento();
                              _hold_id = null;
                              _hold_search = null;
                              _confirmDelete = false;
                            },
                            child: Text(
                              "REMOVER",
                              style: TextStyle(color: Colors.red),
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
