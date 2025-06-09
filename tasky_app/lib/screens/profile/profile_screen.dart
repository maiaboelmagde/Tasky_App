import 'package:flutter/material.dart';
import 'package:tasky_app/constants.dart';
import 'package:tasky_app/screens/profile/widgets/edit_personal_info.dart';
import 'package:tasky_app/screens/profile/widgets/profile_image_widget.dart';
import 'package:tasky_app/screens/startup_screen.dart';
import 'package:tasky_app/services/user_controller.dart';
import 'package:tasky_app/theme/theme_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Column(
                  children: [
                    ProfileImageWidget(),
                    SizedBox(height: 8),
                    ValueListenableBuilder<String>(
                      valueListenable: UserController.userNameNotifier,
                      builder:
                          (BuildContext context, String value, Widget? child) {
                            return Text(value,style: Theme.of(context).textTheme.titleMedium,);
                          },
                    ),
                    ValueListenableBuilder<String>(
                      valueListenable: UserController.motifationQuote,
                      builder:
                          (BuildContext context, String value, Widget? child) {
                            return Text(value,style: Theme.of(context).textTheme.displaySmall,);
                          },
                    ),
                  ],
                ),
              ),
            ),

            Text('Profile Info',style: Theme.of(context).textTheme.displayMedium),
            ListTile(
              leading: Icon(Icons.person_2_outlined),
              title: Text('Personal Info'),
              trailing: Icon(Icons.navigate_next),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditUserDetails()),
              ),
            ),
            Divider(),
            ValueListenableBuilder(
              valueListenable: ThemeController.themeNotifier,
              builder: (context, value, child) {
                return ListTile(
                  leading: Icon(Icons.dark_mode_outlined),
                  title: Text('Dark mode'),
                  trailing: Switch(
                    value: ThemeController.isDark(),
                    onChanged: (value) {
                      ThemeController.toggleTheme();
                    },
                  ),
                
                  onTap: () {
                    ThemeController.toggleTheme();
                  },
                );
              }
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log out'),
              trailing: Icon(Icons.navigate_next),
              onTap: () async {
                prefs.remove(StorageKey.userName);
                prefs.remove(StorageKey.motivationQuote);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => StartupScreen()),
                );

              },
            ),
          ],
        ),
      ),
    );
  }
}
