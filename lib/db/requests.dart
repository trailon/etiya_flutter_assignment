import 'package:dio/dio.dart';
import 'package:etiya_flutter_assignment/db/endpoints.dart';
import 'package:etiya_flutter_assignment/models/repositoriesmodel.dart';
import 'package:etiya_flutter_assignment/models/repositorymodel.dart';
import 'package:etiya_flutter_assignment/models/searchrepositoriesmodel.dart';

class APICalls {
  late Dio dio;
  APICalls() {
    dio = Dio();
    dio.options.baseUrl = APIEndPoints.baseUrl;
    dio.options.responseType = ResponseType.json;
    dio.options.headers["Content-Type"] = "application/json";
    /*  dio.options.connectTimeout = 6000;
    dio.options.receiveTimeout = 5000; */
  }

  Future<SearchRepositoriesModel?> getRepoList(
      {String paginationId = "0"}) async {
    try {
    var rs = await dio.get("${APIEndPoints.userRepos}?since=$paginationId");
    if (rs.statusCode != 200) {
      throw Error;
    }
    Map<String, dynamic> myMap = {"items": rs.data};
    return SearchRepositoriesModel.fromJson(myMap);
    } catch (e) {
      return null;
    }
  }

  Future<SearchRepositoriesModel?> getRepoSearchList(
      {required String searchText}) async {
    try {
    var rs = await dio.get("${APIEndPoints.search}?q=$searchText");
    if (rs.statusCode != 200) {
      throw Error;
    }
    return SearchRepositoriesModel.fromJson(rs.data);
    } catch (e) {
      return null;
    }
  }

  Future<RepositoryModel?> getRepository({required String userRepo}) async {
    try {
    var rs = await dio.get("${APIEndPoints.userRepo}$userRepo");
    if (rs.statusCode != 200) {
      throw Error;
    }
    return RepositoryModel.fromJson(rs.data);
    } catch (e) {
      return null;
    }

  }
}
