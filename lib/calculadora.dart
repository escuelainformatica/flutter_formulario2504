import 'package:ejemplo_form2/paginas/pagina_caculadora.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AppCalculadora());
}

class AppCalculadora extends StatelessWidget {
  const AppCalculadora({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaginaCalculadora(),
    );
  }

}