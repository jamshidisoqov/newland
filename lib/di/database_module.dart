
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:newland/core/data/api/news_api.dart';

final getIt = GetIt.instance;

void setUpDatabaseModule() {
  getIt.registerSingleton<Dio>(Dio(BaseOptions(baseUrl: "https://www.terabayt.uz/")));
  getIt.registerLazySingleton<NewsApi>(() => NewsApi(getIt.get()));
}
