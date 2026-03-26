import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'database.dart';
import 'package:provider/provider.dart';
import 'database.dart';
import 'package:intl/intl.dart';
import 'dart:async';

// --------------------------- Widget Search Bar -------------------------------

class MySearchBar extends StatefulWidget {
  final VoidCallback reload;

  // referencia função do pai
  final Function(Future<List<Aluno>>) onPressed;

  const MySearchBar({super.key, required this.reload, required this.onPressed});

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
  final SearchController _searchController = SearchController();

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
                      backgroundColor: Colors.indigo,
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
                  controller: _searchController,
                  trailing: [
                    IconButton(
                      onPressed: () => _searchController.clear(),
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
                      widget.onPressed(db.findAlunos(_searchController.text));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
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
                    onPressed: widget.reload,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
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
                    child: const Icon(Icons.refresh, size: 30),
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
  final int age;
  final bool isStudent;

  const StudentWidget({
    super.key,
    required this.id,
    required this.name,
    required this.age,
    required this.isStudent,
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
              color: isStudent ? Colors.orange : Colors.grey,
              width: 8,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsGeometry.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "nome: $name",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
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
                    Text(
                      "Idade: $age anos",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.green, width: 3),
                        ),
                        onPressed: () {},
                        child: Text(
                          "ACESSAR",
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.red, width: 3),
                        ),
                        onPressed: () {},
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
              gradient: LinearGradient(colors: [Colors.blue, Colors.indigo]),
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
            icon: Icon(Icons.last_page),
            name: "CADASTRAR ALUNO",
            navigator: "createpage",
          ),
          MyListTile(
            icon: Icon(Icons.settings),
            name: "CONFIGURAÇÕES",
            navigator: "configpage",
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
            ? screeSize.width * (widget.capacity! * 1.1) / 100
            : 100,
        child: TextField(
          maxLength: widget.capacity, // Define o limite máximo
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange, width: 3.0),
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
      padding: EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.yellowAccent],
          ),
          borderRadius: BorderRadius.all(Radius.circular(5)),
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
  String _timeString = "";

  @override
  void initState() {
    super.initState();
    // Atualiza a cada 1 segundo
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
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
