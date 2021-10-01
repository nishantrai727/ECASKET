import 'dart:convert';

import 'package:ECASKET/models/http_exception.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
// import '../providers/account.dart';

// import '../widgets/dialog_Form.dart';

enum AuthMode { Signup, Login }

class AuthScreen extends StatelessWidget {
  static const routeName = "/auth";

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColorLight.withOpacity(0.4),
                    Theme.of(context).primaryColorLight.withOpacity(1),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0, 1]),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/auth_screen/shopper.png"))),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.only(bottom: 20),
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 80,
                      ),
                      // transform: Matrix4.rotationZ((-8* pi/180))..translate(-10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).primaryColor,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 8,
                                color: Colors.black38,
                                offset: Offset(0, 2))
                          ]),
                      child: Text(
                        "eCasket",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: "Nunito-Regular",
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: AuthCard(),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AuthCard extends StatefulWidget {
  const AuthCard({
    Key key,
  }) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  AuthMode _authMode = AuthMode.Login;

  Map<String, String> _authData = {
    "email": "",
    "password": "",
  };

  var _isLoading = false;

  final _passwordController = TextEditingController();

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("An Error Occured!"),
        content: Text(message),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.pop(ctx);
            },
            child: Text("Okay"),
          )
        ],
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });

    try {
      if (_authMode == AuthMode.Login) {
        await Provider.of<Auth>(context, listen: false).login(
          _authData["email"],
          _authData["password"],
        );
      } else {
        await Provider.of<Auth>(context, listen: false).signup(
          _authData["email"],
          _authData["password"],
        );
      }
    } on HttpException catch (error) {
      var errorMessage = "Authentication Failed!";
      if (error.toString().contains("EMAIL_EXISTS")) {
        errorMessage = "This email already exists";
      } else if (error.toString().contains("INVALID_EMAIL")) {
        errorMessage = "Invalid email";
      } else if (error.toString().contains("WEAK_PASSWORD")) {
        errorMessage = "Passwors is too weak";
      } else if (error.toString().contains("EMAIL_NOT_FOUND")) {
        errorMessage = "Cannot find an user with this email";
      } else if (error.toString().contains("INVALID_PASSWORD")) {
        errorMessage = "Invalid Password";
      }

      _showErrorDialog(errorMessage);
    } catch (error) {
      print(json.decode(error));
      const errorMessage = "Could not authenticate you.Try again later";
      _showErrorDialog(errorMessage);
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 8,
      child: Container(
        height: _authMode == AuthMode.Signup ? 320 : 260,
        constraints: BoxConstraints(
          minHeight: _authMode == AuthMode.Signup ? 320 : 260,
        ),
        width: deviceSize.width * 0.75,
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  onTap: () async {
                    await Future.delayed(Duration(milliseconds: 500));
                    RenderObject object =
                        _formKey.currentContext.findRenderObject();
                    object.showOnScreen();
                  },
                  decoration: InputDecoration(labelText: "Email"),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    print(value);
                    if (value.isEmpty || !value.contains("@")) {
                      return "Invalid email!";
                    }

                    return null;
                  },
                  onSaved: (value) {
                    _authData["email"] = value;
                  },
                ),
                TextFormField(
                  onTap: () async {
                    await Future.delayed(Duration(milliseconds: 500));
                    RenderObject object =
                        _formKey.currentContext.findRenderObject();
                    object.showOnScreen();
                  },
                  decoration: InputDecoration(labelText: "Password"),
                  obscureText: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value.isEmpty || value.length < 7) {
                      return ("Password is too short !");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _authData["password"] = value;
                  },
                ),
                if (_authMode == AuthMode.Signup)
                  TextFormField(
                    onTap: () async {
                      await Future.delayed(Duration(milliseconds: 500));
                      RenderObject object =
                          _formKey.currentContext.findRenderObject();
                      object.showOnScreen();
                    },
                    enabled: _authMode == AuthMode.Signup,
                    decoration: InputDecoration(labelText: "Confirm password"),
                    obscureText: true,
                    validator: _authMode == AuthMode.Signup
                        ? (value) {
                            if (value != _passwordController.text) {
                              return "Passwords do not match!";
                            }
                            return null;
                          }
                        : null,
                  ),
                SizedBox(
                  height: 20,
                ),
                if (_isLoading)
                  CircularProgressIndicator()
                else
                  RaisedButton(
                    child: Text(
                      _authMode == AuthMode.Login ? "Login" : "SIGN UP",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    onPressed: _submit,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                  ),
                FlatButton(
                  onPressed: _switchAuthMode,
                  child: Text(
                    "${_authMode == AuthMode.Login ? 'SIGNUP' : 'LOGIN'} INSTEAD",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 4),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  textColor: Colors.blue,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
