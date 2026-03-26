import 'package:test01_db_interface/ConfigPage.dart';
import 'package:test01_db_interface/CreatePage.dart';
import 'package:window_manager/window_manager.dart';
import 'package:test01_db_interface/myWidgets.dart';
import 'package:test01_db_interface/homePage.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  final database = AppDatabase();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(1200, 700),
    backgroundColor: Colors.transparent,
    titleBarStyle: TitleBarStyle.normal,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.setTitle("Nome provisório");
    await windowManager.focus();

    // AQUI você bloqueia o redimensionamento:
    await windowManager.setResizable(false);
  });

  runApp(
    Provider<AppDatabase>(
      create: (context) => database,
      dispose: (context, db) => db.close(), // Fecha o banco ao fechar o app
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: SizedBox(
          width: MediaQuery.of(context).size.width * 0.3, // Ocupa 30% da tela
          child: MyDrawer(),
        ),
        body: MyHomePage(),
      ),
      routes: {
        '/createpage': (context) => CreatePage(),
        '/configpage': (context) => ConfigPage()
      },
    );
  }
}