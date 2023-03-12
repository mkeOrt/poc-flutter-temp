import 'package:corazon_de_nino/pages/home.dart';
import 'package:corazon_de_nino/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            cardTheme: const CardTheme(color: Colors.white)),
        home: ChangeNotifierProvider(
          create: (_) => HomeProvider(),
          child: const Home(),
        ));
  }
}
