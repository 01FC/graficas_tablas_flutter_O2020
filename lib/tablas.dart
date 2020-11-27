import 'package:flutter/material.dart';

class Tablas extends StatefulWidget {
  // PASO 1 PARAMETRO
  final List<Map<String, dynamic>> listadoDeDatos;
  Tablas({Key key, @required this.listadoDeDatos}) : super(key: key);

  @override
  _TablasState createState() => _TablasState();
}

class _TablasState extends State<Tablas> {
  // PASO 2 LISTA PARA COLUMNAS Y RENGLONES
  var _columnas = List<DataColumn>();
  var _renglones = List<DataRow>();

  @override
  void initState() {
    // PASO 4 INICIALIZAR LISTAS DE COLS Y ROWS
    _fillColumns();
    _fillRows();
    super.initState();
  }

  // PASO 5 PINTAR LA TABLA
  @override
  Widget build(BuildContext context) {
    // TODO: Ordenar, en la Column indicar alguna funcion para ordenar, onSort:
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        sortColumnIndex: 0,
        columns: _columnas,
        rows: _renglones,
      ),
    );
  }

  // PASO 3 OBTENER LOS DATOS PARA COLUMNAS Y RENGLONES

  // obtener nombre de columnas
  void _fillColumns() {
    _columnas = widget.listadoDeDatos[0].entries
        .map(
          (item) => DataColumn(
            label: Text("${item.key}"),
          ),
        )
        .toList();
  }

  // obtener datos de renglones
  void _fillRows() {
    for (var item in widget.listadoDeDatos) {
      List<DataCell> celdas = item.entries
          .map(
            (entry) => DataCell(
              entry.key == "color"
                  ? Container(
                      height: 8,
                      width: 8,
                      color: Color(int.parse("${entry.value}")),
                    )
                  : Text("${entry.value}"),
            ),
          )
          .toList();
      _renglones.add(DataRow(cells: celdas));
    }
  }
}
