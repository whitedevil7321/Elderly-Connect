import 'package:elderlyconnect/screens/volhome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:elderlyconnect/screens/sign_up_screen.dart';
import 'package:elderlyconnect/widgets/navbar_roots.dart';

class volloginScreen extends StatefulWidget {
  @override
  State<volloginScreen> createState() => _volloginScreenState();
}

class _volloginScreenState extends State<volloginScreen> {
  bool passToggle = true;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset(
                  "images/doctors.png",
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Enter Username"),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextField(
                  obscureText: passToggle ? true : false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Enter Password"),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        if (passToggle == true) {
                          passToggle = false;
                        } else {
                          passToggle = true;
                        }
                        setState(() {});
                      },
                      child: passToggle
                          ? Icon(CupertinoIcons.eye_slash_fill)
                          : Icon(CupertinoIcons.eye_fill),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(15),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => volHomeScreen(),
                        ));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFF7165D6),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
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
