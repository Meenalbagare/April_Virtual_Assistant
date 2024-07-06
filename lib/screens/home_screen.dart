import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/april.jpeg"),
            fit: BoxFit.cover,
            ),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                // height: 60,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:30.0),
                          child: SizedBox(
                            height: 60.0,
                              child: Image.asset(
                                'assets/april_perslogo.png',
                              ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:40.0,left:5.0),
                          child: SizedBox(width: 100.0,
                              child: const Text(
                                "APRIL",
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 30,
                                  letterSpacing: 2,
                                ),
                              )
                          ),
                        )
                      ]
                    )
                  ],
                ),
              ),
            ]
          )
       )
    );
  }
}
