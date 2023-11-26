import 'package:flutter/material.dart';
import 'package:test_the_k_square_group/ui/molecules/user_list_tile.dart';

class UserTemplate extends StatelessWidget {
  const UserTemplate({
    required this.isLoading,
    required this.userList,
    super.key,
  });

  final bool isLoading;
  final List<UserListTile> userList;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Podemos definir reglas dependiendo el tamaño de la pantalla
        return Scaffold(
          appBar: AppBar(
            title: const Text('Lista de usuarios'),
          ),
          body: isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (context, index) => userList[index],
                ),
        );
      },
    );
  }
}
