import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text field controllers for username and password
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Username text field
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Username",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blue.shade900, width: 2.0))),
                ),
              ),
              SizedBox(height: 10),
              // Password text field (obscure text)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Password",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blue.shade900, width: 2.0))),
                ),
              ),
              SizedBox(height: 20),
              // Login button
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.blue[900])),
                  onPressed: () {
                    ();
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
