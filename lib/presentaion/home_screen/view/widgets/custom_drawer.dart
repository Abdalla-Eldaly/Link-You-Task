import 'package:flutter/material.dart';
import 'package:linkyou_task/core/common/widgets/cached_image.dart';
import 'package:linkyou_task/core/providers/user_provider.dart';
import 'package:linkyou_task/presentaion/resources/color_manager.dart';
import 'package:linkyou_task/presentaion/resources/text_style.dart';
import 'package:linkyou_task/presentaion/resources/strings_manager.dart';
import 'package:linkyou_task/presentaion/resources/values_manager.dart';
import 'package:provider/provider.dart';

import '../../../../domain/models/user_model.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserProvider>(context).user;

    return Drawer(
      child: Column(
        children: [
          _buildHeader(userData),
          _buildUserInfoTile(Icons.person, StringsManager.username, userData?.username),
          _buildUserInfoTile(Icons.email, StringsManager.email, userData?.email),
          _buildUserInfoTile(Icons.badge, StringsManager.firstName, userData?.firstName),
          _buildUserInfoTile(Icons.badge, StringsManager.lastName, userData?.lastName),
          _buildUserInfoTile(Icons.male, StringsManager.gender, userData?.gender),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(AppSize.s16),
            child: Text(
              StringsManager.appVersion,
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(User? userData) {
    return UserAccountsDrawerHeader(
      accountName: Text(
        '${userData?.firstName ?? ''} ${userData?.lastName ?? ''}',
        style:AppTextStyles.headlineMedium,
      ),
      accountEmail: Text(userData?.email ?? StringsManager.noEmail),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        child: ClipOval(
          child: CachedImage(
            imageUrl: userData?.image ?? '',
            width: AppSize.s80,
            height: AppSize.s80,
          ),
        ),
      ),
      decoration: const BoxDecoration(
        color: ColorManager.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppSize.s20),
          bottomRight: Radius.circular(AppSize.s20),
        ),
      ),
    );
  }

  Widget _buildUserInfoTile(IconData icon, String title, String? value) {
    return ListTile(
      leading: Icon(icon, color: ColorManager.primary),
      title: Text(
        title,
        style: AppTextStyles.bodyLarge,
      ),
      subtitle: Text(value ?? StringsManager.notAvailable, style: AppTextStyles.bodyMedium),
    );
  }
}
