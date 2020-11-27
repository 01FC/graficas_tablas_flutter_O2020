import 'package:charts_stats/graficas.dart';
import 'package:charts_stats/tablas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            tooltip: "Tabla",
            icon: Icon(Icons.table_chart),
            onPressed: () =>
                BlocProvider.of<HomeBloc>(context).add(ShowDataTableEvent()),
          ),
          IconButton(
            tooltip: "Barras",
            icon: Icon(Icons.insert_chart),
            onPressed: () {
              BlocProvider.of<HomeBloc>(context).add(
                ShowChartsEvent(showAsBarChart: true),
              );
            },
          ),
          IconButton(
            tooltip: "Pay",
            icon: Icon(Icons.pie_chart),
            onPressed: () {
              BlocProvider.of<HomeBloc>(context).add(
                ShowChartsEvent(showAsBarChart: false),
              );
            },
          )
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        //TODO: add parameters to Table and charts
        builder: (context, state) {
          if (state is DataTableState)
            return Tablas();
          else if (state is ChartsState) return Graficas();

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
