import 'package:test01_db_interface/my_widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'database.dart';

class BirthdayPage extends StatefulWidget {
  BirthdayPage({super.key});

  @override
  State<StatefulWidget> createState() => _birthdayPageState();
}

class _birthdayPageState extends State<BirthdayPage> {
  final ScrollController _scrollController = ScrollController();
  Future<List<Aluno>>? _futureAlunos = Future.value([]);

  @override
  void initState() {
    super.initState();
    final db = Provider.of<AppDatabase>(context, listen: false);
    String dataAtual = DateFormat('dd/MM').format(DateTime.now());
    _futureAlunos = db.findBirthday(dataAtual);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Center(child: Text("A N I V E R S A R I A N T E S", style: TextStyle(color: Colors.white),)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
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
                  final listaAlunos = snapshot.data!; //confirma que não é nulo

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
                          border: Border.all(width: 5, color: Colors.purple),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
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
                    child: Padding(padding: EdgeInsetsGeometry.only(top: 20, bottom: 20),
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
                              access: false,

                              search: null,

                              //possivelmente remover
                              deleting: (idRecebido, searchRecebido) {
                                setState(() {});
                              },

                              onPressed: (novosAlunos) {
                                setState(() {
                                  _futureAlunos = novosAlunos;
                                });
                              },
                            );
                          },
                        )
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
    );
  }
}
