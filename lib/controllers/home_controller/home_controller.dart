import 'package:amjad_khan_ten_twenty/view/screens/bottom_navbar/dashboard_screen.dart';
import 'package:amjad_khan_ten_twenty/view/screens/bottom_navbar/media_library_screen.dart';
import 'package:amjad_khan_ten_twenty/view/screens/bottom_navbar/more_screen.dart';
import 'package:amjad_khan_ten_twenty/view/screens/bottom_navbar/watch_movie_screen.dart';
import 'package:amjad_khan_ten_twenty/view/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';

class HomeController with ChangeNotifier {
  final screens = [
    const DashBoardScreen(),
    const WatchMovieScreen(),
    const MediaLibraryScreen(),
    const MoreScreen(),
  ];
  var currentTab = CurrentTab.watch;
  changeCurrentTab(CurrentTab tab) {
    currentTab = tab;
    notifyListeners();
  }

  var tabIndex = 1;
  changeIndex(int index) {
    tabIndex = index;
    notifyListeners();
  }
}
