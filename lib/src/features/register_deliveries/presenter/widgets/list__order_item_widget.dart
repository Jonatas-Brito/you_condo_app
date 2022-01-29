import 'dart:io';

import 'package:flutter/material.dart';
import 'package:youcondo/core/themes/app_colors.dart';
import 'package:youcondo/src/features/register_deliveries/domain/entities/file_entity.dart';

class ListOrderItem extends StatelessWidget {
  final int index;
  final FileEntity file;
  final Animation<double> animation;
  final VoidCallback? onPressed;

  const ListOrderItem({
    Key? key,
    required this.index,
    required this.animation,
    required this.file,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: SizeTransition(
        axis: Axis.horizontal,
        key: ValueKey(file),
        sizeFactor: animation,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1),
          child: Container(
            width: 170.5,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 8,
                  top: 15,
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: AppColors.mercury,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Image.file(
                          file.file,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 3,
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: FloatingActionButton(
                      mini: true,
                      heroTag: "close$index",
                      child: Icon(
                        Icons.close_rounded,
                        size: 20,
                      ),
                      onPressed: onPressed,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
