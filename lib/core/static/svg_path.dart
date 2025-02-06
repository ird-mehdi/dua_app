/// Utility class for commonly used SVG path assets in the app.
///
/// Provides constant strings for the file paths of commonly used SVG assets.
///
/// Note that hardcoding the file paths in the app's code can lead to potential
/// mistakes and inconsistencies if the file paths change or if different
/// developers use different file paths for the same asset.
///
/// By using constants from this class, we ensure that all the file paths are
/// consistent and easily editable from a single location.
///
///
class SvgPath {
  SvgPath._();
  static const String imgTop = "assets/images/non_svg/top.png";
  static const String prayertimeimgBackground =
      "assets/images/svg/prayer_bg.svg";
  static const String prayertimeIconFazr = "assets/images/svg/fazr.svg";
  static const String icSun = "assets/images/svg/ic_dhur.svg";
  static const String prayertimeIconAsr = "assets/images/svg/Asr.svg";
  static const String prayertimeIconMagrib = "assets/images/svg/Magrib.svg";
  static const String prayertimeIconEsha = "assets/images/svg/Isha.svg";
  static const String volumeHhigh = "assets/images/svg/volume-high.svg";
  static const String volumeSlash = "assets/images/svg/volume-slash.svg";
  static const String icArrowBack = "assets/images/svg/ic_arrow_back.svg";
  static const String icSort = "assets/images/svg/ic_sort.svg";

  static const String icMainComponent = "assets/images/svg/ic_main_component.svg";
}
