import 'package:youcondo/core/errors/exceptions.dart';
import 'package:youcondo/core/response_void/response_void.dart';
import 'package:youcondo/src/features/register_deliveries/data/models/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DeliveriesDataSource {
  Future<VoidSuccess> create({
    required String apartamentNumber,
    required String orderOwnerName,
    required int amountItems,
    required bool withdrawal,
    required String details,
    required String date,
  });

  Future<List<OrderModel>> read();

  Future<VoidSuccess> update({
    required String id,
    required String apartamentNumber,
    required String orderOwnerName,
    required int amountItems,
    required bool withdrawal,
    required String details,
    required String date,
  });

  Future<VoidSuccess> delete(String id);
}

class DeliveriesDataSourceImpl extends DeliveriesDataSource {
  FirebaseFirestore firestore;
  DeliveriesDataSourceImpl({required this.firestore});

  @override
  Future<VoidSuccess> create(
      {required String apartamentNumber,
      required String orderOwnerName,
      required int amountItems,
      required bool withdrawal,
      required String details,
      required String date}) async {
    try {
      Map<String, dynamic> map = {
        "apartamentNumber": apartamentNumber,
        "orderOwnerName": orderOwnerName,
        "amountItems": amountItems,
        "withdrawal": withdrawal,
        "details": details,
        "date": date,
      };
      await firestore.collection("orders").add(map);
      return Future.value(VoidSuccess());
    } catch (e) {
      throw CreateException();
    }
  }

  @override
  Future<VoidSuccess> delete(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List<OrderModel>> read() {
    throw UnimplementedError();
  }

  @override
  Future<VoidSuccess> update(
      {required String id,
      required String apartamentNumber,
      required String orderOwnerName,
      required int amountItems,
      required bool withdrawal,
      required String details,
      required String date}) {
    throw UnimplementedError();
  }
}
