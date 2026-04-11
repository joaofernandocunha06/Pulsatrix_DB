import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:test01_db_interface/update_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'database.dart';
import 'dart:async';

// --------------------------- Widget Search Bar -------------------------------

class MySearchBar extends StatefulWidget {
  final VoidCallback reload;
  final SearchController searchController;

  // referencia função do pai
  final Function(Future<List<Aluno>>) onPressed;

  const MySearchBar({
    super.key,

    required this.reload,
    required this.onPressed,
    required this.searchController,
  });

  @override
  State<StatefulWidget> createState() => _MySearchBarState();
}
/*
* Isso é uma nota minha, tenho que fazer depois
* Vou definir o method de chamada aqui dentro...
* ou talvez eu posso simplesmente já definir no botão
* quando estiver sendo exibido na minha tela, não vai mais fazer diferença
* vai ser chamado de qualquer jeito
* */

class _MySearchBarState extends State<MySearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color.fromARGB(255, 166, 166, 166)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(9),
            bottomRight: Radius.circular(9),
          ),
        ),
        //------------------------------------
        padding: const EdgeInsets.only(left: 5, right: 5, bottom: 7),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(9),
              bottomLeft: Radius.circular(9),
            ),
          ),
          child: Row(
            children: [
              //----------------- button drawer ----------------
              Padding(
                padding: EdgeInsetsGeometry.only(
                  right: 10,
                  bottom: 20,
                  top: 10,
                  left: 22,
                ),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      // Cor do botão
                      foregroundColor: Colors.white,
                      // Cor do ícone/texto
                      fixedSize: const Size(25, 25),
                      padding: EdgeInsets.zero,
                      // LARGURA e ALTURA iguais para o quadrado
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                    ),
                    child: const Icon(Icons.menu, size: 30),
                  ),
                ),
              ),
              //------------------- SearchBar ------------------
              Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 10),
                child: SearchBar(
                  controller: widget.searchController,
                  trailing: [
                    IconButton(
                      onPressed: () => widget.searchController.clear(),
                      icon: Icon(Icons.cancel),
                    ),
                  ],
                  hintText: "Pesquisar...",
                  backgroundColor: const WidgetStatePropertyAll(
                    Color.fromARGB(255, 222, 222, 222),
                  ),
                  shape: WidgetStatePropertyAll<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                ),
              ),
              //------------------- button ---------------------
              Padding(
                padding: EdgeInsetsGeometry.only(left: 10, bottom: 20, top: 10),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      final db = Provider.of<AppDatabase>(
                        context,
                        listen: false,
                      );
                      widget.reload();
                      widget.onPressed(
                        db.findAlunosBasic(widget.searchController.text),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white,
                      fixedSize: const Size(25, 25),
                      padding: EdgeInsets.zero,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                    ),
                    child: const Icon(Icons.search, size: 30),
                  ),
                ),
              ),
              //------------------- button ---------------------
              Padding(
                padding: EdgeInsetsGeometry.only(left: 10, bottom: 20, top: 10),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      fixedSize: const Size(25, 25),
                      padding: EdgeInsets.zero,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                    ),
                    onPressed: (){
                      widget.onPressed(Future.value([]));
                    },
                    child: const Icon(Icons.close, size: 30),
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

// ----------------------------- Widget Student --------------------------------

class StudentWidget extends StatelessWidget {
  final int id;
  final String name;
  final bool necessidade;
  final String condition;
  final bool demo;
  final String date;
  final int age;
  final bool isStudent;
  final bool access;

  final String? search;
  final Function(Future<List<Aluno>>) onPressed;
  final Function(int, String) deleting;

  const StudentWidget({
    super.key,
    required this.id,
    required this.name,
    required this.necessidade,
    required this.condition,
    required this.demo,
    required this.date,
    required this.age,
    required this.isStudent,
    required this.access,

    required this.search,
    required this.onPressed,
    required this.deleting
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(top: 5, bottom: 5, left: 60, right: 80),
      child: SizedBox(
        height: 155,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(100),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
            color: Colors.white,
            border: Border.all(
              color: isStudent ? Colors.purple : Colors.white70,
              width: 8,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.all(4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 7, right: 6),
                        child: Text(
                          "NOME: $name ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 2, right: 6),
                        child: Text(
                          "DATA: $date ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 2, right: 6),
                        child: Text(
                          "IDADE: $age ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 7, right: 6),
                        child: Text(
                          "MATRICULA: " + (isStudent ? "SIM" : "NADA"),
                          style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 2, right: 6),
                        child: Text(
                          " NECESSIDADE: " + (necessidade ? "$condition" : "NÃO"),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 2, right: 6),
                        child: Text(
                          " DEMONSTRATIVA: " + (demo ? "SIM" : "NADA"),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (access)
                        // ----------------------- ACESSAR -----------------------
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.green, width: 3),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UpdatePage(selfID: id),
                                ),
                              );
                            },
                            child: Text(
                              "ACESSAR",
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        ),
                      if (access)
                        // ----------------------- DELETAR -----------------------
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.red, width: 3),
                            ),
                            onPressed: () {
                              deleting(id, search!);
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//------------------------------ Widget Drawer ---------------------------------

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.purple, Colors.deepPurple]),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "M E N U",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: RelogioWidget(size: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
          MyListTile(
            icon: Icon(Icons.last_page, color: Colors.white,),
            name: "CADASTRAR ALUNO",
            navigator: "createpage",
          ),
          MyListTile(
            icon: Icon(Icons.celebration, color: Colors.white,),
            name: "ANIVERSARIANTES",
            navigator: "birthpage",
          ),
        ],
      ),
    );
  }
}

//------------------------------ Widget Text Field -----------------------------

class MyTextField extends StatefulWidget {
  final int? capacity;
  final String name;
  final TextEditingController controler;
  final MaskTextInputFormatter? mask;

  const MyTextField({
    super.key,
    required this.capacity,
    required this.name,
    required this.controler,
    required this.mask,
  });

  @override
  State<StatefulWidget> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    final screeSize = MediaQuery.of(context).size;

    return Padding(
      padding: widget.capacity != null
          ? EdgeInsets.only(left: 2, right: 12)
          : EdgeInsets.only(left: 2, right: 12, bottom: 20),
      child: SizedBox(
        width: widget.capacity != null
            ? screeSize.width * (widget.capacity! * 0.9) / 100
            : 100,
        child: TextField(
          maxLength: widget.capacity, // Define o limite máximo
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple, width: 3.0),
            ),
            labelStyle: TextStyle(color: Colors.black),
            labelText: widget.name,
            border: OutlineInputBorder(),
          ),
          inputFormatters: widget.mask != null ? [widget.mask!] : [],
          controller: widget.controler,
        ),
      ),
    );
  }
}

var cpfFormatter = MaskTextInputFormatter(
  mask: '###.###.###-##',
  filter: {"#": RegExp(r'[0-9]')},
  type: MaskAutoCompletionType.lazy,
);

var rgFormatter = MaskTextInputFormatter(
  mask: '##.###.###-@',
  filter: {"#": RegExp(r'[0-9]'), "@": RegExp(r'[0-9X]')},
  type: MaskAutoCompletionType.lazy,
);

var phoneFormatter = MaskTextInputFormatter(
  mask: '##-#########',
  filter: {"#": RegExp(r'[0-9]')},
  type: MaskAutoCompletionType.lazy,
);

var dateFormatter = MaskTextInputFormatter(
  mask: '##/##/####',
  filter: {"#": RegExp(r'[0-9]')},
  type: MaskAutoCompletionType.lazy,
);

//------------------------------ Widget List Tile ------------------------------

class MyListTile extends StatelessWidget {
  final Icon icon;
  final String name;
  final String navigator;

  const MyListTile({
    super.key,
    required this.icon,
    required this.name,
    required this.navigator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff732696), Color(0xffe57ff5)],
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: ListTile(
          leading: icon,
          title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
          onTap: () {
            Navigator.pushNamed(context, '/$navigator');
          },
        ),
      ),
    );
  }
}

// ------------------------------ Widget Clock ---------------------------------

class RelogioWidget extends StatefulWidget {
  final double size;

  const RelogioWidget({super.key, required this.size});

  @override
  RelogioWidgetState createState() => RelogioWidgetState();
}

class RelogioWidgetState extends State<RelogioWidget> {
  Timer? _timer;
  String _timeString = "";

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Atualiza a cada 1 segundo
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = DateFormat(
      'dd/MM/yyyy HH:mm:ss',
    ).format(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _timeString,
      style: TextStyle(
        color: Colors.white,
        fontSize: widget.size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
