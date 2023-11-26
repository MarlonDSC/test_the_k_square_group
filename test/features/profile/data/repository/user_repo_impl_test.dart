import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:retrofit/dio.dart';
import 'package:test_the_k_square_group/features/profile/data/models/user_model.dart';
import 'package:test_the_k_square_group/features/profile/data/repository/user_repo_impl.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../fixture/fixture.dart';
import '../../../../fixture/json_reader.dart';
import '../../../../helper/test_helper.mocks.dart';

void main() {
  late UserRepoImpl userRepoImpl;
  late MockUsersApiService mockUsersApiService;

  setUp(() {
    mockUsersApiService = MockUsersApiService();
    userRepoImpl = UserRepoImpl(mockUsersApiService);
  });

  group('getUsers', () {
    test('should return a list of users when the call is successful', () async {
      // Arrange
      final userList = jsonDecode(fixture(Fixture.userList));
      List<UserModel> tUserModelList =
          (userList as List).map((item) => UserModel.fromJson(item)).toList();

      when(mockUsersApiService.getUsers()).thenAnswer((_) async => HttpResponse(
          tUserModelList,
          Response(
            requestOptions: RequestOptions(),
            statusCode: HttpStatus.ok,
          )));

      // Act
      var result = await userRepoImpl.getUsers();

      // Assert
      expect(result.isRight(), true);
      result.fold((l) => null, (r) {
        for (var i = 0; i < r.length; i++) {
          expect(r[i].id, tUserModelList[i].id);
          expect(r[i].name, tUserModelList[i].name);
          expect(r[i].username, tUserModelList[i].username);
          expect(r[i].email, tUserModelList[i].email);
          expect(r[i].address, tUserModelList[i].address);
          expect(r[i].phone, tUserModelList[i].phone);
          expect(r[i].website, tUserModelList[i].website);
          expect(r[i].company, tUserModelList[i].company);
        }
      });
      verify(mockUsersApiService.getUsers());
      verifyNoMoreInteractions(mockUsersApiService);
    });

    test('should return a Left when the call is unsuccessful', () async {
      // Arrange
      when(mockUsersApiService.getUsers()).thenThrow(Exception());

      // Act
      final result = await userRepoImpl.getUsers();

      // Assert
      expect(result, isA<Left>());
      verify(mockUsersApiService.getUsers());
      verifyNoMoreInteractions(mockUsersApiService);
    });
  });
}
