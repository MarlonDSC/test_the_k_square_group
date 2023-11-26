import 'dart:developer';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:test_the_k_square_group/core/usecases/usecases.dart';
import 'package:test_the_k_square_group/features/profile/data/data_source/remote/users_api_service.dart';
import 'package:test_the_k_square_group/features/profile/domain/entities/user.dart';
import 'package:test_the_k_square_group/features/profile/domain/repository/user_repo.dart';

class UserRepoImpl implements UserRepo {
  final UsersApiService _api;

  UserRepoImpl(this._api);

  @override
  Future<DataState<List<User>>> getUsers() async{
    try {
      var response = await _api.getUsers();
      if(response.response.statusCode == HttpStatus.ok){
        final users = response.data.toList();
        return Right(users);
      } else {
        return const Left('Error while getting users');
      }
    } catch(e) {
      // Crashlitics impl
      log(e.toString());
      return Left('Exception occurred: ${e.toString()}');
    }
  }
}
