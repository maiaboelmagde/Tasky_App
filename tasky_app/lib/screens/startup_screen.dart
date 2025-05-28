import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky_app/screens/home_screen.dart';

class StartupScreen extends StatelessWidget {
  const StartupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [Column(
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
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'e.g. Sarah Khalid',
                
              ),
            ),
            SizedBox(height: 24,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Homescreen();
                  }));
                },
                child: Text('Let’s Get Started'),
              ),
            ),
          ],
        ),
        ]
      ),
    );
  }
}
