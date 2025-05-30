import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky_app/components/custom_text_form_field.dart';
import 'package:tasky_app/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky_app/screens/main_screen.dart';

class StartupScreen extends StatelessWidget {
  StartupScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 52),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 16,
                children: [
                  SvgPicture.asset('assets/images/logo.svg'),
                  Text(
                    'Tasky',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ],
              ),

              SizedBox(height: 118),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome To Tasky ',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SvgPicture.asset('assets/images/waving.svg'),
                ],
              ),
              SizedBox(height: 8),

              Text(
                'Your productivity journey starts here.',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(height: 24),
              SvgPicture.asset(
                'assets/images/pana.svg',
                width: 215,
                height: 205,
              ),
              SizedBox(height: 28),
              CustomTextFormField(
                title: 'Full Name',
                hintText: 'e.g. Sarah Khalid',
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setString(
                        SharedPrefsKeys.userName,
                        _nameController.text,
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MainScreen();
                          },
                        ),
                      );
                    }
                  },
                  child: Text('Let’s Get Started'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
