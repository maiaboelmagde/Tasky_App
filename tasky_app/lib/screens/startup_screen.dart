import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky_app/constants.dart';
import 'package:tasky_app/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class StartupScreen extends StatefulWidget {
  const StartupScreen({super.key});

  @override
  State<StartupScreen> createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 52,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 16,
                children: [
                  SvgPicture.asset('assets/images/logo.svg'),
                  Text('Tasky', style: Theme.of(context).textTheme.displayLarge),
                ],
              ),
          
              SizedBox(height: 118,),
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
              SizedBox(height: 8,),
          
              Text(
                'Your productivity journey starts here.',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(height: 24,),
              SvgPicture.asset(
                'assets/images/pana.svg',
                width: 215,
                height: 205,
              ),
              SizedBox(height: 28,),
              Row(
                children: [
                  Text(
                    'Full Name',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
              TextFormField(
                controller: _nameController,
                style:  Theme.of(context).textTheme.displayMedium,
                decoration: InputDecoration(
                  hintText: 'e.g. Sarah Khalid',
                ),

                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async{
                    if(_formKey.currentState!.validate()){
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setString(SharedPrefsKeys.userName, _nameController.text);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                        return Homescreen();
                      }));
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
