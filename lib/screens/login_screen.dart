import 'package:flutter/material.dart';
import 'package:meditation_app/constants.dart';
import 'package:meditation_app/screens/home_screen.dart';

class FormValidation extends StatefulWidget {
  const FormValidation({super.key});

  @override
  State<FormValidation> createState() => _FormValidationState();
}

class _FormValidationState extends State<FormValidation> {
  final _password = TextEditingController();
  final _email = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(backgroundColor: Color(0xFFF2BEA1)),
      // drawer: Drawer(backgroundColor: Colors.grey),
      body: OverflowBox(
        minHeight: 10,
        child: Container(
          decoration: BoxDecoration(color: Color.fromARGB(255, 242, 224, 215)),
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Form(
                key: _formkey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Text(
                      //   "Login",
                      //   style: TextStyle(
                      //     fontSize: 20,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      SizedBox(height: 80),
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(
                            "https://thumbs.dreamstime.com/b/young-african-american-woman-meditating-sitting-lotus-natural-background-girl-nature-concept-illustration-yoga-179149883.jpg"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) {
                          bool validation1 = value!.contains('@');
                          bool validation2 = value!.contains('.');
                          if (!(validation1 && validation2)) {
                            return "Use a suitable email address";
                          }
                        },
                        controller: _email,
                        decoration: InputDecoration(
                            labelText: "Email",
                            hintText: "example@email.com",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)))),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        validator: (value) {
                          bool validatorCapital =
                              value!.contains(RegExp(r'[A-Z]'), 1);
                          bool validatorNumber =
                              value!.contains(RegExp(r'[0-9]'), 1);
                          bool validatorLength = value.length >= 8;
                          if (!(validatorCapital &&
                              validatorNumber &&
                              validatorLength)) {
                            return "Password must contain one number, capital letter and at least 8 characters";
                          }
                        },
                        controller: _password,
                        obscureText: true,
                        obscuringCharacter: "●",
                        decoration: InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            )),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: Text(
                            "Should contain number, capitalized letter and\n special characters",
                            textAlign: TextAlign.center),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              email = _email.text;
                              password = _password.text;
                            });

                            // To push using the stack method

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );

                            // Routing pages
                          }
                        },
                        child: Text("Login"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          elevation: 5,
                          padding: EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 15, bottom: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),

                      // SizedBox(height: 20),
                      // Text(
                      //   "Email: $email\nPassword: $password",
                      //   style: TextStyle(
                      //     fontSize: 15,
                      //   ),
                      // ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
