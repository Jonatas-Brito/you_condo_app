import 'package:YouCondo/core/components/button_component.dart';
import 'package:YouCondo/core/components/text_field.dart';
import 'package:YouCondo/core/database/database.dart';
import 'package:YouCondo/core/notification/push_notification.dart';
import 'package:YouCondo/core/themes/app_colors.dart';
import 'package:YouCondo/core/uma_variavel_ai.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _documentNumberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  PushNotificationConfigure pushNotificationConfigure =
      PushNotificationConfigure();
  late Database db;
  // FirebaseMessaging messaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    print("========== ${schedulings.status} ==========");
  }

  void _handleMessage(RemoteMessage message) {
    if (message.data['type'] == 'chat') {
      Navigator.pushNamed(
        context,
        '/chat',
        arguments: LoginScreen(),
      );
    }
  }

  // void initializerFlutterFire() async {
  //   try {
  //     await Firebase.initializeApp();
  //     setState(() {
  //       _initialized = true;
  //     });
  //   } catch (e) {
  //     _error = true;
  //   }
  // }

  Widget _logoText(BuildContext context) {
    return Center(
        child: Text(
      'YouCondo',
      style: Theme.of(context).textTheme.bodyText2!.copyWith(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.springWood,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 48, vertical: 100),
          children: [
            Container(
              height: size.height * 0.15,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: _logoText(context),
              ),
            ),
            SizedBox(height: size.height * 0.08),
            Container(
              height: size.height * 0.08,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 14,
                    right: 2,
                    left: 2,
                    child: Container(
                      height: size.height * 0.04,
                      width: size.width,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12.withOpacity(0.07),
                                blurRadius: 2,
                                spreadRadius: 2)
                          ],
                          color: Colors.transparent,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                    ),
                  ),
                  AppTextField(
                    textInputType: TextInputType.number,
                    controller: _documentNumberController,
                    inputFormatters: [
                      MaskTextInputFormatter(mask: '###.###.###-##')
                    ],
                    hintText: 'Digite apenas números',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        color: Colors.transparent,
                        width: size.width * 0.15,
                        height: size.height * 0.05,
                        child: Text(
                          'CPF',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  fontSize: 15,
                                  color: AppColors.brown,
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.035),
            Container(
              height: size.height * 0.08,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 14,
                    right: 2,
                    left: 2,
                    child: Container(
                      height: size.height * 0.04,
                      width: size.width,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12.withOpacity(0.07),
                                blurRadius: 2,
                                spreadRadius: 2)
                          ],
                          color: Colors.transparent,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                    ),
                  ),
                  AppTextField(
                    controller: _passwordController,
                    hintText: 'Insira sua Senha',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        color: Colors.transparent,
                        width: size.width * 0.15,
                        height: size.height * 0.05,
                        child: Text(
                          'Senha',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  color: AppColors.brown,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.035),
            ElevatedButtonComponent(
                label: 'Entrar',
                onPressed:
                    //   _instaceFCM();

                    //   // _dsada(RemoteMessage(data: {'da': 'ae'}));
                    // }
                    () => Modular.to.pushNamed('/home/')),
            TextButton(
              onPressed: () {},
              child: Text(
                'Esqueci minha senha',
                style: TextStyle(color: AppColors.brown),
              ),
            )
          ],
        ),
      ),
    );
  }
}
