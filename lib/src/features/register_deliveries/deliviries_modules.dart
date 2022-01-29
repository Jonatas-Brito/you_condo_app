import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:youcondo/src/features/register_deliveries/data/repositories/delivery_repository_impl.dart';
import 'package:youcondo/src/features/register_deliveries/domain/usecases/create_order_usecase.dart';
import 'package:youcondo/src/features/register_deliveries/presenter/bloc/controller_animation_order/controller_animation_cubit.dart';
import 'package:youcondo/src/features/register_deliveries/presenter/bloc/create_orders/create_orders_cubit.dart';
import 'package:youcondo/src/features/register_deliveries/presenter/pages/register_order_page.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasources/deliveries_datasource.dart';
import 'presenter/pages/update_image_page.dart';

class RegisterDeliveriesModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => FirebaseFirestore.instance),
        Bind.factory((i) => DeliveriesDataSourceImpl(firestore: i())),
        Bind.factory((i) => DeliverieRepositoryImpl(deliveriesDataSource: i())),
        Bind.factory((i) => CreateOrderUseCase(deliverieRepository: i())),
        Bind.factory((i) => DeliveriesDataSourceImpl(firestore: i())),
        Bind.singleton((i) => CreateOrdersCubit(useCase: i())),
        Bind.singleton((i) => ControllerAnimationCubit()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (context, args) => RegisterOrders()),
        ChildRoute("/upload", child: (context, args) => UploadPage()),
      ];
}
