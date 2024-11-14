import 'package:amjad_khan_ten_twenty/view/utils/constants/app_colors/app_colors.dart';
import 'package:amjad_khan_ten_twenty/view/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'app_text_widget.dart';

class BottomBarWidget extends StatelessWidget {
  final VoidCallback? onPressed;

  final String? imageName;
  final bool? isCurrentTab;
  final String? tabName;

  const BottomBarWidget(
      {super.key,
      this.onPressed,
      this.imageName,
      this.isCurrentTab,
      this.tabName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onPressed,
      child: Container(
        height: 42.h,
        width: 85.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
                color: isCurrentTab == true ? white : textLightBlack,
                width: 18.0.w,
                height: 18.0.h,
                fit: BoxFit.fitHeight,
                imageName ?? ""),
            10.pixelH,
            AppText(
              text: tabName ?? "",
              color: isCurrentTab ?? false ? white : navLightTextColor,
              textSize: 11.sp,
              textAlign: TextAlign.center,
              maxlines: 1,
              fontWeight:
                  isCurrentTab ?? false ? FontWeight.w600 : FontWeight.normal,
            ),
          ],
        ),
      ),
    );
  }
}
