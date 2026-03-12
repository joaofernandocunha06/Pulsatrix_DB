import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child:
          Expanded(
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
              padding: const EdgeInsets.only(left: 5, right: 5, bottom: 7),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(9),
                    bottomLeft: Radius.circular(9),
                  ),
                ),
                child: Row(children: [
                  Padding(padding: EdgeInsetsGeometry.all(10),
                  child: SizedBox(
                      height: 20,
                      width: 20,
                      child: ElevatedButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,      // Cor do botão
                          foregroundColor: Colors.white,     // Cor do ícone/texto
                          fixedSize: const Size(20, 20),
                          padding: EdgeInsets.zero,// LARGURA e ALTURA iguais para o quadrado
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero, // Remove os cantos arredondados
                          ),
                        ),
                        child: const Icon(Icons.add, size: 20),
                      )
                  ),
                ),
                  Padding(
                  padding: const EdgeInsets.only(left: 0, right: 20, bottom: 20, top: 10), // Ajustei o padding lateral
                  child: SearchBar(
                    hintText: "Pesquisar...",
                    backgroundColor: const WidgetStatePropertyAll(Color.fromARGB(255, 222, 222, 222)),
                    shape: WidgetStatePropertyAll<OutlinedBorder>(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
                    ),
                  ),
                )],),
              ),
            ),
          )
    );
  }
}

class ProvisoryWidget extends StatelessWidget {
  final int index;
  const ProvisoryWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsetsGeometry.all(5), child: SizedBox(height: 130, child: Container(color: Colors.blue, child: Center(child: Text("$index", style: TextStyle(color: Colors.white),),),),),);
  }
}