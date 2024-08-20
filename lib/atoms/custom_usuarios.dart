import 'package:flutter/material.dart';
import 'package:flutter_application_test/atoms/custom_input.dart';
import 'package:flutter_application_test/atoms/custom_button.dart';
import 'package:flutter_application_test/atoms/custom_data_table.dart';

class CustomUsuarios extends StatefulWidget {
  @override
  _CustomUsuariosState createState() => _CustomUsuariosState();
}

class _CustomUsuariosState extends State<CustomUsuarios> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, dynamic>> data = [
    {"nombre de usuario": "Aslly", "estado": 1},
    {"nombre de usuario": "Giselle", "estado": 0},
    {"nombre de usuario": "Steven", "estado": 1},
    {"nombre de usuario": "Diego", "estado": 0},
  ];

  final List<String> headers = ['Nombre de usuario', 'Estado', 'Acciones'];

  int? editUserIndex;

  final TextEditingController _usernameController = TextEditingController();
  int _status = 1;

  void _openEndDrawer({int? index}) {
    setState(() {
      editUserIndex = index;
      if (index != null) {
        _usernameController.text = data[index]['nombre de usuario'];
        _status = data[index]['estado'];
      } else {
        _usernameController.clear();
        _status = 1;
      }
    });
    _scaffoldKey.currentState?.openEndDrawer();
  }

  void _saveUser() {
    setState(() {
      if (editUserIndex != null) {
        data[editUserIndex!]['nombre de usuario'] = _usernameController.text;
        data[editUserIndex!]['estado'] = _status;
      } else {
        data.add({
          "nombre de usuario": _usernameController.text,
          "estado": _status,
        });
      }
    });
    closeEndDrawer();
  }

  void closeEndDrawer() {
    _usernameController.clear();
   /*  _status = 1; */
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          'Gestión de Usuarios',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), // Cambiar color del título
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Administrar Usuarios',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: '+ Nuevo Usuario',
              onPressed: () => _openEndDrawer(),
              backgroundColor: Colors.blue,
              textColor: Colors.white,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomDataTable(
                  data: data,
                  headers: headers,
                  onEdit: (index) => _openEndDrawer(index: index),
                ),
              ),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                editUserIndex != null
                    ? 'Editar Usuario'
                    : 'Crear Nuevo Usuario',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 20),
              CustomInput(
                type: 'text',
                label: 'Nombre de usuario',
                controller: _usernameController,
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    'Estado:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 10),
                  DropdownButton<int>(
                    value: _status,
                    onChanged: (newValue) {
                      setState(() {
                        _status = newValue!;
                      });
                    },
                    items: [
                      DropdownMenuItem(
                        value: 1,
                        child: Text('Activo'),
                      ),
                      DropdownMenuItem(
                        value: 0,
                        child: Text('Inactivo'),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    text: 'Cancelar',
                    onPressed: closeEndDrawer,
                    backgroundColor: Colors.grey,
                    textColor: Colors.white,
                  ),
                  CustomButton(
                    text: 'Guardar',
                    onPressed: _saveUser,
                    backgroundColor: Colors.blue,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
