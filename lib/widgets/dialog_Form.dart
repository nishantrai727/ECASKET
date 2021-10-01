import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/account_screen.dart';

import '../providers/account.dart';

class DialogForm extends StatefulWidget {
  @override
  _DialogFormState createState() => _DialogFormState();
}

class _DialogFormState extends State<DialogForm> {
  final GlobalKey<FormState> _forKey = GlobalKey();

  final Map _accountData = {
    "name": "",
    "email": "",
    "phoneNo": "",
    "address": "",
  };

  Future<void> _submitForm() async {
    if (!_forKey.currentState.validate()) {
      return;
    }

    _forKey.currentState.save();

    try {
      Provider.of<Account>(context, listen: false).addAccountDetails(
        _accountData["name"],
        _accountData["email"],
        _accountData["phoneNo"],
        _accountData["address"],
      );
    } catch (error) {
      print(error);
      throw (error);
    }

    Navigator.of(context).popAndPushNamed(AccountScreen.routeName);

  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return AlertDialog(
      content: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 8,
        child: Container(
          height: 350,
          constraints: BoxConstraints(
            minHeight: 350,
          ),
          width: deviceSize.width * 0.75,
          padding: EdgeInsets.all(16),
          child: Form(
            key: _forKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    onTap: () async {
                      await Future.delayed(Duration(milliseconds: 500));
                      RenderObject object =
                          _forKey.currentContext.findRenderObject();
                      object.showOnScreen();
                    },
                    decoration: InputDecoration(labelText: "Name"),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) {
                      _accountData["name"] = value;
                    },
                  ),
                  TextFormField(
                    onTap: () async {
                      await Future.delayed(Duration(milliseconds: 500));
                      RenderObject object =
                          _forKey.currentContext.findRenderObject();
                      object.showOnScreen();
                    },
                    decoration: InputDecoration(labelText: "Email"),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      print(value);
                      if (value.isEmpty || !value.contains("@")) {
                        return "Invalid email";
                      }

                      return null;
                    },
                    onSaved: (value) {
                      _accountData["email"] = value;
                    },
                  ),
                  TextFormField(
                    onTap: () async {
                      await Future.delayed(Duration(milliseconds: 500));
                      RenderObject object =
                          _forKey.currentContext.findRenderObject();
                      object.showOnScreen();
                    },
                    decoration: InputDecoration(labelText: "Phone Number"),
                    // obscureText: true,
                    validator: (value) {
                      if (value.isEmpty || value.length < 9) {
                        return ("Enter valid phone number!");
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _accountData["phoneNo"] = value;
                    },
                  ),
                  TextFormField(
                    onTap: () async {
                      await Future.delayed(Duration(milliseconds: 500));
                      RenderObject object =
                          _forKey.currentContext.findRenderObject();
                      object.showOnScreen();
                    },
                    decoration: InputDecoration(labelText: "Address"),
                    onSaved: (value) {
                      _accountData["address"] = value;
                    },
                    // obscureText: true,
                    validator: null,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    child: Text(
                      "SUBMIT",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    onPressed: _submitForm,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
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
