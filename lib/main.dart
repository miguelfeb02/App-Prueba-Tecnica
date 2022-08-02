import 'package:flutter/material.dart';
import 'package:gestionapp/src/pages/productoadd.dart';
import 'package:gestionapp/src/pages/productoedit.dart';
import 'package:gestionapp/src/pages/productos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
         title: "Gestion App",
         initialRoute: "productos",
         routes: {
           "productos": (BuildContext context) => const Productos(),
           "productoedit": (BuildContext context) => const ProductoEdit(),
           "productoadd": (BuildContext context) => const ProductoAdd(),
         },

         
    );
  }
}

