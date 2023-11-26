import 'package:test_the_k_square_group/core/usecases/usecases.dart';
import 'package:test_the_k_square_group/features/profile/domain/entities/user.dart';

abstract class UserRepo {
  Future<DataState<List<User>>> getUsers();
}