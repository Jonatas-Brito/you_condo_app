import 'package:youcondo/core/errors/failures.dart';
import 'package:youcondo/core/response_void/response_void.dart';
import 'package:youcondo/src/features/register_deliveries/domain/entities/order_entity.dart';
import 'package:dartz/dartz.dart';

abstract class DeliverieRepository {
  Future<Either<Failure, VoidSuccess>> create({
    required String apartamentNumber,
    required String orderOwnerName,
    required int amountItems,
    required bool withdrawal,
    required String details,
    required String date,
  });

  Future<Either<Failure, List<OrderEntity>>> read();

  Future<Either<Failure, VoidSuccess>> update({
    required String id,
    required String apartamentNumber,
    required String orderOwnerName,
    required int amountItems,
    required bool withdrawal,
    required String details,
    required String date,
  });

  Future<Either<Failure, VoidSuccess>> delete({required String id});
}
