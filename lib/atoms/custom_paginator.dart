import 'package:flutter/material.dart';

class CustomPaginator extends StatefulWidget {
  final int collectionSize;
  final int currentPage;
  final Function(int) onPageChanged;

  const CustomPaginator({
    Key? key,
    required this.collectionSize,
    required this.currentPage,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  State<CustomPaginator> createState() => _CustomPaginatorState();
}

class _CustomPaginatorState extends State<CustomPaginator> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildPaginator(),
    );
  }

  List<Widget> _buildPaginator() {
    final List<Widget> paginator = [];

    // Agregar botón anterior
    paginator.add(
      IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.blue),
        onPressed: widget.currentPage > 1 ? () => widget.onPageChanged(widget.currentPage - 1) : null,
      ),
    );

    // Agregar números de página
    final int startPage = (widget.currentPage - 2).clamp(1, widget.collectionSize - 3);
    final int endPage = (startPage + 4).clamp(1, widget.collectionSize);

    for (int i = startPage; i <= endPage; i++) {
      paginator.add(
        TextButton(
          onPressed: () => widget.onPageChanged(i),
          child: Text(
            i.toString(),
            style: TextStyle(
              color: i == widget.currentPage ? Colors.lightBlue : Colors.black,
              fontWeight: i == widget.currentPage ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      );
    }

    // Agregar botón siguiente
    paginator.add(
      IconButton(
        icon: const Icon(Icons.arrow_forward, color: Colors.blue),
        onPressed: widget.currentPage < widget.collectionSize ? () => widget.onPageChanged(widget.currentPage + 1) : null,
      ),
    );

    return paginator;
  }
}
