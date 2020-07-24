class Constant {
  static const KEY_TOKEN = 'key_token';
  static const API_KEY = 'bcb85669337da7abef016c8d330ff7d0';
}

class ImageURL {
  static const BASE_URL = "https://image.tmdb.org/t/p/w500";
  static const BASE_YOUTUBE = "https://img.youtube.com/vi/";
  static String getImageUrl(String path) {
    return BASE_URL + path;
  }

  static String getImageFromYoutube(String key) {
  return BASE_YOUTUBE + key + "/0.jpg";
  }
}
