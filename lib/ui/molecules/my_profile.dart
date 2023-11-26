import 'package:flutter/cupertino.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({
    required this.fullName,
    required this.email,
    required this.username,
    required this.address,
    super.key,
  });
  final String fullName;
  final String email;
  final String username;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('fullName: $fullName'),
        Text('email: $email'),
        Text('username: $username'),
        Text('address: $address'),
      ],
    );
  }
}
