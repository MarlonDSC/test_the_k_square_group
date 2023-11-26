import 'package:flutter/material.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({
    required this.id,
    required this.fullName,
    required this.email,
    this.onPressed,
    super.key,
  });

  final int id;
  final String fullName;
  final String email;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text('$id'),
      title: Text(fullName),
      subtitle: Text(email),
      trailing: IconButton(
        icon: const Icon(Icons.info_outline),
        onPressed: onPressed,
      ),
    );
  }
}
