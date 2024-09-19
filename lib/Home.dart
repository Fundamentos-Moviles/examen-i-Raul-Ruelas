import 'package:flutter/material.dart';
import 'package:examen1_rsr/Utils/Constantes.dart' as con;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<String> lista;

  @override
  void initState() {
    lista = List.from(con.lista);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: con.fondo3,
      appBar: AppBar(
        title: const Text(
          "Calendario de Cumpleaños",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: con.titulos,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: size.height,
                  width: size.width,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: lista.length,
                    itemBuilder: (BuildContext context, int index) {
                      var datos = lista[index].toString().split('#');
                      if (datos.length >= 8) {
                        try {
                          int id = int.parse(datos[0]);
                          String dia = datos[2];
                          String mes = datos[3];
                          String nombre = datos[4];
                          String apellidos = datos[5];
                          String descripcion = datos[6];
                          int estrellas = int.parse(datos[7]);

                          bool mostrarBotonBorrar = index.isOdd;

                          return index.isOdd
                              ? createdCardCompact(
                            id: id,
                            nombre: '$nombre $apellidos',
                            descripcion: descripcion,
                            dia: dia,
                            mes: mes,
                            estrellas: estrellas,
                            fullWidth: size.width,
                          )
                              : createdCard(
                            id: id,
                            nombre: '$nombre $apellidos',
                            descripcion: descripcion,
                            dia: dia,
                            mes: mes,
                            estrellas: estrellas,
                            fullWidth: size.width,
                          );
                        } catch (e) {
                          return Container();
                        }
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Container(
              color: con.fondo3,
              child: Center(
                child: const Text(
                  'Raúl Ruelas Santana',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container createdCard({
    required int id,
    required String nombre,
    required String descripcion,
    required String dia,
    required String mes,
    required int estrellas,
    required double fullWidth,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        onTap: () {
          showSnackBar(
              'ID: $id\nFecha: $dia de $mes\nNombre: $nombre\nDescripción: $descripcion\nEstrellas: $estrellas',
              5);
        },
        title: Text(
          '$dia - $mes',
          style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nombre,
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
            Text(
              descripcion,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              [1, 5, 10, 15].contains(id) ? Icons.eco : Icons.eco,
              color: [1, 5, 10, 15].contains(id) ? Colors.yellow : Colors.red,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(5, (i) {
                return Icon(
                  i < estrellas ? Icons.star : Icons.star_border,
                  color: i < estrellas ? Colors.amber : Colors.grey,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Container createdCardCompact({
    required int id,
    required String nombre,
    required String descripcion,
    required String dia,
    required String mes,
    required int estrellas,
    required double fullWidth,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                onTap: () {
                  showSnackBar(
                      'ID: $id\nFecha: $dia de $mes\nNombre: $nombre\nDescripción: $descripcion\nEstrellas: $estrellas',
                      5);
                },
                title: Text(
                  '$dia - $mes',
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nombre,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    Text(
                      descripcion,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      [1, 5, 10, 15].contains(id) ? Icons.eco : Icons.eco,
                      color: [1, 5, 10, 15].contains(id) ? Colors.yellow : Colors.red,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(5, (i) {
                        return Icon(
                          i < estrellas ? Icons.star : Icons.star_border,
                          color: i < estrellas ? Colors.amber : Colors.grey,
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 8), // Espacio entre la carta y el botón
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(10),
                backgroundColor: con.botones,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                if ([1, 10, 15, 20, 23].contains(id)) {
                  showSnackBar('No puedes eliminar el elemento con ID: $id', 5);
                } else {
                  setState(() {
                    lista.removeWhere((element) => int.parse(element.toString().split('#')[0]) == id);
                  });
                  showSnackBar('Elemento con ID $id eliminado', 5);
                }
              },
              icon: const Icon(Icons.delete, color: Colors.white),
              label: const Text('Borrar', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }


  void showSnackBar(String texto, int duracion) {
    final snack = SnackBar(
      content: Text(texto),
      duration: Duration(seconds: duracion),
      action: SnackBarAction(
        onPressed: () {},
        label: 'Cerrar',
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }
}
