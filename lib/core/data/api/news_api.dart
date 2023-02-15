import 'package:dio/dio.dart';
import 'package:newland/core/data/models/base_models.dart';
import 'package:newland/core/data/models/category_data.dart';
import 'package:newland/core/data/models/post_data.dart';

class NewsApi {
  Dio dio;

  NewsApi(this.dio);

  Future<BaseResponse<List<CategoryData>>> getAllCategory() async {
    List<CategoryData> category = [];
    BaseResponse<List<CategoryData>> result = Success(category);
    try {
      var response = await dio.get("/api.php?action=categories");
      int status = response.statusCode ?? 0;
      if (status >= 200 && status < 300) {
        result = Success(
          (response.data as List).map((e) => CategoryData.fromJson(e)).toList(),
        );
      } else {
        result = Error(Exception(response.statusMessage));
      }
    } catch (e) {
      result = Error(Exception(e));
    }

    return result;
  }

  Future<BaseResponse<List<PostData>>> getAllPosts({
    required int categoryId,
  }) async {
    List<PostData> posts = [];
    BaseResponse<List<PostData>> result = Success(posts);
    try {
      var response = await dio.get(
          "/api.php?action=posts&first_update=1613122152&last_update=0&category=$categoryId&limit=30");
      int status = response.statusCode ?? 0;
      if (status >= 200 && status < 300) {
        result = Success(
          (response.data as List).map((e) => PostData.fromJson(e)).toList(),
        );
      } else {
        result = Error(Exception(response.statusMessage));
      }
    } catch (e) {
      result = Error(Exception(e));
    }

    return result;
  }
}
