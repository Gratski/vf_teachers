import 'package:flutter/material.dart';
import 'package:teachers/components/buttons/VFFlatButtonPrimary.dart';
import 'package:teachers/components/inputs/VFTextInput.dart';

class PasswordRecoveryScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailInputController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            child: Icon(Icons.arrow_back, color: Colors.black,),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
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
                    VFFlatButtonPrimary('enviar', () {
                      if (_formKey.currentState.validate()) {}
                    }),
                  ],
                ),
              ),
            ),
          )
        )
    );
  }

  String _emailValidator(String input) {
    if (input != null && !input.isEmpty) {
      return null;
    }
    return 'Email inválido';
  }
}
