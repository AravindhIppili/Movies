import 'package:flutter/material.dart';
import 'package:movies/const.dart';
import 'package:movies/data/user.dart';
import 'package:movies/screens/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> passkey = GlobalKey<FormState>();

  GlobalKey<FormState> namekey = GlobalKey<FormState>();

  String password = '', name = '';

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: kDefPadding,
          child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              Theme(
                child: Form(
                  key: namekey,
                  child: TextFormField(
                    validator: (String? name) {
                      if (name == null) {
                        return "Required *";
                      } else {
                        name = name;
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: "Name",
                      labelStyle:
                          TextStyle(fontSize: 16, color: Colors.grey.shade400),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color(0xff34456e),
                          )),
                    ),
                  ),
                ),
                data:
                    Theme.of(context).copyWith(primaryColor: Color(0xff34456e)),
              ),
              SizedBox(
                height: 40,
              ),
              Theme(
                child: Form(
                  key: passkey,
                  child: TextFormField(
                    obscureText: _obscureText,
                    validator: (String? name) {
                      if (name == null) {
                        return "Required *";
                      } else {
                        password = name;
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: "Password",
                      labelStyle:
                          TextStyle(fontSize: 16, color: Colors.grey.shade400),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color(0xff34456e),
                          )),
                      suffixIcon: new GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: new Icon(_obscureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                  ),
                ),
                data: Theme.of(context).copyWith(
                  primaryColor: Color(0xff34456e),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: TextButton(
                  onPressed: () async {
                    if (namekey.currentState!.validate() &&
                        passkey.currentState!.validate()) {
                      if (name == user.name && password == user.password) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Movies()),
                            (route) => false);
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  content: Text(
                                    "Invali details",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ));
                      }
                    }
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xff6673b4),
                          Color(0xff5867a2),
                          Color(0xff3f507f),
                          Color(0xff34456e)
                        ],
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      constraints: BoxConstraints(
                          maxWidth: double.infinity, minHeight: 50),
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                            letterSpacing: 2,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
