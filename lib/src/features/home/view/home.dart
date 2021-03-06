import 'package:YouCondo/core/components/card_component.dart';
import 'package:YouCondo/core/database/database.dart';
import 'package:YouCondo/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Database db;

  @override
  void initState() {
    super.initState();
    initialise();
  }

  initialise() {
    db = Database();
    db.initialiase();
    db.read().then((value) => {print("DB: $value")});
  }

  Widget _logoText(BuildContext context, {String? text}) {
    return Text(
      text!,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
            fontSize: 28,
            color: Colors.black,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: AppDrawer(),
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        title: _logoText(context, text: 'YouCondo'),
        backgroundColor: AppColors.purple,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.purple,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(150))),
            height: size.height * 0.45,
          ),
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: _logoText(context, text: 'Olá, Brito!'),
              ),
              Divider(
                height: 35,
                thickness: 0.3,
                color: AppColors.white,
              ),
              SizedBox(height: 50),
              CardComponent(
                onPressed: () {
                  db.create(name: "Estados Unidos", code: "EUA");
                },
                label: 'Cadastrar encomenda',
                icon: SvgPicture.asset(
                  'assets/icons/folder.svg',
                  color: AppColors.caramel,
                  height: 30,
                ),
              ),
              SizedBox(height: 40),
              CardComponent(
                label: 'Cadastrar morador',
                icon: SvgPicture.asset(
                  'assets/icons/person.svg',
                  height: 30,
                  color: AppColors.caramel,
                ),
              ),
              SizedBox(height: 40),
              CardComponent(
                label: 'Publicar aviso',
                icon: SvgPicture.asset(
                  'assets/icons/alert-box.svg',
                  color: AppColors.caramel,
                  height: 30,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
