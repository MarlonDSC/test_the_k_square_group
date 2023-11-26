import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';
import 'package:test_the_k_square_group/core/usecases/usecases.dart';
import 'package:test_the_k_square_group/features/profile/data/models/user_model.dart';
import 'package:test_the_k_square_group/features/profile/domain/entities/user.dart';
import 'package:test_the_k_square_group/features/profile/domain/repository/user_repo.dart';
import 'package:test_the_k_square_group/features/profile/domain/usecases/get_users.dart';

import '../../../../fixture/fixture.dart';
import '../../../../fixture/json_reader.dart';
import '../../../../helper/test_helper.mocks.dart';

void main() {
  late GetUsersUseCase getUsers;
  late UserRepo mockUserRepository;
  late List<User> userList;

  setUp(() {
    mockUserRepository = MockUserRepo();
    getUsers = GetUsersUseCase(mockUserRepository);

    final userListJson = jsonDecode(fixture(Fixture.userList));
    userList =
        (userListJson as List).map((i) => UserModel.fromJson(i)).toList();
    provideDummy<DataState<List<User>>>(Right(userList));
  });

  test('should get users from the repository', () async {
    // Arrange
    when(mockUserRepository.getUsers())
        .thenAnswer((_) async => Right(userList));

    // Act
    final result = await getUsers.call();

    // Assert
    expect(result, Right<String, List<User>>(userList));
    verify(mockUserRepository.getUsers());
    verifyNoMoreInteractions(mockUserRepository);
  });

  test('should return failure when the call to repository is unsuccessful',
      () async {
    var error = 'Server error';
    // Arrange
    when(mockUserRepository.getUsers()).thenAnswer((_) async => Left(error));

    // Act
    final result = await getUsers.call();

    // Assert
    expect(result, Left(error));
    verify(mockUserRepository.getUsers());
    verifyNoMoreInteractions(mockUserRepository);
  });
}
