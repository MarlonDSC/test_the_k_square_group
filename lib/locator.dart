import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test_the_k_square_group/core/services/router/my_router.dart';
import 'package:test_the_k_square_group/features/profile/data/data_source/remote/users_api_service.dart';
import 'package:test_the_k_square_group/features/profile/data/repository/user_repo_impl.dart';
import 'package:test_the_k_square_group/features/profile/domain/repository/user_repo.dart';
import 'package:test_the_k_square_group/features/profile/domain/usecases/get_users.dart';
import 'package:test_the_k_square_group/features/profile/presentation/bloc/users/users_bloc.dart';

GetIt sl = GetIt.instance;

void setupLocator() {
  sl.registerSingleton<Dio>(Dio());

  sl.registerSingleton<UsersApiService>(UsersApiService(sl()));

  sl.registerSingleton<UserRepo>(UserRepoImpl(sl()));

  sl.registerSingleton<GetUsersUseCase>(GetUsersUseCase(sl()));

  sl.registerFactory<UsersBloc>(() => UsersBloc(sl()));

  sl.registerSingleton<Mrouter>(Mrouter(),
      dispose: (router) => router.closeStream());
}
