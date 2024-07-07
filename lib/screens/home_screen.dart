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
                height: 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/april_perslogo.png',
                          height: 60,
                        ),
                        Text("APRIL",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 30,
                          letterSpacing: 2,
                        ),),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.image_search, color: Colors.white)),
                    )

                  ],
                ),
              ),
              Expanded(child: ListView()),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 16),
                child: Row(
                  children: [
                    Expanded(child: TextField(
                      style: TextStyle(color: Colors.black),
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100)
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide(

                            color: Theme.of(context).primaryColor
                        ),
                      )),

                    )),
                    const SizedBox(width: 12),
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.deepPurpleAccent,
                        child: Center(
                          child: Icon(Icons.send,color: Colors.white,),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ]
          )
       )
    );
  }
}
