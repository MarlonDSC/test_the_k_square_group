import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:retrofit/dio.dart';
import 'package:test_the_k_square_group/features/profile/data/data_source/remote/users_api_service.dart';
import 'package:test_the_k_square_group/features/profile/data/models/user_model.dart';

import '../../../../../fixture/fixture.dart';
import '../../../../../fixture/json_reader.dart';

void main() {
  late Dio mockDio;
  late DioAdapter dioAdapter;
  late UsersApiService usersApiService;

  setUp(() {
    mockDio = Dio();
    dioAdapter = DioAdapter(dio: mockDio);
    usersApiService = UsersApiService(mockDio);
  });

  const path = '/users';

  group('getUsers', () {
    test('should return a list of UserModel when the call is successful',
        () async {
      // Arrange
      final userList = jsonDecode(fixture(Fixture.userList));
      List<UserModel> tUserModelList =
          (userList as List).map((item) => UserModel.fromJson(item)).toList();
      dioAdapter.onGet(path, (server) => server.reply(200, userList));

      // Act
      final result = await usersApiService.getUsers();

      // Assert
      expect(result.data, tUserModelList);
    });

    test('should throw an exception when the call is unsuccessful', () async {
      // Arrange
      dioAdapter.onGet(
          path, (server) => server.reply(500, 'Internal Server Error'));

      // Act
      Future<HttpResponse<List<UserModel>>> call = usersApiService.getUsers();

      // Assert
      expect(() => call, throwsA(isA<DioException>()));
    });
  });
}