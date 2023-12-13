import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    bool isDebug =
       false; // Set this to true if it's debug mode, false otherwise.

    if (isDebug) {
      return 'ca-app-pub-3940256099942544/6300978111'; // Test ad unit ID for debug mode
    } else {
      if (Platform.isAndroid) {
        return 'ca-app-pub-3940256099942544/2934735716'; //live
        // return 'ca-app-pub-3940256099942544/6300978111'; //test
        //
      } else if (Platform.isIOS) {
        return 'ca-app-pub-2439901986027384/2580537828'; //live
        // return 'ca-app-pub-3940256099942544/2934735716'; //test
      } else {
        throw new UnsupportedError('Unsupported platform');
      }
    }
  }
}
