import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_the_k_square_group/core/services/router/my_router.dart';
import 'package:test_the_k_square_group/features/profile/presentation/bloc/users/users_bloc.dart';
import 'package:test_the_k_square_group/locator.dart';
import 'package:test_the_k_square_group/ui/molecules/user_list_tile.dart';
import 'package:test_the_k_square_group/ui/templates/user_template.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final UsersBloc _usersBloc = sl<UsersBloc>();

  @override
  void initState() {
    _usersBloc.add(const GetUsers());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(
      bloc: _usersBloc,
      builder: (context, state) {
        return UserTemplate(
          isLoading: state is LoadingUsersState,
          userList: (state is LoadedUsersState)
              ? state.users
                  .map((e) => UserListTile(
                        id: e.id,
                        fullName: e.name,
                        email: e.email,
                        onPressed: () => Mrouter.pushNamed(
                          Mrouter.singleUserRoute,
                          arguments: {'user': e},
                        ),
                      ))
                  .toList()
              : [],
        );
      },
    );
  }
}
