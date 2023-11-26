import 'package:flutter/cupertino.dart';
import 'package:test_the_k_square_group/features/profile/domain/entities/user.dart';
import 'package:test_the_k_square_group/ui/molecules/my_profile.dart';
import 'package:test_the_k_square_group/ui/templates/profile_template.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    required this.user,
    super.key,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return ProfileTemplate(
      myProfile: MyProfile(
        fullName: user.name,
        email: user.email,
        username: user.username,
        address: '${user.address.street}, ${user.address.city}',
      ),
    );
  }
}
