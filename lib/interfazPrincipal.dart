import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    home: InterfazPrincipal(),
  ));
}

class InterfazPrincipal extends StatefulWidget {
  const InterfazPrincipal({super.key});

  @override
  State<InterfazPrincipal> createState() => _EstadoInterfaz();
}

class _EstadoInterfaz extends State<InterfazPrincipal> {
  final TextEditingController _textController = TextEditingController();

  late int _valorIngresado;
  late String mensaje;
  late String tip1;
  late String tip2;
  late String tip3;

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

  _modificarTips() {
    _contador += _valorIngresado;
    print('Contador: $_contador');
    print('Tip1: $tip1');
    if (_contador > 3) {
      setState(() {
        tip1 =
            "Para reciclar botellas en casa primero vacialas y limpialas enjuagándolas con agua y unas gotitas de detergente. Después fijate en su etiqueta o en el envase mismo si pueden reciclarse en los contenedores de reciclado de plástico. Si no pueden reciclarse, usalas para hacer manualidades u objetos de decoración para el hogar, o aprovechá para participar en iniciativas locales, como la campaña “Los Plásticos Ala Botella”, la cual incentiva a reciclar plástico de un solo uso dentro de botellas";
      });
      tip2 = """¿Cómo hacer un lapicero con una botella de plástico?
Para hacer un lapicero cortá al medio una botella que no uses. Cubrí la parte superior con cinta blanca para no cortarte y decorala. Podés cubrirla con fotos, papel de revista, pintarla, decorarla con goma Eva, ponerle cuerdas alrededor o, si la botella tiene un lindo diseño, usarla como tal. Además, atrevete a jugar con la terminación de los bordes para hacer diseños creativos y originales.""";
      tip3 =
          "¿Qué se puede hacer reciclando botellas de plástico?\n Con las botellas de plástico que no pueden llevarse a centros de reciclaje podés confeccionar manualidades que van desde macetas, posavasos, cortinas, floreros y lámparas hasta árboles de navidad, organizadores y comederos para los pájaros. El plástico es un material muy versátil y duradero por lo cual permite que se lo pueda reutilizar para hacer infinidades de objetos.";
    }
  }

  _mensajeDefault() {
    tip1 = "Hola amigo te interizaria aprender mas sobrer el reciclaje?";
    tip2 = "Ingres primero registra tu primer reciclaje";
    tip3 = "Y podras ver todo lo que puedes hacer para cambiar al mundo";
  }

  @override
  Widget build(BuildContext context) {
    _mensajeDefault();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade100,
        title: const Text(
          'Se honesto',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset('lib/imagenes/PlanetitaCute.png'),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
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
                    },
                  ),
                ),
              ],
            ),
            Container(
              key: const ValueKey('contenedor1'),
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
                  tip1,
                  style: TextStyle(
                    color: Colors.lightBlueAccent.shade100,
                    fontFamily: 'Roboto',
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Container(
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
            Container(
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
