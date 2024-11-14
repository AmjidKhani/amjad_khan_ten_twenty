import 'package:amjad_khan_ten_twenty/view/utils/common_widgets/app_text_widget.dart';
import 'package:amjad_khan_ten_twenty/view/utils/constants/static_strings/string.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Center(child: AppText(text: Strings.dashboard))],
      ),
    );
  }
}
