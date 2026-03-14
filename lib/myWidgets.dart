import 'package:flutter/material.dart';

// --------------------------- Widget Search Bar --------------------------------

class MySearchBar extends StatefulWidget {

  final VoidCallback reload;

  const MySearchBar({super.key, required this.reload});

  @override
  State<StatefulWidget> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar>{

  final SearchController _searchController = SearchController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child:
        Container(
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
                  padding: EdgeInsetsGeometry.only(right: 10, bottom: 20, top: 10, left: 22),
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
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                      ),
                      child: const Icon(Icons.menu, size: 30),
                    ),
                  ),
                ),
                //------------------- SearchBar ------------------
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                    top: 10,
                  ),
                  child: SearchBar(
                    controller: _searchController,
                    trailing: [
                      IconButton(
                          onPressed: () => _searchController.clear(),
                          icon: Icon(Icons.cancel)
                      )
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
                      onPressed: () => (),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        // Cor do botão
                        foregroundColor: Colors.white,
                        // Cor do ícone/texto
                        fixedSize: const Size(25, 25),
                        padding: EdgeInsets.zero,
                        // LARGURA e ALTURA iguais para o quadrado
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
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
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
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

//---------------------------- Widget Provisory --------------------------------

class ProvisoryWidget extends StatelessWidget {

  final int index;

  const ProvisoryWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(5),
      child: SizedBox(
        height: 110,
        child: Container(
          color: Colors.blue,
          child: Center(
            child: Text("$index", style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
        ),
      ),
    );
  }
}

//------------------------------ Widget Drawer ---------------------------------

class MyDrawer extends StatelessWidget{
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blueAccent),
            child: Center(child: Text("M E N U", style: TextStyle(color: Colors.white, fontSize: 30),)),
          ),
          ListTile(
            leading: const Icon(Icons.last_page),
            title: const Text("C R I A R"),
            onTap: () {
              Navigator.pushNamed(context, '/createpage');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("C O N F I G U R A Ç Ã O"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}