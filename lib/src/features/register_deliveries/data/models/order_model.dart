import 'dart:convert';

import 'package:youcondo/src/features/register_deliveries/domain/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  final String? idModel;
  final String apartamentNumberModel;
  final String orderOwnerNameModel;
  final int amountItemsModel;
  final bool withdrawalModel;
  final String detailsModel;
  final String dateModel;

  OrderModel({
    this.idModel,
    required this.apartamentNumberModel,
    required this.orderOwnerNameModel,
    required this.amountItemsModel,
    required this.withdrawalModel,
    required this.detailsModel,
    required this.dateModel,
  }) : super(
          id: idModel,
          apartamentNumber: apartamentNumberModel,
          orderOwnerName: orderOwnerNameModel,
          amountItems: amountItemsModel,
          withdrawal: withdrawalModel,
          details: detailsModel,
          date: dateModel,
        );

  Map<String, dynamic> toMap() {
    return {
      '?idModel': idModel,
      'apartamentNumberModel': apartamentNumberModel,
      'orderOwnerNameModel': orderOwnerNameModel,
      'amountItemsModel': amountItemsModel,
      'withdrawalModel': withdrawalModel,
      'detailsModel': detailsModel,
      'dateModel': dateModel,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      idModel: map['?idModel'] ?? '',
      apartamentNumberModel: map['apartamentNumberModel'] ?? '',
      orderOwnerNameModel: map['orderOwnerNameModel'] ?? '',
      amountItemsModel: map['amountItemsModel']?.toInt() ?? 0,
      withdrawalModel: map['withdrawalModel'] ?? false,
      detailsModel: map['detailsModel'] ?? '',
      dateModel: map['dateModel'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source));
}
