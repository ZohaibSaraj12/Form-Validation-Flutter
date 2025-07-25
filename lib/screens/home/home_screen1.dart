import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Icon visibiltyOnIcon = Icon(Icons.visibility_outlined);
  Icon visibiltyOffIcon = Icon(Icons.visibility_off_outlined);

  bool visibiltyChanger = false;
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          "Form Validation In Flutter",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: phone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone_outlined),
                  fillColor: Colors.white60,
                  filled: true,
                  hintText: "Enter Your Phone Number (+XX format)",
                  labelText: "Phone Number",
                  labelStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Colors.green, width: 3.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Colors.green, width: 3.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 3.0),

                    borderRadius: BorderRadius.circular(20.0),
                  ),

                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 3.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter a valid password";
                  }
                  if (!value.contains("+")) {
                    return "please enter country code with (+)";
                  }
                  if (value.length < 13) {
                    return "please enter 13 digits format (+92XXXXXXXXXX)";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  fillColor: Colors.white60,
                  filled: true,
                  hintText: "Enter Your Email",
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Colors.green, width: 3.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Colors.green, width: 3.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 3.0),

                    borderRadius: BorderRadius.circular(20.0),
                  ),

                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 3.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter a valid email";
                  }
                  if (!value.contains("@")) {
                    return "you are missing @ enter a valid email";
                  }
                  if (!value.contains("gmail")) {
                    return "you are missing gmail word";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                obscureText: obscureText,
                obscuringCharacter: "●",
                style: TextStyle(color: Colors.black),
                controller: password,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        visibiltyChanger = !visibiltyChanger;
                        obscureText = !obscureText;
                      });
                    },

                    icon: visibiltyChanger == true
                        ? visibiltyOffIcon
                        : visibiltyOnIcon,
                  ),
                  fillColor: Colors.white60,
                  filled: true,
                  hintText: "Enter Your Password",
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Colors.green, width: 3.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Colors.green, width: 3.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 3.0),

                    borderRadius: BorderRadius.circular(20.0),
                  ),

                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 3.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),

                validator: (password) {
                  if (password == null || password.isEmpty) {
                     return "Please enter a valid password number";
                   }
                   return null;
                },
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(400, 30),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shadowColor: Colors.black,

                elevation: 10.0,
                side: BorderSide(color: Colors.deepOrange, width: 2.0),
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Login Successful!'),
                      backgroundColor: Colors.green, // optional
                      duration: Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                      elevation: 20.0,
                      margin: EdgeInsets.only(
                        bottom: 20.0,
                        right: 20.0,
                        left: 20.0,
                      ),
                    ),
                  );
                }
              },
              child: Text("Login", style: TextStyle(fontSize: 20.0)),
            ),
          ],
        ),
      ),
    );
  }
}
