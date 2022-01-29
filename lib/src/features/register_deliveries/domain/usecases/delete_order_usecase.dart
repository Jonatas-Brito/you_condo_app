import 'package:youcondo/core/errors/failures.dart';
import 'package:youcondo/core/response_void/response_void.dart';
import 'package:youcondo/core/usecase/usecase.dart';
import 'package:youcondo/src/features/register_deliveries/domain/repositories/delivery_repository.dart';
import 'package:dartz/dartz.dart';

class DeleteOrderUseCase implements UseCase<VoidSuccess, String> {
  final DeliverieRepository deliverieRepository;
  const DeleteOrderUseCase({required this.deliverieRepository});
  @override
  Future<Either<Failure, VoidSuccess>> call(String id) async {
    return await deliverieRepository.delete(id: id);
  }
}
