import 'package:youcondo/core/errors/failures.dart';
import 'package:youcondo/core/response_void/response_void.dart';
import 'package:youcondo/core/usecase/usecase.dart';
import 'package:youcondo/src/features/register_deliveries/domain/repositories/delivery_repository.dart';
import 'package:youcondo/src/features/register_deliveries/domain/usecases/params/order_params.dart';
import 'package:dartz/dartz.dart';

class UpdateOrderUseCase implements UseCase<VoidSuccess, OrderParams> {
  final DeliverieRepository deliverieRepository;
  const UpdateOrderUseCase({required this.deliverieRepository});

  @override
  Future<Either<Failure, VoidSuccess>> call(OrderParams params) async {
    return await deliverieRepository.update(
        id: params.id!,
        apartamentNumber: params.apartamentNumber,
        orderOwnerName: params.orderOwnerName,
        amountItems: params.amountItems,
        withdrawal: params.withdrawal,
        details: params.details,
        date: params.date);
  }
}
