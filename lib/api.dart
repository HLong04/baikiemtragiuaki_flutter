import 'package:dio/dio.dart';
import 'package:labtonghop/model/articles.dart';
import 'package:labtonghop/model/product.dart';
import 'package:labtonghop/model/user.dart';
import 'package:labtonghop/model/usermain.dart';

class API {
  Future<List<Product>> getAllProducts() async {
    var dio = Dio();
    try {
      var response = await dio.request(
        'https://fakestoreapi.com/products',
        options: Options(method: 'GET'),
      );
      List<Product> listProduct = [];

      if (response.statusCode == 200) {
        var jsonData = response.data;
        if (jsonData is List) {
          listProduct = jsonData.map((x) => Product.fromJson(x)).toList();
        }
      }
      return listProduct;
    } catch (e) {
      print("Lỗi API: $e");
      return [];
    }
  }

  Future<List<UserMain>> getAllUsers() async {
    var dio = Dio();
    try {
      var response = await dio.get('https://fakestoreapi.com/users');
      if (response.statusCode == 200) {
        var jsonData = response.data;
        if (jsonData is List) {
          // Map từng phần tử trong List JSON sang List<User>
          return jsonData.map((item) => UserMain.fromJson(item)).toList();
        }
      }
      return [];
    } catch (e) {
      print("Lỗi lấy user: $e");
      return [];
    }
  }


  Future<Product?> getProductById(int id) async {
    var dio = Dio();
    try {
      var response = await dio.get('https://fakestoreapi.com/products/$id');

      if (response.statusCode == 200) {
        return Product.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print("Lỗi API: $e");
      return null;
    }
  }

  Future<List<Article>> getAllArticles() async {
    var dio = Dio();
    try {
      var response = await dio.request(
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=34709ef262ed49bdabb8eeca0a82ae9c',
        options: Options(method: 'GET'),
      );
      List<Article> listArticles = [];

      if (response.statusCode == 200) {
        var jsonData = response.data;

        if (jsonData['articles'] != null) {
          var listData = jsonData['articles'] as List;

          listArticles = listData.map((e) => Article.fromJson(e)).toList();
        }
      }
      return listArticles;
    } catch (e) {
      print("Lỗi API: $e");
      return [];
    }
  }

  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<User?> login(String username, String password) async {
    try {
      final response = await _dio.post(
        'https://dummyjson.com/auth/login',
        data: {'username': username, 'password': password, 'expiresInMins': 30},
        options: Options(contentType: Headers.jsonContentType),
      );
      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      }
    } catch (e) {
      print("Lỗi Đăng Nhập: $e");
    }
    return null;
  }

}

var MyAPI = API();
