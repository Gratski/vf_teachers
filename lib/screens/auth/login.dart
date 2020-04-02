import 'package:flutter/material.dart';
import 'package:teachers/components/buttons/VFFlatButtonPrimary.dart';
import 'package:teachers/components/inputs/VFTextInput.dart';
import 'package:teachers/components/text/VFTitle.dart';
import 'package:teachers/screens/auth/PasswordRecovery.dart';

/**
 * Login Sccreen
 */
class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailInputController = new TextEditingController();
  TextEditingController _pwdInputController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Image.asset(
                      'assets/imgs/logo/logo_256.png',
                      height: 150.0,
                      width: 150.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: VFTextInput(
                        'email', true, _emailInputController, _emailValidator),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: VFTextInput('palavra-passe', false,
                        _pwdInputController, _pwdValidator),
                  ),
                  VFFlatButtonPrimary('entrar', () {
                    if (_formKey.currentState.validate()) {}
                  }),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: GestureDetector(
                      child: Text("esqueci a palavra-passe"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PasswordRecoveryScreen()),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _emailValidator(String input) {
    if (input != null && !input.isEmpty) {
      return null;
    }
    return 'Email inválido';
  }

  String _pwdValidator(String input) {
    if (input != null && !input.isEmpty) {
      return null;
    }
    return 'Palavra-passe inválida';
  }
}
