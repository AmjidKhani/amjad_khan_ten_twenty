import 'package:amjad_khan_ten_twenty/view/screens/bottom_navbar/dashboard_screen.dart';
import 'package:amjad_khan_ten_twenty/view/screens/bottom_navbar/media_library_screen.dart';
import 'package:amjad_khan_ten_twenty/view/screens/bottom_navbar/more_screen.dart';
import 'package:amjad_khan_ten_twenty/view/screens/bottom_navbar/watch_movie_screen.dart';
import 'package:amjad_khan_ten_twenty/view/screens/get_movie_ticket_screen.dart';
import 'package:amjad_khan_ten_twenty/view/screens/home_screen.dart';
import 'package:amjad_khan_ten_twenty/view/screens/movie_detail_screen.dart';
import 'package:amjad_khan_ten_twenty/view/screens/movie_play_screen.dart';
import 'package:amjad_khan_ten_twenty/view/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';

class MyRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case dashboardScreen:
        return MaterialPageRoute(builder: (context) => const DashBoardScreen());
      case watchMovieScreen:
        return MaterialPageRoute(
            builder: (context) => const WatchMovieScreen());
      case mediaLibraryScreen:
        return MaterialPageRoute(
            builder: (context) => const MediaLibraryScreen());
      case moreScreen:
        return MaterialPageRoute(builder: (context) => const MoreScreen());

      case getTicketScreen:
        return MaterialPageRoute(builder: (context) => const GetMovieTicket());

      default:
        return MaterialPageRoute(builder: (context) => HomeScreen());
    }
  }
}
