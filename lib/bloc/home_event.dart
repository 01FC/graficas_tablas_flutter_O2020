part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class ShowDataTableEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}

class ShowChartsEvent extends HomeEvent {
  final bool showAsBarChart;

  ShowChartsEvent({@required this.showAsBarChart});
  @override
  List<Object> get props => [showAsBarChart];
}
