import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Dashboard",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 30),
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("images/doctor1.jpg"),
            ),
            title: Text(
              "profile",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Name: Jeevan Aher",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "Email:jeevan123@gmail.com",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "DOB:08/03/2002",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "Gender:Male",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Divider(height: 40),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.redAccent.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.info_outline_rounded,
                color: Colors.redAccent,
                size: 35,
              ),
            ),
            title: Text(
              "Log Out",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
