import 'package:flutter/material.dart';
import 'package:messagegame_app/screens/registration_screen.dart';
import 'package:messagegame_app/screens/signin_screen.dart';
import 'package:messagegame_app/widgets/my_button.dart';

class WelcomeScreen extends StatefulWidget {
  //لێره ه‌و روته‌ی له مه‌ین ته‌عریفمان كرد لیره ده‌یناسێنین و ستاتیكی ده‌ده‌ینێ هه‌تاوه‌كو هه‌موو جاران دروست نوبه‌ و ئه‌په‌كه‌ سه‌بر بكات
  static const String screenRoute = 'welcome_screen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 180,
                  child: Image.asset('images/logo.png'),
                ),
                const Text(
                  'MessageMe',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Color(0xff2e386b),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            MyButton(
              color: Colors.yellow[900]!,
              title: 'sign in',
              onPressed: () {
                Navigator.pushNamed(context, SigInScreen.screenRoute);
              },
            ),
            MyButton(
                color: Colors.blue,
                title: 'register',
                onPressed: () {
                  Navigator.pushNamed(context, RigistrationScreen.screenRoute);
                }),
            MyButton(
                color: Colors.blue,
                title: 'register',
                onPressed: () {
                  Navigator.pushNamed(context, RigistrationScreen.screenRoute);
                })
          ],
        ),
      ),
    );
  }
}
