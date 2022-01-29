import 'package:youcondo/core/errors/exceptions.dart';
import 'package:youcondo/src/features/register_deliveries/data/datasources/deliveries_datasource.dart';
import 'package:youcondo/src/features/register_deliveries/domain/entities/order_entity.dart';
import 'package:youcondo/core/response_void/response_void.dart';
import 'package:youcondo/core/errors/failures.dart';
import 'package:youcondo/src/features/register_deliveries/domain/repositories/delivery_repository.dart';
import 'package:dartz/dartz.dart';

class DeliverieRepositoryImpl extends DeliverieRepository {
  final DeliveriesDataSourceImpl deliveriesDataSource;
  DeliverieRepositoryImpl({required this.deliveriesDataSource});
  @override
  Future<Either<Failure, VoidSuccess>> create(
      {required String apartamentNumber,
      required String orderOwnerName,
      required int amountItems,
      required bool withdrawal,
      required String details,
      required String date}) async {
    try {
      return Right(await deliveriesDataSource.create(
          apartamentNumber: apartamentNumber,
          orderOwnerName: orderOwnerName,
          amountItems: amountItems,
          withdrawal: withdrawal,
          details: details,
          date: date));
    } on CreateException {
      return Left(CreateFailure());
    }
  }

  @override
  Future<Either<Failure, VoidSuccess>> delete({required String id}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<OrderEntity>>> read() {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, VoidSuccess>> update(
      {required String id,
      required String apartamentNumber,
      required String orderOwnerName,
      required int amountItems,
      required bool withdrawal,
      required String details,
      required String date}) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
