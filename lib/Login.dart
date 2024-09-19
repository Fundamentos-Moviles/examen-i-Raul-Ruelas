import 'package:flutter/material.dart';
import 'package:examen1_rsr/Home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  String errorMessage = '';

  /// Lista de colores para los cuadrados en la vista
  final List<Color> squareColors = [
    Color(0xff01644a),
    Color(0xff02b274),
    Color(0xff01412e),
    Color(0xff02b274),
    Color(0xff02b274),
    Color(0xff01412e),
    Color(0xff01644a),
    Color(0xff02b274),
    Color(0xff01412e),
    Color(0xff02b274),
    Color(0xff02b274),
    Color(0xff01644a),
    Color(0xff02b274),
    Color(0xff01644a),
    Color(0xff02b274),
    Color(0xff01412e),
    Color(0xff01644a),
    Color(0xff02b274),
    Color(0xff01412e),
    Color(0xff02b274),
    Color(0xff02b274),
    Color(0xff01412e),
    Color(0xff01644a),
  ];

  final List<bool> showSquares = List.generate(24, (index) {
    const ocultar = {1, 7, 10, 12, 17, 23};
    return !ocultar.contains(index);
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {

          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;

          double containerWidth = screenWidth / 4;
          double containerHeight = screenHeight / 6;

          return Stack(
            children: [
              Container(
                color: Color(0xff015236),
                child: Column(
                  children: List.generate(6, (rowIndex) {
                    return Row(
                      children: List.generate(4, (colIndex) {
                        int index = rowIndex * 4 + colIndex;
                        return Container(
                          width: containerWidth,
                          height: containerHeight,
                          decoration: BoxDecoration(
                            color: showSquares[index] ? squareColors[index] : Colors.transparent,
                            borderRadius: BorderRadius.circular(45),
                          ),
                        );
                      }),
                    );
                  }),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Bienvenido a tu primer EXAMEN',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff96b602),
                          ),
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Ingresa tu correo electrónico:',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        TextField(
                          controller: user,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Correo',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          ),
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Ingresa tu contraseña:',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        TextField(
                          controller: pass,
                          obscureText: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Contraseña',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          ),
                        ),
                        SizedBox(height: 10),
                        if (errorMessage.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              errorMessage,
                              style: TextStyle(color: Colors.red, fontSize: 16),
                            ),
                          ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffdca900),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          ),
                          onPressed: () {
                            String email = user.text;
                            String password = pass.text;

                            setState(() {
                              if (email.isEmpty || password.isEmpty) {
                                errorMessage = 'Datos incompletos';
                              } else if (email != 'test@correo.mx') {
                                errorMessage = 'Correo incorrecto';
                              } else if (password != 'FDM2') {
                                errorMessage = 'Contraseña incorrecta';
                              } else {
                                errorMessage = '';
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context)=> Home()));
                              }
                            });
                          },
                          child: Text('Iniciar Sesión'),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Mi primer examen, ¿estará sencillo?',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}