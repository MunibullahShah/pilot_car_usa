import 'package:flutter/material.dart';
import 'package:pilot_car_usa/Screens/form_screen.dart';
import 'package:pilot_car_usa/widgets/custom_button.dart';
import 'package:pilot_car_usa/widgets/custom_text_field.dart';

class SigningScreen extends StatefulWidget {
  final String title;

  const SigningScreen({Key key, this.title}) : super(key: key);

  @override
  _SigningScreenState createState() => _SigningScreenState();
}

class _SigningScreenState extends State<SigningScreen> {
  final _registrationController = TextEditingController();
  final _passwordController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    print('Login');
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Image.asset(
                    'assets/logo.png',
                    height: 160,
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  CustomTextField(
                    controller: _registrationController,
                    label: 'email',
                    hintText: '',
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (v) {
                      _passwordFocus.requestFocus();
                    },
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  CustomTextField(
                    controller: _passwordController,
                    obscureText: true,
                    label: 'Password',
                    textInputAction: TextInputAction.done,
                    focusNode: _passwordFocus,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  CustomButton(
                    label: 'Login',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return FormScreen();
                        }),
                      );
                    },
                    type: CustomButtonTypes.primary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
