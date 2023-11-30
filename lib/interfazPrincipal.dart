import 'package:flutter/material.dart';
import 'Textoslargos.dart';
import 'contenedores.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.green.shade100,
      hintColor: Colors.greenAccent.shade100,
    ),
    home: InterfazPrincipal(),
  ));
}

class InterfazPrincipal extends StatefulWidget {
  const InterfazPrincipal({super.key});

  @override
  State<InterfazPrincipal> createState() => _EstadoInterfaz();
}

class _EstadoInterfaz extends State<InterfazPrincipal> {
  // controladores para capturar las entradas del TextField
  final TextEditingController _textController = TextEditingController();

  // Variables golbales futuras, para poder definirlas en otro momento
  late Container contenedor1;
  late Container contenedor2;
  late Container contenedor3;
  late Container contenedorTitulo;
  late int _valorIngresado;
  late String mensaje;
  late String _tip1 =
      "Hola amigo te interizaria aprender mas sobrer el reciclaje?";
  late String tip2 = "Ingres primero registra tu primer reciclaje";
  late String tip3 =
      "Y podras ver todo lo que puedes hacer para cambiar al mundo";

  // Widgets de texto para modificarlos en tiempo de ejecucion

  int _contador = 0;

  setValorIngresado(int valorIngresado) {
    _valorIngresado = valorIngresado;
  }

  _salidaMensaje() {
    if (_valorIngresado < 3) {
      mensaje =
          "Muchas gracias por reciclar estas botellas, Estas haciendo un gran cambio";
    } else if (_valorIngresado >= 3 && _valorIngresado < 10) {
      mensaje = "Exelemte si sigues así seras el mejor de todos";
    } else if (_valorIngresado > 10) {
      mensaje = "¡¡¡¡¡Waooo!!!!!, Simplemente asombroso";
    }
  }

  void _modificarTips() {
    _contador += _valorIngresado;
    if (_contador >= 3) {
      setState(() {
        _tip1 = regresarTexto1tip1();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //_mensajeDefault();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade100,
        title: const Text(
          'Se honesto contigo mismo',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(50),
              child: Image.asset('lib/imagenes/PlanetitaCute.png'),
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Botellas resicladas',
                        labelStyle: TextStyle(
                            color: Colors.greenAccent.shade200,
                            fontFamily: 'Pacifico',
                            fontSize: 20)),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: FloatingActionButton(
                    child: Image.asset(
                        'lib/iconos/done_FILL0_wght400_GRAD0_opsz24.png'),
                    onPressed: () {
                      String textInput = _textController.text;
                      // Convert the text input to an integer
                      int bottlesRecycled = int.parse(textInput);
                      setValorIngresado(bottlesRecycled);
                      _modificarTips();
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            titulo,
            contenedor1 = Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.lightGreen,
                  border:
                      Border.all(width: 2, color: Colors.lightGreen.shade100)),
              margin: const EdgeInsets.all(20),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  _tip1,
                  style: TextStyle(
                    color: Colors.cyan.shade100,
                    fontFamily: 'Roboto',
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            contenedor2 = Container(
              key: const ValueKey('contenedor2'),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.lightGreen,
                  border:
                      Border.all(width: 2, color: Colors.lightGreen.shade100)),
              margin: const EdgeInsets.all(20),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  tip2,
                  style: TextStyle(
                    color: Colors.lightBlueAccent.shade100,
                    fontFamily: 'Roboto',
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            contenedor3 = Container(
              key: const ValueKey('contenedor3'),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.lightGreen,
                  border:
                      Border.all(width: 2, color: Colors.lightGreen.shade100)),
              margin: const EdgeInsets.all(20),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  tip3,
                  style: TextStyle(
                    color: Colors.lightBlueAccent.shade100,
                    fontFamily: 'Roboto',
                    fontSize: 25,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
