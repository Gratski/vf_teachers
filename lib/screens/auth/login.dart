import 'package:flutter/material.dart';
import 'package:teachers/components/buttons/VFFlatButtonPrimary.dart';
import 'package:teachers/components/inputs/VFTextInput.dart';
import 'package:teachers/screens/auth/PasswordRecovery.dart';
import 'package:dart_amqp/dart_amqp.dart';

/**
 * Login Sccreen
 */
class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailInputController = new TextEditingController();
  TextEditingController _pwdInputController = new TextEditingController();

  LoginScreen() {
    _init();
  }

  _init() async {
    try {
      ConnectionSettings settings = new ConnectionSettings(
          host : "whale.rmq.cloudamqp.com",
          virtualHost: "uzmmozvh",
          authProvider: new AmqPlainAuthenticator("uzmmozvh","hekpyaJiCK61YIsYRqBLy2VJAvH3K41c")
      );
      Client client = new Client(settings: settings);
      client
          .channel()
          .then((Channel channel) => channel.queue("hello", durable: true))
          .then((Queue queue) => queue.consume())
          .then((Consumer consumer) => consumer.listen((AmqpMessage message) {
        print(" [x] Received string: ${message.payloadAsJson["name"]}");
      }
      ));

      client
          .channel()
          .then((Channel channel) => channel.queue("hello", durable: true))
          .then((Queue queue) => queue.publish("{\"name\":\"Joao juntou-se à aula! :)\"}"));
    } catch(e) {
      print("Ocurreu um erro ao connector a karafka");
    }
  }

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
