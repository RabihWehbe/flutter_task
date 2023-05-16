import 'package:flutter/material.dart';

class Register extends StatefulWidget {

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  // text field state
  String name = '';
  String email = '';
  String password ='';
  String confirmPassowrd = '';
  //String error = '';
  bool _obscureText = true;

  var textInputDecoration = const InputDecoration(
    fillColor: Colors.white70,
    //setting background color by filled
    filled: true,

    //setting outline border
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white,width: 2)
    ),

    //setting a focus border or onClick border:
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.pink,width: 2)
    ),
  );

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Register'),
        actions: [
          ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  elevation: 0,
                  side: BorderSide.none
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.production_quantity_limits),
                  Text('Products'),
                ],
              )
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Name'),

                    validator: (val) {
                      if(val == null || val.isEmpty){
                        return 'enter name';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Email'),

                    validator: (val) {
                      if(val == null || val.isEmpty){
                        return 'enter email';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                  ),

                  SizedBox(height: 20,),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility : Icons.visibility_off,
                          color: _obscureText ? Colors.grey : Theme.of(context).iconTheme.color,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                    validator: (val) {
                      if(val == null || val.length < 7){
                        return 'Enter a password 7+ chars long';
                      }

                      // Check for at least one capital letter
                      if (!val.contains(RegExp(r'[A-Z]'))) {
                        return 'Password must contain at least one capital letter';
                      }

                      // Check for at least one number
                      if (!val.contains(RegExp(r'[0-9]'))) {
                        return 'Password must contain at least one number';
                      }

                      // Check for at least one special character
                      if (!val.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                        return 'Password must contain at least one special character';
                      }

                      return null;
                      return null;
                    },
                    obscureText: _obscureText,
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),


                  SizedBox(height: 20,),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'confirm password'),
                    validator: (val) {
                      if(val == null || val == ''){
                        return 'passowrd confirmation is required';
                      }
                      if (val != password) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        confirmPassowrd = value;
                      });
                    },
                  ),

                  SizedBox(height: 20,),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink,
                    ),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      bool isValid = false;
                      isValid = _formKey.currentState?.validate() ?? false;
                      if(isValid){
                        setState(() {

                        });


                        // if(result == null){
                        //   setState(() {
                        //     error = 'could not sign in with those credentials';
                        //     loading = false;
                        //   });
                        // }
                      }
                    },
                  ),

                  SizedBox(height: 12,),

                  // Text(error,
                  //   style: TextStyle(
                  //       color: Colors.red,
                  //       fontSize: 14
                  //   ),
                  // )
                ],
              ),
            )
        ),
      ),
    );
  }
}
