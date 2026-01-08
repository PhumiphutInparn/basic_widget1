import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 232, 67, 251),
          title: const Text('Basic Widgets', style: TextStyle(color: Colors.white)),
        ),
        
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              Column(
                children: [
                
                  Image.asset(
                    'images/ass1.gif',
                    height: 200, 
                  ), 
                ],
              ),
              
              const SizedBox(height: 20), 
              
              const Text(
                'Hello World!',
                style: TextStyle(fontSize: 20, color: Colors.black54),
              ),
              Container(
                width: 200,
                height: 100,
                color: Colors.blue.shade100,
              )
            ],
          ),
        ),

        
        floatingActionButton: FloatingActionButton(
          onPressed: () {}, 
          backgroundColor: Colors.orange, 
          child: const Text('Click Me'),
        ),
        
      ),
    );
  }
}