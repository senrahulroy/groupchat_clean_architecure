class AppAssets {
  AppAssets._();

  // static const   _jsonPath = "assets/json";
  // static const String  emptyJson = "$_base/empty.json";

  /// Common path for json
  static String jsonPath(String fileName) {
    return "assets/json/$fileName.json";
  }

  /// common path for image
  static String imagePathPng(String fileName) {
    return "assets/images/$fileName.png";
  }

  static String imagePathJpg(String fileName) {
    return "assets/images/$fileName.jpg";
  }

  /// All Image path
  static String get manProfilePng => imagePathPng('man');
  static String get womanProfilePng => imagePathPng('woman');

  /// All json String delete.json
  static String get splashJson => jsonPath("splash");
  static String get loginJson => jsonPath("login");
  static String get registerJson => jsonPath("register");
  static String get pageNotFoundJson => jsonPath('404');
  static String get forgotPasswordJson => jsonPath("forgotpassword");
 }
