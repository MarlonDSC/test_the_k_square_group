import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_the_k_square_group/features/profile/domain/entities/user.dart';
import 'package:test_the_k_square_group/features/profile/domain/usecases/get_users.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final GetUsersUseCase _getUsersUseCase;

  UsersBloc(this._getUsersUseCase) : super(const LoadedUsersState(users: [])) {
    on<GetUsers>(_getUsers);
  }

  Future<void> _getUsers(GetUsers event, Emitter<UsersState> emit) async {
    emit(LoadingUsersState());
    var result = await _getUsersUseCase.call();

    result.fold((l) => emit(ErrorUsersState(l)),
        (r) => emit(LoadedUsersState(users: r)));
  }
}
