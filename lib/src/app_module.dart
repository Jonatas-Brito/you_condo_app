import 'package:YouCondo/src/features/auth/view/login.dart';
import 'package:YouCondo/src/features/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => LoginScreen()),
        ModuleRoute('/home', module: HomeModule())
      ];
}
