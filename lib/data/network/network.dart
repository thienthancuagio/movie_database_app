import 'package:dio/dio.dart';
import 'package:movie_database_app/util/Constant.dart';

class NetworkClient {
  static BaseOptions _options = new BaseOptions(
    baseUrl: "https://api.themoviedb.org/3",
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  static Dio _dio = Dio(_options);
  NetworkClient._internal() {
    print(_dio);
    //_dio.interceptors.add(LogInterceptor(responseBody: true));
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (Options myOption) async {
//      var token = await SPref.instance.get(Constant.KEY_TOKEN);
//      if (token != null) {
//      myOption.headers["Authorization"] = "Bearer " + token;
//      }
      print("log request =" + myOption.toString());

      return myOption;
    }, onResponse: (Response response) async {
      print("log response  === \n");
      print(response);
    }, onError: (DioError error) async {
      print("HTTP request fail  ====");
      print(error);
      print("====================");
    }));
  }
  static final NetworkClient instance = NetworkClient._internal();

  Dio get dio => _dio;
}
