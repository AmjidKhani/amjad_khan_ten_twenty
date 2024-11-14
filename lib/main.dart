import 'package:amjad_khan_ten_twenty/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'controllers/get_allmovies_controller/get_all_movies_controller.dart';
import 'controllers/get_movie_details_controller/get_movie_deatil_controller.dart';
import 'controllers/home_controller/home_controller.dart';

void main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 752),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => GetAllMoviesController()),
              ChangeNotifierProvider(create: (_) => HomeController()),
              ChangeNotifierProvider(
                  create: (_) => GetMoviesDetailController()),
            ],
            child: MaterialApp(
              title: 'Ten Twenty Task',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: HomeScreen(),
            ),
          );
        });
  }
}
