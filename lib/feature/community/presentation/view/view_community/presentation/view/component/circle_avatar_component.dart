import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

///
/// ---------- Parent ----------
///

typedef OnTabCallBack = Function();

class CircleAvatarComponent extends StatelessWidget {
  // Vars
  final String? url;
  final String? path;
  final File? file;
  final String type;
  final IconData iconData;
  final double iconSize;
  final Color iconColor;
  final double backgroundSize;
  final Color backgroundColor;
  final double? borderSize;
  final OnTabCallBack onTap;
  final double? width;
  final double? height;
  final double? borderWidth;
  final Color? borderColor;
  final Widget placeHolder;

  // Constructor
  const CircleAvatarComponent({
    super.key,
    required this.url,
    required this.path,
    required this.file,
    required this.type,
    required this.iconData,
    required this.iconSize,
    required this.iconColor,
    required this.backgroundSize,
    required this.backgroundColor,
    required this.borderSize,
    required this.borderColor,
    required this.borderWidth,
    required this.onTap,
    required this.placeHolder,
    this.width,
    this.height,
  });

  // Tree
  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: borderColor ?? Colors.transparent,
              width: borderWidth ?? 0,
            ),
          ),
          child: CircleAvatar(
            radius: backgroundSize,
            backgroundColor: backgroundColor,
            child:
                CircleAvatar(
              radius: borderSize,
              backgroundColor: borderColor,
              child: imageTypeComponent(
                url: url,
                path: path,
                file: file,
                type: type,
                width: width,
                height: height,
                placeHolder: placeHolder,
              ), // Border radius
            )

          ),
        ),
      );
  }
}

Widget imageTypeComponent({
  required String? url,
  required String? path,
  required File? file,
  required String type,
  required Widget placeHolder,
   double? width,
   double? height,
  bool isCircle = true,
}) {
  return isCircle
      ? ClipOval(
          child: (type == 'network')

                  ? CachedNetworkImage(
            imageUrl: url ?? '',
            cacheKey: url,
            fadeInDuration: const Duration(milliseconds: 500), // Add a fade-in effect
            fadeOutDuration: const Duration(milliseconds: 500), // Add a fade-out effect
            fit: BoxFit.cover,
            width: width?? double.infinity,
            height: height?? double.infinity,
            placeholder: (context, url) =>  placeHolder,
            errorWidget: (context, url, error) => placeHolder,
          )
              : (type == 'asset')
                  ? (path != null)
                      ? Image.asset(path,
                          fit: BoxFit.cover,
            width: width?? double.infinity,
            height: height?? double.infinity,
          )
                      : null
                  : (type == 'file')
                      ? (file != null)
                          ? Image.file(
                              file,
                              fit: BoxFit.cover,
            width: width?? double.infinity,
            height: height?? double.infinity,
                            )
                          : null
                      : null,
        )
      : Image.file(
          file!,
          fit: BoxFit.cover,
    width: width?? double.infinity,
    height: height?? double.infinity,
        );
}
