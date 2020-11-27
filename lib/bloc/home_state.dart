part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class DataTableState extends HomeState {
  final List<Map<String, dynamic>> listaDatos;

  DataTableState({@required this.listaDatos});
  @override
  List<Object> get props => [listaDatos];
}

class ChartsState extends HomeState {
  final List<Map<String, dynamic>> listaDatos;
  final bool showAsBarChart;

  ChartsState({
    @required this.showAsBarChart,
    @required this.listaDatos,
  });
  @override
  List<Object> get props => [listaDatos, showAsBarChart];
}
