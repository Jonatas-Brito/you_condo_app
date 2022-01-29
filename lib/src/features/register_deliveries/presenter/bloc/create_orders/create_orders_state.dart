part of 'create_orders_cubit.dart';

abstract class CreateOrdersState extends Equatable {
  const CreateOrdersState();

  @override
  List<Object> get props => [];
}

class CreateOrdersInitial extends CreateOrdersState {}

class CreateOrdersSuccess extends CreateOrdersState {}

class CreateOrdersLoading extends CreateOrdersState {}

class CreateOrdersError extends CreateOrdersState {
  final String errorMessage;
  const CreateOrdersError({this.errorMessage = "Erro ao adicionar entrega"});
}
