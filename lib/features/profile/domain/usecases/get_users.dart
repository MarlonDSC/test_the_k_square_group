

import 'package:test_the_k_square_group/core/usecases/usecases.dart';
import 'package:test_the_k_square_group/features/profile/domain/entities/user.dart';
import 'package:test_the_k_square_group/features/profile/domain/repository/user_repo.dart';

class GetUsersUseCase {
  final UserRepo _userRepo;

  GetUsersUseCase(this._userRepo);

  Future<DataState<List<User>>> call() => _userRepo.getUsers();
}