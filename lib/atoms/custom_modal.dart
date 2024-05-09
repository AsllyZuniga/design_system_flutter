import 'package:flutter/material.dart';
class CustomModal extends StatelessWidget {
  final bool isOpenCommentsModal;
  final String modalHeaderTitle;
  final String primaryButtonText;
  final String secondaryButtonText;
  final String valueTextArea;

  const CustomModal({
    super.key,
    required this.isOpenCommentsModal,
    required this.modalHeaderTitle,
    required this.primaryButtonText,
    required this.secondaryButtonText,
    required this.valueTextArea,
  });

  @override
  Widget build(BuildContext context) {
    return isOpenCommentsModal
        ? AlertDialog(
            contentPadding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
            backgroundColor: Colors.white, // Fondo blanco
            title: Row(
              children: [
                Expanded(
                  child: Text(
                    modalHeaderTitle,
                    style: const TextStyle(color: Colors.black), // Texto en color negro
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.clear),
                  color: Colors.black, // Icono en color negro
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            content: SizedBox(
              width: double.infinity,
              child: TextFormField(
                initialValue: valueTextArea,
                maxLines: 2,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white, // Fondo blanco
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(color: Colors.black), // Texto en color negro
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  secondaryButtonText,
                  style: TextStyle(color: Colors.lightBlueAccent), // Texto en color azul cielo
                ),
              ),
              SizedBox(width: 8), // Espaciado entre botones
              ElevatedButton.icon(
                onPressed: () {
                  // Acción de enviar
                },
                icon: Icon(
                  Icons.send,
                  color: Colors.white, // Icono en color blanco
                ),
                label: Text(
                  primaryButtonText,
                  style: TextStyle(color: Colors.white), // Texto en color blanco
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  primary: Colors.lightBlueAccent, // Color de fondo del botón azul cielo
                ),
              ),
            ],
          )
        : SizedBox();
  }
}