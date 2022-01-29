import 'package:youcondo/src/features/auth/view/login.dart';
import 'package:youcondo/src/features/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'features/register_deliveries/deliviries_modules.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => LoginScreen()),
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/register_deliveries', module: RegisterDeliveriesModule()),
      ];
}
