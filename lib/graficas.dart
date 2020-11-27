import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Graficas extends StatefulWidget {
  // PASO 1 PARAMETROS
  final List<Map<String, dynamic>> listadoDeDatos;
  final bool showBarChart;
  Graficas({
    Key key,
    @required this.listadoDeDatos,
    @required this.showBarChart,
  }) : super(key: key);

  @override
  _GraficasState createState() => _GraficasState();
}

class _GraficasState extends State<Graficas> {
  // PASO 4
  @override
  Widget build(BuildContext context) {
    var _colors =
        charts.MaterialPalette.getOrderedPalettes(widget.listadoDeDatos.length);
    return _simpleCharts(_colors);
  }

  // PASO 3
  Widget _simpleCharts(dynamic colors) {
    // Datos x,y a pintar en una grafica (de tipo chart object y string)
    // lista de puntos con un string de label
    var _chartElements = List<charts.Series<_ChartObject, String>>();

    // listado de puntos dados por las coordenadas x,y
    var chartData = widget.listadoDeDatos
        .map(
          (item) => _ChartObject(
            xAxis: item["producto"],
            yAxis: item["cantidad"],
          ),
        )
        .toList();

    // agregar los puntos a la lista de leementos y label
    _chartElements.add(
      charts.Series<_ChartObject, String>(
        id: "Grafica132",
        data: chartData,
        measureFn: (object, index) => object.yAxis,
        domainFn: (object, index) => object.xAxis,
        colorFn: (object, index) => colors[index].shadeDefault,
        labelAccessorFn: (object, index) => "${object.xAxis} : ${object.yAxis}",
      ),
    );

    // pintar grafica de tipo barras, o pay o lo que sea
    // cada grafica tiene sus datos
    if (widget.showBarChart) {
      return charts.BarChart(
        _chartElements,
        animate: true,
        behaviors: [
          charts.ChartTitle("Productos"),
          charts.DatumLegend(desiredMaxRows: 2),
        ],
      );
    } else {
      return charts.PieChart(
        _chartElements,
        animate: true,
        behaviors: [
          charts.ChartTitle("Productos"),
          charts.DatumLegend(
            desiredMaxRows: 2,
            position: charts.BehaviorPosition.bottom,
          ),
        ],
        defaultRenderer: charts.ArcRendererConfig(
          arcRatio: 0.6,
          arcRendererDecorators: [
            charts.ArcLabelDecorator(
              labelPosition: charts.ArcLabelPosition.auto,
            ),
          ],
        ),
      );
    }
  }
}

//PASO 2 OBJETO CUSTOM CON DATOS PARA X , Y
class _ChartObject {
  final String xAxis;
  final int yAxis;

  _ChartObject({
    @required this.xAxis,
    @required this.yAxis,
  });
}
