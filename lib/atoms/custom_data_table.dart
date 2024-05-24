
import 'package:flutter/material.dart';

class CustomDataTable extends StatefulWidget {
  final bool dynamic;
  final bool headerSplit;
  final bool hiddenCurrentActions;
  final bool hiddenHeader;
  final bool hiddenNewRow;
  final bool reorder;
  final bool rowNumber;
  final String dataTableMessage;
  final String containerWidthScrollTable;
  final List data;
  final String dataTableMessageDynamic;
  final Object filterData;
  final List footer;
  final List headers;

  const CustomDataTable({
    Key? key,
    required this.dynamic,
    required this.headerSplit,
    required this.hiddenCurrentActions,
    required this.hiddenHeader,
    required this.hiddenNewRow,
    required this.reorder,
    required this.rowNumber,
    required this.dataTableMessage,
    required this.containerWidthScrollTable,
    required this.data,
    required this.dataTableMessageDynamic,
    required this.filterData,
    required this.footer,
    required this.headers,
  }) : super(key: key);

  @override
  State<CustomDataTable> createState() => _CustomDataTableState();
}

class _CustomDataTableState extends State<CustomDataTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Data Table'),
      ),
      body: Center(
        child: widget.dynamic ? _buildDynamicDataTable() : _buildStaticDataTable(),
      ),
    );
  }

  Widget _buildDynamicDataTable() {
    // Implementa la construcción de la tabla dinámica aquí
    return Text('Dynamic Data Table');
  }

  Widget _buildStaticDataTable() {
    // Implementa la construcción de la tabla estática aquí
    return Text('Static Data Table');
  }
}
