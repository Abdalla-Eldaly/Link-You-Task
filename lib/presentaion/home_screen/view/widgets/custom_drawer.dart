import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:linkyou_task/core/common/widgets/cached_image.dart';
import 'package:linkyou_task/core/providers/user_provider.dart';
import 'package:linkyou_task/presentaion/resources/color_manager.dart';
import 'package:linkyou_task/presentaion/resources/text_style.dart';
import 'package:linkyou_task/presentaion/resources/strings_manager.dart';
import 'package:linkyou_task/presentaion/resources/values_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../domain/models/user_model.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  Future<void> _changeLanguage(BuildContext context) async {
    final isEnglish = context.locale.languageCode == 'en';
    final newLocale = isEnglish ? const Locale('ar') : const Locale('en');

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', newLocale.languageCode);

    await context.setLocale(newLocale);
  }

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserProvider>(context).user;
    final isEnglish = context.locale.languageCode == 'en';

    return Drawer(
      child: Column(
        children: [
          _buildHeader(userData),
          _buildUserInfoTile(Icons.person, StringsManager.username.tr(), userData?.username),
          _buildUserInfoTile(Icons.email, StringsManager.email.tr(), userData?.email),
          _buildUserInfoTile(Icons.badge, StringsManager.firstName.tr(), userData?.firstName),
          _buildUserInfoTile(Icons.badge, StringsManager.lastName.tr(), userData?.lastName),
          _buildUserInfoTile(Icons.male, StringsManager.gender.tr(), userData?.gender),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.language_rounded, color: ColorManager.primary),
            title: Text(isEnglish ? 'English' : 'العربية', style: AppTextStyles.bodyLarge),
            onTap: () => _changeLanguage(context),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(AppSize.s16),
            child: Text(
              StringsManager.appVersion.tr(),
              style: const TextStyle(color: Colors.grey),
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
        style: AppTextStyles.headlineMedium,
      ),
      accountEmail: Text(userData?.email ?? StringsManager.noEmail.tr()),
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
      title: Text(title, style: AppTextStyles.bodyLarge),
      subtitle: Text(value ?? StringsManager.notAvailable.tr(), style: AppTextStyles.bodyMedium),
    );
  }
}
