import 'package:youcondo/core/errors/failures.dart';
import 'package:youcondo/core/usecase/usecase.dart';
import 'package:youcondo/src/features/register_deliveries/domain/entities/order_entity.dart';
import 'package:youcondo/src/features/register_deliveries/domain/repositories/delivery_repository.dart';
import 'package:dartz/dartz.dart';

class ReadOrdersUseCase implements UseCase<List<OrderEntity>, NoParams> {
  final DeliverieRepository deliverieRepository;
  const ReadOrdersUseCase({required this.deliverieRepository});
  @override
  Future<Either<Failure, List<OrderEntity>>> call(params) async {
    return await deliverieRepository.read();
  }
}
