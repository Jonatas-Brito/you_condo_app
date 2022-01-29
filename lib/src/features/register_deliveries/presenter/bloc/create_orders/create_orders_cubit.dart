import 'package:youcondo/src/features/register_deliveries/domain/entities/order_entity.dart';
import 'package:youcondo/src/features/register_deliveries/domain/usecases/create_order_usecase.dart';
import 'package:youcondo/src/features/register_deliveries/domain/usecases/params/order_params.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_orders_state.dart';

class CreateOrdersCubit extends Cubit<CreateOrdersState> {
  final CreateOrderUseCase useCase;
  CreateOrdersCubit({required this.useCase}) : super(CreateOrdersInitial());

  createOrder({required OrderEntity order}) async {
    final failureOrSuccess = await useCase(OrderParams(
        amountItems: order.amountItems,
        apartamentNumber: order.apartamentNumber,
        date: order.date,
        orderOwnerName: order.orderOwnerName,
        withdrawal: order.withdrawal,
        details: order.details));

    failureOrSuccess.fold((failure) {
      emit(CreateOrdersError());
    }, (success) {
      emit(CreateOrdersSuccess());
    });
  }
}
