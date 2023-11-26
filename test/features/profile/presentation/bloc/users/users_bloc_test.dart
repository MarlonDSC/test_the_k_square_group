import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';
import 'package:test_the_k_square_group/core/usecases/usecases.dart';
import 'package:test_the_k_square_group/features/profile/data/models/user_model.dart';
import 'package:test_the_k_square_group/features/profile/domain/entities/user.dart';
import 'package:test_the_k_square_group/features/profile/presentation/bloc/users/users_bloc.dart';

import '../../../../../fixture/fixture.dart';
import '../../../../../fixture/json_reader.dart';
import '../../../../../helper/test_helper.mocks.dart';

void main() {
  late MockGetUsersUseCase mockGetUsersUseCase;
  late List<User> userList;

  setUp(() {
    mockGetUsersUseCase = MockGetUsersUseCase();

    final userListJson = jsonDecode(fixture(Fixture.userList));
    userList =
        (userListJson as List).map((i) => UserModel.fromJson(i)).toList();
    provideDummy<DataState<List<User>>>(Right(userList));
  });

  group('GetUsers', () {
    blocTest<UsersBloc, UsersState>(
      'emits [LoadingUsersState, LoadedUsersState] when GetUsers succeeds',
      build: () {
        when(mockGetUsersUseCase.call())
            .thenAnswer((_) async => const Right([]));
        return UsersBloc(mockGetUsersUseCase);
      },
      act: (bloc) => bloc.add(const GetUsers()),
      expect: () => [LoadingUsersState(), const LoadedUsersState(users: [])],
    );
    late String error;
    blocTest<UsersBloc, UsersState>(
      'emits [LoadingUsersState, ErrorUsersState] when GetUsers fails',
      setUp: () {
        error = 'An error has ocurred';
      },
      build: () {
        when(mockGetUsersUseCase.call()).thenAnswer((_) async => Left(error));
        return UsersBloc(mockGetUsersUseCase);
      },
      act: (bloc) => bloc.add(const GetUsers()),
      expect: () => [LoadingUsersState(), ErrorUsersState(error)],
    );
  });
}
