import 'package:flutter/material.dart';
import 'package:messagegame_app/widgets/my_button.dart';

class RigistrationScreen extends StatefulWidget {
  static const String screenRoute = 'registration_screen';

  const RigistrationScreen({Key? key}) : super(key: key);

  @override
  _RigistrationScreenState createState() => _RigistrationScreenState();
}

class _RigistrationScreenState extends State<RigistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 0.2 * MediaQuery.of(context).size.width,
              child: Image.asset('images/logo.png'),
            ),
            SizedBox(
              height: 0.04 * MediaQuery.of(context).size.width,
            ),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {},
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                hintText: 'Enter Your Email',
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange, width: 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 0.05 * MediaQuery.of(context).size.width,
            ),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {},
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                hintText: 'Enter Your Email',
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange, width: 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 0.05 * MediaQuery.of(context).size.width,
            ),
            MyButton(
                color: Colors.blue[800]!, title: 'Register', onPressed: () {})
          ],
        ),
      ),
    );
  }
}
