import 'package:flutter/material.dart';
import 'package:movies/const.dart';
import 'package:movies/data/user.dart';
import 'package:movies/screens/login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> emailkey = GlobalKey<FormState>();

  GlobalKey<FormState> passkey = GlobalKey<FormState>();

  GlobalKey<FormState> namekey = GlobalKey<FormState>();

  GlobalKey<FormState> phkey = GlobalKey<FormState>();

  String email = '', password = '', name = '', phn = '';

  bool isLoad = false;

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: kDefPadding,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 150,
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
              data: Theme.of(context).copyWith(primaryColor: Color(0xff34456e)),
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
            Theme(
              child: Form(
                key: emailkey,
                child: TextFormField(
                  validator: (String? name) {
                    if (name == null) {
                      return "Required *";
                    } else {
                      email = name;
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: "Email ID",
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
              data: Theme.of(context).copyWith(primaryColor: Color(0xff34456e)),
            ),
            SizedBox(
              height: 40,
            ),
            Theme(
              child: Form(
                key: phkey,
                child: TextFormField(
                  validator: (String? name) {
                    if (name == null) {
                      return "Required *";
                    } else {
                      phn = name;
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.call),
                    labelText: "Phone number",
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
              data: Theme.of(context).copyWith(primaryColor: Color(0xff34456e)),
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
                      emailkey.currentState!.validate() &&
                      passkey.currentState!.validate() &&
                      phkey.currentState!.validate()) {
                    user = User(name, password, email, phn, "pro");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
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
                      "REGISTER",
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
    ));
  }
}
