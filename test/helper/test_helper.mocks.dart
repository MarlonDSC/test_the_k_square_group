// Mocks generated by Mockito 5.4.3 from annotations
// in test_the_k_square_group/test/helper/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:fpdart/src/either.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i7;
import 'package:retrofit/retrofit.dart' as _i2;
import 'package:test_the_k_square_group/features/profile/data/data_source/remote/users_api_service.dart'
    as _i9;
import 'package:test_the_k_square_group/features/profile/data/models/user_model.dart'
    as _i10;
import 'package:test_the_k_square_group/features/profile/domain/entities/user.dart'
    as _i6;
import 'package:test_the_k_square_group/features/profile/domain/repository/user_repo.dart'
    as _i3;
import 'package:test_the_k_square_group/features/profile/domain/usecases/get_users.dart'
    as _i8;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeHttpResponse_0<T> extends _i1.SmartFake
    implements _i2.HttpResponse<T> {
  _FakeHttpResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [UserRepo].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserRepo extends _i1.Mock implements _i3.UserRepo {
  @override
  _i4.Future<_i5.Either<String, List<_i6.User>>> getUsers() =>
      (super.noSuchMethod(
        Invocation.method(
          #getUsers,
          [],
        ),
        returnValue: _i4.Future<_i5.Either<String, List<_i6.User>>>.value(
            _i7.dummyValue<_i5.Either<String, List<_i6.User>>>(
          this,
          Invocation.method(
            #getUsers,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i5.Either<String, List<_i6.User>>>.value(
                _i7.dummyValue<_i5.Either<String, List<_i6.User>>>(
          this,
          Invocation.method(
            #getUsers,
            [],
          ),
        )),
      ) as _i4.Future<_i5.Either<String, List<_i6.User>>>);
}

/// A class which mocks [GetUsersUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetUsersUseCase extends _i1.Mock implements _i8.GetUsersUseCase {
  @override
  _i4.Future<_i5.Either<String, List<_i6.User>>> call() => (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i4.Future<_i5.Either<String, List<_i6.User>>>.value(
            _i7.dummyValue<_i5.Either<String, List<_i6.User>>>(
          this,
          Invocation.method(
            #call,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i5.Either<String, List<_i6.User>>>.value(
                _i7.dummyValue<_i5.Either<String, List<_i6.User>>>(
          this,
          Invocation.method(
            #call,
            [],
          ),
        )),
      ) as _i4.Future<_i5.Either<String, List<_i6.User>>>);
}

/// A class which mocks [UsersApiService].
///
/// See the documentation for Mockito's code generation for more information.
class MockUsersApiService extends _i1.Mock implements _i9.UsersApiService {
  @override
  _i4.Future<_i2.HttpResponse<List<_i10.UserModel>>> getUsers() =>
      (super.noSuchMethod(
        Invocation.method(
          #getUsers,
          [],
        ),
        returnValue: _i4.Future<_i2.HttpResponse<List<_i10.UserModel>>>.value(
            _FakeHttpResponse_0<List<_i10.UserModel>>(
          this,
          Invocation.method(
            #getUsers,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.HttpResponse<List<_i10.UserModel>>>.value(
                _FakeHttpResponse_0<List<_i10.UserModel>>(
          this,
          Invocation.method(
            #getUsers,
            [],
          ),
        )),
      ) as _i4.Future<_i2.HttpResponse<List<_i10.UserModel>>>);
}