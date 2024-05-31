import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //     colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF004D71)),
        scaffoldBackgroundColor: const Color(0xFF004D71),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Create an Account'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //  title: Text(widget.title),
      //),
      body: Row(
        children: <Widget>[
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/login/images/edmonds_logo.png", width: 650),
                Image.asset("assets/login/images/makerspace_logo.png", width: 300)
              ]),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(style: TextStyle(fontSize: 30, color: Colors.white), 'Create an Account'),
              const SizedBox(height: 40),
              const Text(
                style: TextStyle(fontSize: 16, color: Colors.white),
                'Please input a valid Email and Password to create an account.',
              ),
              const SizedBox(height: 20),
              const SizedBox(
                width: 250,
                child: TextField(
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey),
                    labelStyle: TextStyle(color: Colors.white),
                    labelText: 'Email',
                    hintText: 'Ex: example@example.com',
                  ),
                ),
              ),
              const SizedBox(
                width: 250,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey),
                    labelStyle: TextStyle(color: Colors.white),
                    labelText: 'Password',
                    hintText: 'Ex: hunter2',
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF003a55)),
                child: const Text(
                    style: TextStyle(color: Colors.white), 'Create Account'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}