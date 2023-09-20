import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

@override
class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  bool showPassword1 = false;
  bool showPassword2 = false;

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 70, 16, 16),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text(
                    "Let's get started! Sign up with your",
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
                Center(
                  child: Text(
                    "company email below.",
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Company name',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Container(
                  height: 50,
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'Your Company Name',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      // focusedBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(color: Colors.transparent))
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Company email',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Container(
                  height: 50,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'your.name@company.com',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      // focusedBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(color: Colors.transparent))
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Password',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Container(
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        // focusedBorder: OutlineInputBorder(
                        //     borderSide: BorderSide(color: Colors.transparent)),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              showPassword1 = !showPassword1;
                            });
                          },
                          child: Icon(showPassword1
                              ? Icons.visibility
                              : Icons.visibility_off),
                        )),
                    obscureText: !showPassword1,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Confirm Password',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Container(
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        // focusedBorder: OutlineInputBorder(
                        //     borderSide: BorderSide(color: Colors.transparent)),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              showPassword2 = !showPassword2;
                            });
                          },
                          child: Icon(showPassword2
                              ? Icons.visibility
                              : Icons.visibility_off),
                        )),
                    obscureText: !showPassword2,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style:
                          ElevatedButton.styleFrom(primary: Colors.deepPurple),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.lightGreen),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?'),
                    SizedBox(
                      width: 5.0,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Sign In',
                          style: TextStyle(color: Colors.deepPurple),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
