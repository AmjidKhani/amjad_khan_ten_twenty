import 'package:amjad_khan_ten_twenty/view/utils/common_widgets/app_button_widget/app_filled_button.dart';
import 'package:amjad_khan_ten_twenty/view/utils/constants/app_colors/app_colors.dart';
import 'package:amjad_khan_ten_twenty/view/utils/extensions/extensions.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:amjad_khan_ten_twenty/controllers/get_movie_details_controller/get_movie_deatil_controller.dart';

import 'movie_play_screen.dart';

class MovieDetailScreen extends StatefulWidget {
  final String movieId;

  const MovieDetailScreen({Key? key, required this.movieId}) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final controller =
          Provider.of<GetMoviesDetailController>(context, listen: false);
      controller.getMovieDetail(widget.movieId);
    });
  }

  final List<Color> chipColors = [
    chipColor1,
    chipColor2,
    chipColor3,
    chipColor4
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<GetMoviesDetailController>(
        builder: (context, controller, child) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final movieDetail = controller.movieDetail;
          if (movieDetail == null) {
            return const Center(child: Text("Movie details not available"));
          }

          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          'https://image.tmdb.org/t/p/w500${movieDetail.backdropPath}',
                          height: 400,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          height: 300,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.6),
                                Colors.transparent,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 40,
                          left: 16,
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios_rounded,
                                  color: Colors.white,
                                  size: 19.sp,
                                ),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              const Text(
                                "Watch",
                                style: TextStyle(
                                  color: white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 16,
                          right: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Text(
                              //   movieDetail.title,
                              //   style: const TextStyle(
                              //     color: Colors.white,
                              //     fontSize: 24,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              //   textAlign: TextAlign.center,
                              // ),
                              const SizedBox(height: 10),
                              Text(
                                'In Theaters ${movieDetail.releaseDate}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 20.h),
                              AppButton(
                                text: 'Get Tickets',
                                borderRadius: 7.r,
                                onPressed: () {},
                              ),

                              SizedBox(height: 10.0.h),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 27.0.w, vertical: 0.h),
                                child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MoviePlayScreen(
                                                  movieId: widget.movieId,
                                                )));
                                  },
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7
                                          .r), // Creates a rectangle with sharp corners
                                    ),
                                    side: const BorderSide(
                                        color: mainButtonColor),
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: 50.h,
                                      // color: Colors.red,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.play_arrow,
                                            color: white,
                                          ),
                                          5.pixelW,
                                          const Text(
                                            "Watch Trailer",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16.0.w,
                        top: 20.h,
                      ),
                      child: Text(
                        "Genres",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                        child: Wrap(
                          spacing: 8.0,
                          children:
                              movieDetail.genres.asMap().entries.map((entry) {
                            final index = entry.key;
                            final genre = entry.value;
                            return Chip(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    23), // Adjust the radius for roundness
                              ),
                              label: Text(
                                genre.name,
                              ),
                              backgroundColor:
                                  chipColors[index % chipColors.length],
                              // Rotate through colors
                              labelStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                            );
                          }).toList(),
                        )),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 16.0.w,
                          right: 16.0.w,
                          top: 16.0.h,
                          bottom: 5.h),
                      child: Text(
                        "Overview",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Divider(
                        color: dinTextColor.withOpacity(0.2),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                      child: Text(
                        movieDetail.overview,
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.normal,
                            color: dinTextColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
