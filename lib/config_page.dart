import 'dart:convert';

import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart'; // vou usar depois
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:test01_db_interface/my_widgets.dart';
import 'database.dart';
import 'dart:convert';
import 'dart:io';

Future<Directory> storage = getApplicationSupportDirectory();

Future<String> fazerBackup() async {
  final pastaSuporte = await getApplicationSupportDirectory();
  final caminhoCompleto = p.join(pastaSuporte.path, 'alunos_database.sqlite');
  final File arquivoDoBanco = File(caminhoCompleto);
  String? pastaSelecionada = await FilePicker.getDirectoryPath();

  if (pastaSelecionada != null) {

    String novoCaminho = '$pastaSelecionada/alunos_database_backup.sqlite';
    File copia = await arquivoDoBanco.copy(novoCaminho);

    return 'backup feito | caminho do arquivo: ${copia.path}';
  } else {
    return 'O usuário cancelou a seleção';
  }
}

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<StatefulWidget> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {

  String fazerBackupMessage = "Nenhum backup feito";
  String restaurarBackupMessage = "";
  String saveOptionsMessage = "";
  final TextEditingController _controllerOptions = TextEditingController();

  @override
  void initState() {
    super.initState();
    retrieveConfig();
  }

  void fazerBackupMethod() async {
    final backup = await fazerBackup();
    setState(() {
      fazerBackupMessage = backup;
    });
  }

  void restaurarBackupMethod() async {
    final db = AppDatabase();
    final backup = await db.importarBackup();
    setState(() {
      restaurarBackupMessage = backup;
    });
  }

  Future<void> retrieveConfig() async {
    final directory = await getApplicationSupportDirectory();
    final file = File('${directory.path}/app_config.json');

    if (await file.exists()){
      final rawInfo = await file.readAsString();
      final decodedInfo = jsonDecode(rawInfo);
      final String stringResult = decodedInfo["options"].join(',');
      setState(() {
        _controllerOptions.text = stringResult;
      });
    }
    else {
      setState(() {
        _controllerOptions.text = "";
      });
    }
  }

  void saveConfig(Map<String, dynamic> content) async {
    final directory = await getApplicationSupportDirectory();
    final file = File('${directory.path}/app_config.json');
    String jsonString = jsonEncode(content);
    file.writeAsString(jsonString);
  }

  void saveConfigButton() async {
    final controllerText = _controllerOptions.text;
    final List<String> controllerResultList = controllerText.trim().split(',');
    final Map<String, dynamic> dados = {
      "options": controllerResultList
    };
    saveConfig(dados);
    setState(() {
      saveOptionsMessage = "Livros salvos";
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Center(
          child: Text(
            "P Á G I N A  D E  C O N F I G U R A Ç Ã O",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 50, bottom: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 5, color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(100),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    height: screenSize.height * 0.25,
                    width: screenSize.width * 0.85,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(20),
                            // -------------------------------------------------
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.deepPurpleAccent,
                                  side: BorderSide(
                                    color: Colors.deepPurple,
                                    width: 3,
                                  ),
                                ),
                                onPressed: () => fazerBackupMethod(),
                                child: Text(
                                  "FAZER BACKUP",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            // -------------------------------------------------
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: 20.0,
                                  top: 10,
                                  bottom: 10,
                                ),
                                child: Text(
                                  fazerBackupMessage,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.deepPurpleAccent,
                                  side: BorderSide(
                                    color: Colors.deepPurple,
                                    width: 3,
                                  ),
                                ),
                                onPressed: () => restaurarBackupMethod(),
                                child: Text(
                                  "RESTAURAR BACKUP",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: 20.0,
                                  top: 10,
                                  bottom: 10,
                                ),
                                child: Text(
                                  restaurarBackupMessage,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 5, color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(100),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    height: screenSize.height * 0.4,
                    width: screenSize.width * 0.85,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
// ---------------------------------------------------------------------------------
                            Padding(padding: EdgeInsetsGeometry.all(20), child: SizedBox(
                              width: 500,
                              child: TextField(
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.purple, width: 3.0),
                                  ),
                                  border: OutlineInputBorder(),
                                ),
                                controller: _controllerOptions,
                              )
                            )),

                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.deepPurpleAccent,
                                side: BorderSide(
                                  color: Colors.deepPurple,
                                  width: 3,
                                ),
                              ),
                              onPressed: () => saveConfigButton(),
                              child: Text(
                                "SALVAR",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Text(saveOptionsMessage)
// ---------------------------------------------------------------------------------
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(100),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Padding(padding: EdgeInsetsGeometry.all(5), child: Text("VERSÃO: 1 . 0 . 3", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),),
            ),
          ),
        ],
      ),
    );
  }
}

/*
pegar referência -  (_getConfigFile())
- final directory = await getApplicationSupportDirectory()
- return File('${directory.path}/config.json');

ler dados
- final file = await _getConfigFile();
- String conteudo = await file.readAsString();
- return jsonDecode(conteudo) as Map<String, dynamic>;

reescrever
- await file.writeAsString(jsonEncode(dados));
*/



// getApplicationSupportDirectory
/*
essa função já me devolve a pasta correta que o sistema seleciona para que eu possa
gravar os dados do meu banco de dados. Ao invés de fazer um hardcode do PATH da
pasta. Isso até ajuda a organizar o código, pois reduz a necessidade de ficar se
repetindo
 */