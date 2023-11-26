import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_the_k_square_group/core/constants/constants.dart';
import 'package:test_the_k_square_group/features/profile/data/models/user_model.dart';

part 'users_api_service.g.dart';

@RestApi(baseUrl:newsAPIBaseURL)
abstract class UsersApiService {
  factory UsersApiService(Dio dio) = _UsersApiService;

  @GET('/users')
  Future<HttpResponse<List<UserModel>>> getUsers();
}