
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
                  if (value == null || value.isEmpty || !value.contains("+")) {
                    return "Please enter a valid phone number";
                  }
                  if (value.length < 13) {
                    return "digits are less than 13";
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
