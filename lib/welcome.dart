import 'package:flutter/material.dart';

/*
void main(List<String> args) {
  runApp(const MaterialApp(
    home: WelcomeScreen(),
  ));
}
*/

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  // Animaciones
  late AnimationController _controller;
  late Animation<double> _logoOpacity;
  late Animation<double> _titleOpacity;
  late Animation<double> _subtitleOpacity;

  @override
  void initState() {
    super.initState();

    // Inicializar animaciones
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    // Animar opacidad del logotipo
    _logoOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Animar opacidad del título
    _titleOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Animar opacidad del subtítulo
    _subtitleOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Iniciar animaciones
    _controller.forward();
  }

  @override
  void dispose() {
    // Detener animaciones
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            FadeTransition(
              opacity: _logoOpacity,
              child: Image.asset('lib/imagenes/logoTexto.png'),
            ),
            // Título
            /*FadeTransition(
              opacity: _titleOpacity,
              child: Text(
                'PETSAVE',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.greenAccent.shade400,
                    fontFamily: 'Pacifico'),
              ),
            ),*/
            // Subtítulo
            FadeTransition(
              opacity: _subtitleOpacity,
              child: Text(
                'Salva un arbol con una botella',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.green.shade600,
                    fontFamily: 'DancingScript',
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
