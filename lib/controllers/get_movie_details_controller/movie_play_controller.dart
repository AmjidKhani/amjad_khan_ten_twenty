import 'package:flutter/cupertino.dart';

class MoviePlayController with ChangeNotifier {
  //For Video Controller

  bool isPlaying = false;
  bool isReadyToPlay = false;
  bool isVideoInitialized = false;
  double currentProgress = 0.0;
  String progressTime = '00:00';
  String totalDuration = '00:00';
  bool isShow = false;
  bool isShowHideControls = false;

  bool savedScreenIsShow = false;

  changeControls() {
    isShowHideControls = !isShowHideControls;
    notifyListeners();
  }
}
