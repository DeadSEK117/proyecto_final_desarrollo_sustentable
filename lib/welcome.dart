import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    home: WelcomeScreen(),
  ));
}

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
              child: const FlutterLogo(
                size: 200,
              ),
            ),
            // Título
            FadeTransition(
              opacity: _titleOpacity,
              child: Text(
                'PETSAVE',
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                        fontSize: 50, fontWeight: FontWeight.bold),
                    color: Colors.cyan),
              ),
            ),
            // Subtítulo
            FadeTransition(
              opacity: _subtitleOpacity,
              child: const Text(
                'El reciclaje es el camino al cielo',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
