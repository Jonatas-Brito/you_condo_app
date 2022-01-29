import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:youcondo/core/components/button_component.dart';
import 'package:youcondo/core/components/text_field.dart';
import 'package:youcondo/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:youcondo/core/widgets/exchange_animation_widget.dart';
import 'package:youcondo/src/features/register_deliveries/domain/entities/file_entity.dart';
import 'package:youcondo/src/features/register_deliveries/presenter/bloc/controller_animation_order/controller_animation_cubit.dart';
import 'package:youcondo/src/features/register_deliveries/presenter/widgets/list__order_item_widget.dart';

class RegisterOrders extends StatefulWidget {
  const RegisterOrders({Key? key}) : super(key: key);

  @override
  State<RegisterOrders> createState() => _RegisterOrdersState();
}

class _RegisterOrdersState extends State<RegisterOrders>
    with TickerProviderStateMixin {
  final listKey = GlobalKey<AnimatedListState>();
  late AnimationController animationController;
  late Animation sizeAnimation;
  ImagePicker imagePicker = ImagePicker();
  List<String> downloadUrl = <String>[];
  File? file;
  late List<FileEntity> listFile = [];
  List<int> listMock = [0, 1, 2, 3, 4, 5];
  List<XFile> itemImagesList = <XFile>[];
  late XFile xImage;
  int count = 0;
  int count1 = 0;
  bool animationForward = false;
  List<String> urlImage = [];

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1200),
        reverseDuration: const Duration(milliseconds: 800));
    sizeAnimation =
        Tween<double>(begin: 0.0, end: 200.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.0, 1.0, curve: Curves.fastLinearToSlowEaseIn),
      reverseCurve: Curves.fastOutSlowIn,
    ));
    animationController.addListener(() {
      if (animationController.value > 0.99) {
      } else if (animationController.isDismissed) {}
    });
  }

  Future _listImages(ImageSource imageSource) async {
    final images = await ImagePicker().pickMultiImage();
    if (images != null) {
      itemImagesList = images;
      itemImagesList.forEach((image) {
        final pickFileImage = File(image.path);
        listFile.add(
            FileEntity(file: pickFileImage, temporaryId: listFile.length + 1));
      });
      await Future.delayed(const Duration(milliseconds: 500));
      animationController.forward();
      Modular.get<ControllerAnimationCubit>().isForward(isForward: true);

      // putData(await pickedFile.readAsBytes(),
      //     SettableMetadata(contentType: 'image/jpeg'));
      // putFile(pickedFile.readAsBytes());
    }
  }

  Future _imageUpdate(ImageSource imageSource) async {
    final image = await ImagePicker().pickImage(source: imageSource);
    if (image != null) {
      xImage = image;
      final pickImage = File(xImage.path);
      count++;
      final ref = FirebaseStorage.instance
          .ref()
          .child("vehicles")
          .child("vehicle$count" + ".jpg");
      await ref.putFile(pickImage);
      urlImage.add(await ref.getDownloadURL());

      print(urlImage[0]);

      setState(() {});
    }
  }

  Future _uploadImages() async {
    listFile.forEach((file) async {
      count++;
      final ref = FirebaseStorage.instance
          .ref()
          .child("vehicles")
          .child("vehicle$count" + ".jpg");
      await ref.putFile(
        file.file,
        SettableMetadata(
          contentType: 'image/jpeg',
        ),
      );
      urlImage.add(await ref.getDownloadURL());
    });
  }

  split(String path) {
    String _path = path.split("/").last;
    print("========== $_path =============");
    return _path;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            splashRadius: 25.0,
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.brown,
            ),
            onPressed: () => Modular.to.pop(),
          ),
          centerTitle: true,
          title: Text(
            "Cadastrar encomenda",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColors.brown,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Container(
          height: double.infinity,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: size.height * .6,
                  decoration: BoxDecoration(
                    color: AppColors.purple,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      "Remetente",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.brown,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 16),
                    AppTextField(),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Número do apartamento",
                                maxLines: 2,
                                strutStyle: StrutStyle(
                                    forceStrutHeight: true, height: 1.5),
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.brown,
                                  fontSize: 22,
                                ),
                              ),
                              const SizedBox(height: 15),
                              SizedBox(width: 155, child: AppTextField()),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Número de itens",
                                maxLines: 2,
                                strutStyle: StrutStyle(
                                    forceStrutHeight: true, height: 1.5),
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.brown,
                                  fontSize: 22,
                                ),
                              ),
                              const SizedBox(height: 15),
                              SizedBox(width: 125, child: AppTextField()),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Data",
                            maxLines: 2,
                            strutStyle:
                                StrutStyle(forceStrutHeight: true, height: 1.5),
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.brown,
                                fontSize: 22),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(width: 155, child: AppTextField()),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    // Container(
                    //   height: 200,
                    //   child: AnimatedList(
                    //       key: listKey,
                    //       scrollDirection: Axis.horizontal,
                    //       initialItemCount: listMock.length,
                    //       itemBuilder: (context, index, animation) {
                    //         final mock = listMock[index];
                    //         return ListOrderItem(
                    //           index: index,
                    //           animation: animation,
                    //           file: mock,
                    //           onPressed: () => removeItem(index),
                    //         );
                    //       }),
                    // ),
                    BlocBuilder<ControllerAnimationCubit,
                        ControllerAnimationState>(
                      bloc: Modular.get<ControllerAnimationCubit>(),
                      builder: (context, state) {
                        if (state is ControllerAnimationReturned) {
                          animationForward = state.isForward;
                          log("============================= Dentro $animationForward  =============================");
                        }

                        return AnimatedBuilder(
                            animation: animationController,
                            builder: (context, snapshot) {
                              return ExchangeAnimationFade(
                                animationForward: animationForward,
                                firstWidget:
                                    SizedBox(height: sizeAnimation.value),
                                secondWidget: SizedBox(
                                  height: sizeAnimation.value,
                                  child: AnimatedList(
                                      key: listKey,
                                      scrollDirection: Axis.horizontal,
                                      initialItemCount: listFile.length,
                                      itemBuilder: (context, index, animation) {
                                        FileEntity file = listFile[index];
                                        return ListOrderItem(
                                          index: index,
                                          animation: animation,
                                          file: file,
                                          onPressed: () => removeItem(index),
                                        );
                                      }),
                                ),
                              );
                            });
                      },
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      child: ElevatedButtonComponent(
                        backgroundColor: AppColors.purple,
                        label: 'Adicionar imagens',
                        elevation: 3,
                        fontColor: AppColors.white,
                        onPressed: () async {
                          _listImages(ImageSource.gallery);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      child: ElevatedButtonComponent(
                        label: 'Cadastrar',
                        elevation: 3,
                        fontColor: AppColors.white,
                        onPressed: () async {
                          _uploadImages();
                          // Modular.get<CreateOrdersCubit>().createOrder(
                          //     order: OrderEntity(
                          //         amountItems: 2,
                          //         orderOwnerName: "Luana",
                          //         apartamentNumber: "43",
                          //         date: DateTime.now().toString(),
                          //         details: "",
                          //         withdrawal: false));
                        },
                      ),
                    ),
                    SizedBox(
                      height: 350,
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void removeItem(int index) async {
    final removedItem = listFile[index];
    listFile.removeAt(index);
    listKey.currentState!.removeItem(
        index,
        (context, animation) => ListOrderItem(
            index: index, animation: animation, file: removedItem),
        duration: Duration(milliseconds: 500));
    if (listFile.isEmpty) {
      log("reverse 1: $animationForward");

      Modular.get<ControllerAnimationCubit>().isForward(isForward: false);
      await Future.delayed(const Duration(milliseconds: 200));
      count = 0;
      animationController.reverse();
      log("reverse 2: $animationForward");
    }
  }
}
