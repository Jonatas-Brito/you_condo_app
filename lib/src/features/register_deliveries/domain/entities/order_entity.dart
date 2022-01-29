import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final String? id;
  final String apartamentNumber;
  final String orderOwnerName;
  final int amountItems;
  final bool withdrawal;
  final String details;
  final String date;

  OrderEntity({
    this.id,
    required this.apartamentNumber,
    required this.orderOwnerName,
    required this.amountItems,
    required this.withdrawal,
    required this.details,
    required this.date,
  });

  @override
  List<Object?> get props => [
        apartamentNumber,
        orderOwnerName,
        amountItems,
        withdrawal,
        details,
        date,
      ];
}
