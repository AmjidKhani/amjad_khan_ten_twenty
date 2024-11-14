import 'package:amjad_khan_ten_twenty/view/utils/common_widgets/app_text_widget.dart';
import 'package:amjad_khan_ten_twenty/view/utils/constants/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final double? paddingTop;
  final double? paddingBottom;
  final double? margin;
  final double? borderRadius;
  final Color? shadowColor;
  final Color? buttonColor;
  final Color? borderColor;
  final double? blurRadius;
  final double? width;
  final double? height;
  final double? drawableMargin;
  final VoidCallback? onPressed;
  final Color? textColor;
  final dynamic drawableLeft;
  final dynamic textSize;

  const AppButton(
      {super.key,
      required this.text,
      this.style,
      this.paddingTop,
      this.paddingBottom,
      this.margin,
      this.width,
      this.height,
      this.drawableLeft,
      this.blurRadius,
      this.drawableMargin,
      this.shadowColor,
      this.textColor,
      this.buttonColor,
      this.borderColor,
      this.onPressed,
      this.borderRadius,
      this.textSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.translucent,
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor ?? mainButtonColor,
          shape: BoxShape.rectangle,
          border: Border.all(
              width: 0.0.w,
              color: (borderColor ?? buttonColor ?? mainButtonColor)),
          borderRadius: BorderRadius.all(
            Radius.circular(
              borderRadius ?? 12.r,
            ),
          ),
        ),
        width: width ?? MediaQuery.of(context).size.width,
        height: height ?? 52,
        margin: EdgeInsets.symmetric(horizontal: margin ?? 30),
        padding: EdgeInsets.only(
            top: paddingTop ?? 5,
            bottom: paddingBottom ?? 5,
            left: 0,
            right: 0),
        child: Center(
          child: drawableLeft == null
              ? getText()
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    drawableLeft,
                    SizedBox(
                      width: drawableMargin ?? 0,
                    ),
                    getText()
                  ],
                ),
        ),
      ),
    );
  }

  Widget getText() {
    return AppText(
      text: text,
      textAlign: TextAlign.center,
      textSize: textSize ?? 14.0,
      color: textColor ?? Colors.white,
      lineHeight: 0,
      // fontFamily: Strings.FONT_FAMILY_MONTSERRAT,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.4,
    );
  }
}
