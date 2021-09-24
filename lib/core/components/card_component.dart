// import 'package:flutter/material.dart';
// import 'package:YouCondo/srs/themes/app_colors.dart';

// class CardComponent extends StatelessWidget {
//   final Widget icon;
//   final String label;
//   const CardComponent({Key? key, required this.label, required this.icon})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Container(
//       height: size.height * 0.12,
//       decoration: BoxDecoration(
//           color: AppColors.mercury,
//           borderRadius: BorderRadius.circular(20),
//           boxShadow: [
//             BoxShadow(
//                 color: Colors.black26,
//                 spreadRadius: 2,
//                 blurRadius: 3,
//                 offset: Offset(0, 3))
//           ]),
//       child: Padding(
//         padding: const EdgeInsets.only(left: 30, right: 10),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             icon,
//             Container(
//               width: size.width * 0.6,
//               child: Text(
//                 label,
//                 style: Theme.of(context)
//                     .textTheme
//                     .bodyText1!
//                     .copyWith(color: AppColors.heavyMetal, fontSize: 20),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:YouCondo/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'button_component.dart';

class CardComponent extends StatelessWidget {
  final Widget icon;
  final String label;
  final VoidCallback? onPressed;
  const CardComponent(
      {Key? key, this.onPressed, required this.label, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(size.width);
    return ElevatedButtonComponent(
      elevation: 5,
      padding: size.width < 365
          ? EdgeInsets.only(left: 5, right: 5, top: 30, bottom: 30)
          : EdgeInsets.only(left: 30, right: 10, top: 30, bottom: 30),
      backgroundColor: AppColors.springWood,
      onPressed: onPressed,
      // decoration: BoxDecoration(
      //     color: AppColors.mercury,
      //     borderRadius: BorderRadius.circular(20),
      //     boxShadow: [
      //       BoxShadow(
      //           color: Colors.black26,
      //           spreadRadius: 2,
      //           blurRadius: 3,
      //           offset: Offset(0, 3))
      //     ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          icon,
          Container(
            width: size.width * 0.6,
            child: Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: AppColors.brown, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
