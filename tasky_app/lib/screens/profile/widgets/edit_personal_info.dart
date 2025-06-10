import 'package:flutter/material.dart';
import 'package:tasky_app/components/custom_text_form_field.dart';
import 'package:tasky_app/controllers/user_controller.dart';

class EditUserDetails extends StatelessWidget {
  EditUserDetails({super.key}) {
    _loadInitialValues();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  void _loadInitialValues() {
    _nameController.text = UserController.userNameNotifier.value;
    _emailController.text = UserController.motifationQuote.value;
  }

  void _saveProfile() async {
    UserController.setUserName(_nameController.text);
    UserController.setMotivayionQuote(_emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: Text('User Details')),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const SizedBox(height: 24),
                CustomTextFormField(
                  hintText: 'User Name',
                  title: 'User Name',
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                CustomTextFormField(
                  hintText: '....',
                  maxLines: 7,
                  title: 'Motivation Quote',
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a Motivation Quote';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  _saveProfile();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Profile saved successfully!')),
                  );
                  Navigator.pop(context);
                }
              },
              child: Text('Save Changes'),
            ),
          ),
        ),
      ),
    );
  }
}
