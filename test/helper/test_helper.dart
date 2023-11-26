import 'package:mockito/annotations.dart';
import 'package:test_the_k_square_group/features/profile/data/data_source/remote/users_api_service.dart';
import 'package:test_the_k_square_group/features/profile/domain/repository/user_repo.dart';
import 'package:test_the_k_square_group/features/profile/domain/usecases/get_users.dart';

@GenerateNiceMocks(<MockSpec>[
  MockSpec<UserRepo>(),
  MockSpec<GetUsersUseCase>(),
  MockSpec<UsersApiService>(),
])
void main(){}