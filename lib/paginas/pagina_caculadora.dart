import 'package:flutter/material.dart';

class PaginaCalculadora extends StatefulWidget {
  const PaginaCalculadora({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PaginaCalculadora();
  }
}

class _PaginaCalculadora extends State<PaginaCalculadora> {
  final _formKey = GlobalKey<FormState>();

  int numero1 = 0;
  int numero2 = 0;
  int suma = 0;

  onPressed() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        suma = numero1 + numero2;
      });
      numero1 = 0;
      numero2 = 0;
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("titulo")),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              initialValue: numero1.toString(),
              validator: (value) {
                numero1 = int.parse(value!);
              },
            ),
            TextFormField(
              initialValue: numero2.toString(),
              validator: (value) {
                numero2 = int.parse(value!);
              },
            ),
            DropdownButtonFormField<String>(items: const [
              DropdownMenuItem(child: Text("uno"), value: "1"),
              DropdownMenuItem(child: Text("dos"), value: "2"),
              DropdownMenuItem(child: Text("tres"), value: "3"),
            ], onChanged: (value) {}),
            Text(suma.toString()),
            ElevatedButton(onPressed: onPressed, child: Text("sumar"))
          ],
        ),
      ),
    );
  }
}
