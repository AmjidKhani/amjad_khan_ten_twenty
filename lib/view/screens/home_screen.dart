import 'package:amjad_khan_ten_twenty/controllers/get_allmovies_controller/get_all_movies_controller.dart';
import 'package:amjad_khan_ten_twenty/controllers/home_controller/home_controller.dart';
import 'package:amjad_khan_ten_twenty/view/utils/common_widgets/navbar_widget.dart';
import 'package:amjad_khan_ten_twenty/view/utils/constants/app_colors/app_colors.dart';
import 'package:amjad_khan_ten_twenty/view/utils/constants/assets/app_assets.dart';
import 'package:amjad_khan_ten_twenty/view/utils/constants/static_strings/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

enum CurrentTab { dashboard, watch, mediaLibrary, more, none }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final controller =
          Provider.of<GetAllMoviesController>(context, listen: false);
      controller.getAllMovies();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar:
            SafeArea(child: _buildBottomNavigationBar(context)),
        body: Consumer<HomeController>(
          builder:
              (BuildContext context, HomeController controller, Widget? child) {
            return controller.screens[controller.tabIndex];
          },
        ));
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Consumer<HomeController>(
      builder: (BuildContext context, controller, Widget? child) {
        return Container(
            height: 70.h,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: navbarColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35.r),
                topRight: Radius.circular(35.r),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x294e4e4e),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.sizeOf(context).width * 0.02),
                  child: _buildBottomBarWidget(
                      onPressed: () {
                        controller.changeCurrentTab(CurrentTab.dashboard);
                        controller.changeIndex(0);
                      },
                      isCurrentTab:
                          controller.currentTab == CurrentTab.dashboard,
                      imageName: Assets.dashboardImage,
                      tabName: Strings.dashboard),
                ),
                _buildBottomBarWidget(
                  onPressed: () {
                    controller.changeCurrentTab(CurrentTab.watch);
                    controller.changeIndex(1);
                  },
                  isCurrentTab: controller.currentTab == CurrentTab.watch,
                  imageName: Assets.watchImage,
                  tabName: Strings.watch,
                ),
                _buildBottomBarWidget(
                    onPressed: () {
                      controller.changeCurrentTab(CurrentTab.mediaLibrary);
                      controller.changeIndex(2);
                    },
                    isCurrentTab:
                        controller.currentTab == CurrentTab.mediaLibrary,
                    imageName: Assets.mediaLibraryImage,
                    tabName: Strings.mediaLibrary),
                _buildBottomBarWidget(
                    onPressed: () {
                      controller.changeCurrentTab(CurrentTab.more);
                      controller.changeIndex(3);
                    },
                    isCurrentTab: controller.currentTab == CurrentTab.more,
                    imageName: Assets.moreImage,
                    tabName: Strings.more),
              ],
            ));
      },
    );
  }

  Widget _buildBottomBarWidget(
      {required VoidCallback onPressed,
      required bool isCurrentTab,
      required String imageName,
      required String tabName}) {
    return BottomBarWidget(
      onPressed: onPressed,
      isCurrentTab: isCurrentTab,
      imageName: imageName,
      tabName: tabName,
    );
  }
}
