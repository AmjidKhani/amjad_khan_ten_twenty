import 'dart:developer';

import 'package:amjad_khan_ten_twenty/controllers/get_movie_details_controller/movie_play_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class MoviePlayScreen extends StatefulWidget {
  final String movieId;
  const MoviePlayScreen({super.key, required this.movieId});

  @override
  State<MoviePlayScreen> createState() => _MoviePlayScreenState();
}

class _MoviePlayScreenState extends State<MoviePlayScreen> {
  VideoPlayerController? videoControllers;

  // Future<void> playVideo({int index = 0, bool init = false}) async {
  //   try {
  //     if (!init) {
  //       try {
  //         videoControllers?.pause();
  //         videoControllers?.dispose();
  //       } catch (e) {
  //         log("Exception===${e.toString()}");
  //       }
  //     }
  //
  //     videoControllers = VideoPlayerController.networkUrl(
  //       Uri.parse(widget.videoPath),
  //       videoPlayerOptions: VideoPlayerOptions(),
  //     )
  //       ..addListener(() {})
  //       ..setLooping(true)
  //       ..initialize().then((value) {
  //         Provider.of<MoviePlayController>(context, listen: false).isShow =
  //             true;
  //         setState(() {});
  //         videoControllers!.play();
  //       });
  //   } catch (e) {
  //     log("Exception in Detail Video Screen== ${e.toString()}");
  //   }
  // }

  @override
  void initState() {
    // playVideo(init: true);
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //
    //
    // });

    super.initState();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    videoControllers?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.green,
          centerTitle: true,
          title: Text(
            "Exercise Video",
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        body: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Consumer<MoviePlayController>(
                  builder: (BuildContext context, videoControllerState,
                      Widget? child) {
                    return Stack(
                      children: [
                        videoControllers!.value.isInitialized
                            ? Center(
                                child: GestureDetector(
                                onTap: () {
                                  videoControllerState.changeControls();
                                },
                                child: AspectRatio(
                                  aspectRatio:
                                      videoControllers!.value.aspectRatio,
                                  child: VideoPlayer(
                                    videoControllers!,
                                  ),
                                ),
                              ))
                            : const Center(
                                child: CircularProgressIndicator(
                                backgroundColor: Colors.green,
                                color: Colors.grey,
                              )),
                        videoControllerState.isShow
                            ? Positioned(
                                bottom: 0,
                                right: 0,
                                left: 0,
                                top: 0,
                                child: Visibility(
                                  visible:
                                      videoControllerState.isShowHideControls,
                                  child: SizedBox(
                                    height: 60.h,
                                    width: double.maxFinite,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 8.0.h),
                                          child: Container(
                                            height: 40.h,
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ValueListenableBuilder(
                                                    valueListenable:
                                                        videoControllers!,
                                                    builder: (context,
                                                        VideoPlayerValue value,
                                                        child) {
                                                      return Text(
                                                        _formatDuration(
                                                            value.position),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14.sp),
                                                      );
                                                    }),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 4.0.h),
                                                  child: SizedBox(
                                                    height: 7.h,
                                                    width: 230.w,
                                                    child:
                                                        ValueListenableBuilder(
                                                      valueListenable:
                                                          videoControllers!,
                                                      builder: (context, value,
                                                          child) {
                                                        return videoControllers!
                                                                .value
                                                                .isInitialized
                                                            ? VideoProgressIndicator(
                                                                videoControllers!,
                                                                allowScrubbing:
                                                                    true,
                                                                colors:
                                                                    const VideoProgressColors(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white,
                                                                  playedColor:
                                                                      Color(
                                                                          0xff097953),
                                                                ),
                                                                padding:
                                                                    EdgeInsets
                                                                        .only(
                                                                  top: 0.h,
                                                                  left: 12.w,
                                                                  right: 12.w,
                                                                ),
                                                              )
                                                            : const SizedBox();
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                ValueListenableBuilder(
                                                  valueListenable:
                                                      videoControllers!,
                                                  builder: (BuildContext
                                                          context,
                                                      VideoPlayerValue value,
                                                      Widget? child) {
                                                    return Text(
                                                      _formatDuration(
                                                          videoControllers!
                                                              .value.duration),
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14.sp),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 48.h,
                                          width: double.maxFinite,
                                          color: Colors.black.withOpacity(0.5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    videoControllers!.seekTo(Duration(
                                                        seconds:
                                                            videoControllers!
                                                                    .value
                                                                    .position
                                                                    .inSeconds -
                                                                5));
                                                  },
                                                  icon: Icon(
                                                    Icons.fast_rewind_rounded,
                                                    color: Colors.white,
                                                    size: 21.sp,
                                                  )),
                                              ValueListenableBuilder(
                                                valueListenable:
                                                    videoControllers!,
                                                builder: (BuildContext context,
                                                    VideoPlayerValue value,
                                                    Widget? child) {
                                                  return IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          videoControllers!
                                                                  .value
                                                                  .isPlaying
                                                              ? videoControllers!
                                                                  .pause()
                                                              : videoControllers!
                                                                  .play();
                                                        });
                                                      },
                                                      icon: Icon(
                                                        videoControllers!
                                                                .value.isPlaying
                                                            ? Icons.pause
                                                            : Icons.play_arrow,
                                                        color: Colors.white,
                                                        size: 26.sp,
                                                      ));
                                                },
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    videoControllers!.seekTo(Duration(
                                                        seconds:
                                                            videoControllers!
                                                                    .value
                                                                    .position
                                                                    .inSeconds +
                                                                5));
                                                  },
                                                  icon: Icon(
                                                    Icons.fast_forward,
                                                    color: Colors.white,
                                                    size: 21.sp,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        videoControllerState.isShow
                            ? ValueListenableBuilder(
                                valueListenable: videoControllers!,
                                builder: (context, value, child) {
                                  return Visibility(
                                    visible:
                                        videoControllerState.isShowHideControls,
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: () {
                                          videoControllers!.value.isPlaying
                                              ? videoControllers!.pause()
                                              : videoControllers!.play();
                                        },
                                        child: Container(
                                            height: 50.h,
                                            width: 50.w,
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.black.withOpacity(0.4),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              videoControllers!.value.isPlaying
                                                  ? Icons.pause
                                                  : Icons.play_arrow,
                                              size: 30.sp,
                                              color: Colors.white,
                                            )),
                                      ),
                                    ),
                                  );
                                },
                              )
                            : const SizedBox(),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
