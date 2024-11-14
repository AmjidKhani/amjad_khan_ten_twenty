import 'dart:developer';

import 'package:amjad_khan_ten_twenty/controllers/get_allmovies_controller/get_all_movies_controller.dart';
import 'package:amjad_khan_ten_twenty/view/screens/movie_detail_screen.dart';
import 'package:amjad_khan_ten_twenty/view/utils/common_widgets/app_text_widget.dart';
import 'package:amjad_khan_ten_twenty/view/utils/constants/app_colors/app_colors.dart';
import 'package:amjad_khan_ten_twenty/view/utils/constants/static_strings/string.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class WatchMovieScreen extends StatelessWidget {
  const WatchMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dimBackgroundColor.withOpacity(0.3),
      appBar: AppBar(
        title: AppText(
          text: Strings.watch,
          textSize: 16.sp,
          color: lightTextColor,
          fontWeight: FontWeight.w400,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 14.0.w),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.search,
                size: 25.sp,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<GetAllMoviesController>(
            builder: (BuildContext context, controller, Widget? child) {
              return controller.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: navbarColor,
                    ))
                  : controller.upComingMovies.isEmpty
                      ? Center(
                          child: AppText(
                          text: "No Movies Found",
                          fontWeight: FontWeight.w500,
                          textSize: 16.sp,
                        ))
                      : Expanded(
                          child: ListView.builder(
                              itemCount: controller.upComingMovies.length,
                              itemBuilder: (context, index) {
                                var snap = controller.upComingMovies[index];
                                log("Poster Image ==${snap.posterPath}");
                                return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MovieDetailScreen(
                                                    movieId:
                                                        snap.id.toString() ??
                                                            "",
                                                  )));
                                    },
                                    child:
                                        movieCard(snap.posterPath, snap.title));
                              }),
                        );
            },
          )
        ],
      ),
    );
  }

  Widget movieCard(final String imageUrl, final String title) {
    return Container(
      margin: EdgeInsets.only(
          left: 16.0.w, right: 16.0.w, top: 18.0.h, bottom: 3.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0.r),
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200.h,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            // Black gradient overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
              ),
            ),
            // Movie title text
            Positioned(
              bottom: 16.0.h,
              left: 16.0.w,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
