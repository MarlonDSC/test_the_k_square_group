import 'package:flutter/material.dart';

class ProfileTemplate extends StatelessWidget {
  const ProfileTemplate({
    required this.myProfile,
    super.key,
  });
  final Widget myProfile;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Mi perfil'),
          ),
          body: Center(child: myProfile),
        );
      },
    );
  }
}
