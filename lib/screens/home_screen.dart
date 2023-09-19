import 'package:elderlyconnect/screens/callapp1.dart';
import 'package:elderlyconnect/screens/callapp2.dart';
import 'package:elderlyconnect/screens/callapp3.dart';
import 'package:elderlyconnect/screens/callapp4.dart';
import 'package:elderlyconnect/screens/volhome_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:elderlyconnect/screens/app1.dart';
import 'package:elderlyconnect/screens/appointment_screen1.dart';

import 'package:elderlyconnect/screens/appointment_screen3.dart';
import 'package:elderlyconnect/screens/appointment_screen4.dart';
import 'package:elderlyconnect/screens/checkers.dart';
import 'package:elderlyconnect/screens/schedule_screen.dart';
import 'package:elderlyconnect/screens/sudoku.dart';
import 'package:elderlyconnect/screens/tictac.dart';

class HomeScreen extends StatelessWidget {
  List games = [
    "Tic Tac Toe",
    "Snake Ladder",
    "Sudoku",
    "Word Puzzle",
  ];
  List volaname = [
    "Jeevan Aher",
    "Sakshi Jagdale",
    "Virendra Dhanray",
    "shreya Bagul",
  ];

  List imgs = [
    "vol4.png",
    "vol3.png",
    "vol3.png",
    "vol4.png",
    "vol4.png",
    "vol3.png",
  ];

  String name = "";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hello $name",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScheduleScreen(),
                            ));
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color(0xFF7165D6),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              spreadRadius: 4,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 300,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.add,
                                color: Color(0xFF7165D6),
                                size: 35,
                              ),
                            ),
                            SizedBox(height: 30),
                            Text(
                              "Schedule an Activity",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "Play, Compete, Win: It's Game Time !!",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TicTacToeApp(),
                            ));
                        // Add your code for the first container's onTap event
                        print('Tapped on the first container');
                      },
                      child: Container(
                        height: 40,
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                          color: Color(0xFFF4F6FA),
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
                            'Tic Tac Toe',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ));
                        // Add your code for the second container's onTap event
                        print('Tapped on the second container');
                      },
                      child: Container(
                        height: 40,
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                          color: Color(0xFFF4F6FA),
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
                            'Matching Game',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SimonSaysApp(),
                            ));
                        // Add your code for the third container's onTap event
                        print('Tapped on the third container');
                      },
                      child: Container(
                        height: 40,
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                          color: Color(0xFFF4F6FA),
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
                            'Simon Says Game',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "Popular Volunteers",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => videoCalling1(),
                          ));
                    },
                    child: Container(
                      width: screenWidth * 0.9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(255, 29, 101, 169),
                              Color.fromARGB(255, 76, 56, 209),
                              const Color.fromARGB(255, 255, 255, 255),
                            ],
                            stops: [
                              0.0,
                              0.5,
                              1.0
                            ], // Smooth transition from red to blue
                          )),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 70, // Set the width of the container
                                  height: 70, // Set the height of the container
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 4,
                                        spreadRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: Image.asset(
                                    'images/vol4.png', // Replace with the path to your image asset
                                    // You can adjust the image fit as needed
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(width: 40),
                              Row(
                                children: [
                                  Text(
                                    volaname[0],
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                              Row(
                                children: [Text("Rating: 4.9")],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => videoCalling2(),
                              ));
                        },
                        child: Container(
                          width: screenWidth * 0.9,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color.fromARGB(255, 29, 101, 169),
                                  Color.fromARGB(255, 76, 56, 209),
                                  const Color.fromARGB(255, 255, 255, 255),
                                ],
                                stops: [
                                  0.0,
                                  0.5,
                                  1.0
                                ], // Smooth transition from red to blue
                              )),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width:
                                          70, // Set the width of the container
                                      height:
                                          70, // Set the height of the container
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 4,
                                            spreadRadius: 2,
                                          ),
                                        ],
                                      ),
                                      child: Image.asset(
                                        'images/vol4.png', // Replace with the path to your image asset
                                        // You can adjust the image fit as needed
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  SizedBox(width: 40),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        volaname[1],
                                        style: TextStyle(fontSize: 20),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [Text("Rating: 4.9")],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => videoCalling3(),
                              ));
                        },
                        child: Container(
                          width: screenWidth * 0.9,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color.fromARGB(255, 29, 101, 169),
                                  Color.fromARGB(255, 76, 56, 209),
                                  const Color.fromARGB(255, 255, 255, 255),
                                ],
                                stops: [
                                  0.0,
                                  0.5,
                                  1.0
                                ], // Smooth transition from red to blue
                              )),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width:
                                          70, // Set the width of the container
                                      height:
                                          70, // Set the height of the container
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 4,
                                            spreadRadius: 2,
                                          ),
                                        ],
                                      ),
                                      child: Image.asset(
                                        'images/vol4.png', // Replace with the path to your image asset
                                        // You can adjust the image fit as needed
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  SizedBox(width: 40),
                                  Row(
                                    children: [
                                      Text(
                                        volaname[2],
                                        style: TextStyle(fontSize: 20),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [Text("Rating: 4.9")],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => videoCalling4(),
                              ));
                        },
                        child: Container(
                          width: screenWidth * 0.9,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color.fromARGB(255, 29, 101, 169),
                                  Color.fromARGB(255, 76, 56, 209),
                                  const Color.fromARGB(255, 255, 255, 255),
                                ],
                                stops: [
                                  0.0,
                                  0.5,
                                  1.0
                                ], // Smooth transition from red to blue
                              )),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width:
                                          70, // Set the width of the container
                                      height:
                                          70, // Set the height of the container
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 4,
                                            spreadRadius: 2,
                                          ),
                                        ],
                                      ),
                                      child: Image.asset(
                                        'images/vol4.png', // Replace with the path to your image asset
                                        // You can adjust the image fit as needed
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  SizedBox(width: 40),
                                  Row(
                                    children: [
                                      Text(
                                        volaname[3],
                                        style: TextStyle(fontSize: 20),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [Text("Rating: 4.9")],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
