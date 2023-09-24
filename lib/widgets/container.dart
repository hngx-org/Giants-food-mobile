// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DisplayContainer extends StatelessWidget {
  final double height;
  final double width;
  final String? count;
  final Function()? onTap;
  final String text;
  final Icon? sideIcon;
  final Widget? image;
  final bool isImageOrIcon;
  final EdgeInsetsGeometry? padding;
  const DisplayContainer({
    Key? key,
    required this.height,
    required this.width,
    this.onTap,
    required this.text,
    this.sideIcon,
    this.image,
    this.isImageOrIcon = false,
    this.count,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            count == null
                ? const SizedBox()
                : Text(
                    count ?? "",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
            count == null ? const SizedBox() : const SizedBox(width: 5),
            Container(
              child: isImageOrIcon ? image : sideIcon,
            )
          ],
        ),
      ),
    );
  }
}
