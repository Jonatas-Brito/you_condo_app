class OrderParams {
  final String? id;
  final String apartamentNumber;
  final String orderOwnerName;
  final int amountItems;
  final bool withdrawal;
  final String details;
  final String date;

  OrderParams({
    this.id,
    required this.apartamentNumber,
    required this.orderOwnerName,
    required this.amountItems,
    required this.withdrawal,
    required this.details,
    required this.date,
  });
}
