import 'package:flutter/material.dart';
class CustomSearch extends StatefulWidget {
  final String placeholder;

  const CustomSearch({
    Key? key,
    required this.placeholder,
  }) : super(key: key);

  @override
  _CustomSearchState createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  TextEditingController _textEditingController = TextEditingController();

  bool _showClearIcon = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,  // Ancho del buscador
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: widget.placeholder,
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _showClearIcon = value.isNotEmpty;
                });
              },
              style: const TextStyle(fontSize: 12), // Tamaño del texto
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () {
              if (_showClearIcon) {
                _textEditingController.clear();
                setState(() {
                  _showClearIcon = false;
                });
              } else {
                // Acción de búsqueda
              }
            },
            icon: Icon(
              _showClearIcon ? Icons.clear : Icons.search,
              color: Colors.blue, // Color del icono de búsqueda
            ),
            iconSize: 28, // Tamaño del icono de búsqueda
            padding: const EdgeInsets.all(8), // Padding del icono de búsqueda
          ),
        ],
      ),
    );
  }
}