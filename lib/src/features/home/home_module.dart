import 'package:YouCondo/src/features/navigation/navigation.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => NavigationScreen(
                  scheduling: args.data,
                )),
        // ChildRoute('/search',
        //     child: (context, args) => SearchScreen(scheduling: args.data)),
      ];
}
