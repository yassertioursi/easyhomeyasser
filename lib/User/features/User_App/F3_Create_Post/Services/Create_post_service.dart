import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class CreatePostService {
  Dio dio = Dio();
  late String result;

  Future<bool> createPost(
    String title,
    String description,
    String job,
    List<File> images,
    String jwtToken,
  ) async {
    String postUrl = 'https://easyhome-lcvx.onrender.com/api/v1/users/posts';

    dio.options.headers['Authorization'] = 'Bearer $jwtToken';
    dio.options.headers['Content-Type'] = 'multipart/form-data';

    List<MultipartFile> imageFiles = [];

    for (File image in images) {
      String fileName = image.path.split('/').last;
      List<int> imageBytes = await image.readAsBytes();
      MultipartFile file = MultipartFile.fromBytes(
        imageBytes,
        filename: fileName,
        contentType: MediaType('image', 'jpeg'),
      );
      imageFiles.add(file);
    }

    FormData formData = FormData.fromMap({
      "title": title,
      "description": description,
      "job": job,
      "images": imageFiles,
    });

    try {
      Response response = await dio.post(postUrl, data: formData);
      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        return true;
      } else {
        print("Error: ${response.statusCode}");
        return false;
      }
    } on DioError catch (error) {
      if (error.response != null) {
        print('Error Response data: ${error.response!.data}');
        result = error.response!.data['message'];
        print('Error Response status: ${error.response!.statusCode}');
        print('Error Response headers: ${error.response!.headers}');
      } else {
        print('Error: $error');
      }
      return false;
    }
  }
}
