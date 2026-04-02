import 'package:test01_db_interface/my_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'database.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<StatefulWidget> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final ScrollController _scrollController = ScrollController();

  final TextEditingController nameController = TextEditingController(); //tabela 1
  final TextEditingController numberController = TextEditingController(); //tabela 1
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController rgController = TextEditingController();
  final TextEditingController dateController = TextEditingController(); //tabela 1
  final TextEditingController ageController = TextEditingController(); //tabela 1
  final TextEditingController nationalityController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  final TextEditingController nameRespController = TextEditingController();
  final TextEditingController numberRespController = TextEditingController();
  final TextEditingController cpfRespController = TextEditingController();
  final TextEditingController rgRespController = TextEditingController();
  final TextEditingController estagioController = TextEditingController();
  final TextEditingController materialController = TextEditingController();

  final TextEditingController necessityController = TextEditingController();

  bool boolMatricula = false; // tabela 1
  bool boolDemonstrativa = false; //tabela 1
  bool boolNecessidades = false; //tabela 1

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Center(
          child: Text(
            "C A D A S T R A R  A L U N O",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Center(
        child: RawScrollbar(
          controller: _scrollController,
          thumbColor: Color(0xffcf5eff),
          thumbVisibility: true,
          trackVisibility: true,
          thickness: 20,
          radius: const Radius.circular(5),
          // ----------------- LIST VIEW -------------------------------
          child: ListView(
            controller: _scrollController,
            primary: false,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                // -------------------------- body ---------------------------
                children: [
                  // --------------------- dados estudante -------------------
                  Padding(
                    padding: EdgeInsetsGeometry.only(top: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              "D A D O S  D O  E S T U D A N T E",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 40, left: 40),
                            child: SizedBox(
                              //decoration: BoxDecoration(border: Border.all()),
                              width: screenSize.width * 0.9,
                              height: screenSize.height * 0.12,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyTextField(
                                    capacity: 35,
                                    name: "Nome",
                                    controler: nameController,
                                    mask: null,
                                  ),
                                  MyTextField(
                                    capacity: 10,
                                    name: "DD/MM/AAAA",
                                    controler: dateController,
                                    mask: dateFormatter,
                                  ),
                                  MyTextField(
                                    capacity: null,
                                    name: "Idade",
                                    controler: ageController,
                                    mask: null,
                                  ),
                                  MyTextField(
                                    capacity: 12,
                                    name: "Celular",
                                    controler: numberController,
                                    mask: phoneFormatter,
                                  ),
                                  MyTextField(
                                    capacity: 20,
                                    name: "Nacionalidade",
                                    controler: nationalityController,
                                    mask: null,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 40,
                              top: 10,
                              bottom: 10,
                            ),
                            child: SizedBox(
                              //decoration: BoxDecoration(border: Border.all()),
                              width: screenSize.width * 0.9,
                              height: screenSize.height * 0.12,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyTextField(
                                    capacity: 14,
                                    name: "CPF",
                                    controler: cpfController,
                                    mask: cpfFormatter,
                                  ),
                                  MyTextField(
                                    capacity: 12,
                                    name: "RG",
                                    controler: rgController,
                                    mask: rgFormatter,
                                  ),
                                  MyTextField(
                                    capacity: 60,
                                    name: "Endereço",
                                    controler: addressController,
                                    mask: null,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      // -----------------------------------------------------
                    ),
                  ),
                  // ------------------------ descrição ----------------------
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 10),
                    child: SizedBox(
                      //decoration: BoxDecoration(border: Border.all()),
                      width: screenSize.width * 0.9,
                      height: screenSize.height * 0.5,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 3, color: Colors.purple),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: SizedBox(
                                width: screenSize.width * 0.5,
                                child: TextField(
                                  keyboardType: TextInputType.multiline,
                                  maxLength: 1000,
                                  maxLines: null,
                                  minLines: 10,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.purple,
                                        width: 3.0,
                                      ),
                                    ),
                                    labelStyle: TextStyle(color: Colors.black),
                                    labelText: "Descrição",
                                    border: OutlineInputBorder(),
                                  ),
                                  controller: descriptionController,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: SizedBox(
                                width: screenSize.width * 0.3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Aluno possui necessidades especiais?",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Checkbox(
                                      value: boolNecessidades,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          boolNecessidades = value!;
                                        });
                                      },
                                    ),
                                    if (boolNecessidades)
                                      MyTextField(
                                        capacity: 20,
                                        name: "condição",
                                        controler: necessityController,
                                        mask: null,
                                      ),
                                    Text(
                                      "Aluno fez aula demonstrativa?",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Checkbox(
                                      value: boolDemonstrativa,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          boolDemonstrativa = value!;
                                        });
                                      },
                                    ),
                                    Text(
                                      "Aluno está matriculado?",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Checkbox(
                                      value: boolMatricula,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          boolMatricula =
                                              value ??
                                              false; // Atualiza o booleano de qualquer jeito

                                          if (!boolMatricula) {
                                            // Se caiu no false, limpa tudo
                                            nameRespController.text = '';
                                            numberRespController.text = '';
                                            cpfRespController.text = '';
                                            rgRespController.text = '';
                                            estagioController.text = '';
                                            materialController.text = '';
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // ------------------------ inscrição ----------------------
                  if (boolMatricula)
                    Padding(
                      padding: EdgeInsetsGeometry.only(top: 20, bottom: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 3),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                "M A T R I C U L A",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 40),
                              child: SizedBox(
                                //decoration: BoxDecoration(border: Border.all()),
                                width: screenSize.width * 0.9,
                                height: screenSize.height * 0.12,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MyTextField(
                                      capacity: 20,
                                      name: "Estágio JET",
                                      controler: estagioController,
                                      mask: null,
                                    ),
                                    MyTextField(
                                      capacity: 20,
                                      name: "Material didático",
                                      controler: materialController,
                                      mask: null,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: SizedBox(
                                //decoration: BoxDecoration(border: Border.all()),
                                width: screenSize.width * 0.9,
                                height: screenSize.height * 0.12,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MyTextField(
                                      capacity: 35,
                                      name: "Responsável",
                                      controler: nameRespController,
                                      mask: null,
                                    ),
                                    MyTextField(
                                      capacity: 12,
                                      name: "Celular",
                                      controler: numberRespController,
                                      mask: phoneFormatter,
                                    ),
                                    MyTextField(
                                      capacity: 14,
                                      name: "CPF",
                                      controler: cpfRespController,
                                      mask: cpfFormatter,
                                    ),
                                    MyTextField(
                                      capacity: 12,
                                      name: "RG",
                                      controler: rgRespController,
                                      mask: rgFormatter,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        // -----------------------------------------------------
                      ),
                    ),
                  // ------------------------- Button create -------------------
                  Padding(
                    padding: EdgeInsets.only(bottom: 50, top: 20),
                    child: SizedBox(
                      width: 270,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.purple, width: 3),
                        ),
                        onPressed: () async {
                          final db = Provider.of<AppDatabase>(
                            context,
                            listen: false,
                          );

                          await db.addAlunoFull(
                            // Tabela 1
                            nome: nameController.text,
                            idade: int.tryParse(ageController.text) ?? 0,
                            matricula: boolMatricula,
                            demo: boolDemonstrativa,
                            necessidade: boolNecessidades,
                            condition: necessityController.text,
                            data: dateController.text,
                            numero: numberController.text,

                            // Tabela 2
                            address: addressController.text,
                            cpf: cpfController.text,
                            rg: rgController.text,
                            nacionalidade: nationalityController.text,
                            description: descriptionController.text,
                            nameResp: nameRespController.text,
                            numberResp: numberRespController.text,
                            cpfResp: cpfRespController.text,
                            rgResp: rgRespController.text,
                            material: materialController.text,
                            estagio: estagioController.text,
                          );

                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Aluno novo CADASTRADO com sucesso!',
                                ),
                              ),
                            );
                            Navigator.pop(context);
                          }
                        },
                        child: Text(
                          "C R I A R",
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                ],
                // -----------------------------------------------------------
              ),
            ],
          ),
        ),
      ),
    );
  }
}
