import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _formKey = GlobalKey<FormState>();

  String nombre="hola";
  String apellido="hola";
  Map<String,String> cliente=Map();

  funcionEnvio() {
    // puede ser nulo, lo puedo transformar  podrianulo??"hola"
    // indicar que el valor no es nulo podrianulo!
    if(_formKey.currentState!.validate()) {
      setState(() {
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Processing Data nombre: ${nombre} y apellido ${apellido} ')),
      );
    }
  } // fin funcionEnvio
  String? validarNombre(String? value) {
    if(value=="") {
      return "el valor es requerido";
    }
    cliente['nombre']=value??"sin nombre";
    nombre=value??"sin nombre";
  }
  String? validarApellido(String? value) {
      if(value=="" || value==null) {
        return "el valor es requerido";
      }
      apellido=value;
  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("titulo")
        ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Text("Nombre:"),
            TextFormField(
              initialValue: nombre,
              validator: validarNombre,
            ),
            Text("el nombre se llama ${nombre}"),
            SizedBox(height: 50),
            Text("Apellido:"),
            TextFormField(
              initialValue: apellido,
              validator: validarApellido,
            ),
            ElevatedButton(
                onPressed: funcionEnvio,
                child: Text("Enviar formulario")
            )

          ],
        )
      )
    );
  }
}
