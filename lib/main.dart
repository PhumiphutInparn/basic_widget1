import 'package:flutter/material.dart';
import 'dart:math'; // 1. ต้องเพิ่มบรรทัดนี้ เพื่อให้ใช้ Random ได้
 
void main() {
  runApp(const MainApp());
}
 
class MainApp extends StatelessWidget {
  const MainApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: DicePage(), // เรียกใช้หน้า DicePage ที่เราสร้างใหม่ด้านล่าง
      ),
    );
  }
}
 
// 2. สร้าง StatefulWidget (ส่วนที่ทำให้หน้าจอเปลี่ยนรูปได้)
class DicePage extends StatefulWidget {
  const DicePage({super.key});
 
  @override
  State<DicePage> createState() => _DicePageState();
}
 
class _DicePageState extends State<DicePage> {
  String activeDice = 'images/dice-1.png';
 
  
  void rollDice() {
    setState(() {
    
      var dice = Random().nextInt(6) + 1;
     
      activeDice = 'images/dice-$dice.png';
     
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, Colors.blue, Colors.green],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              activeDice,
              height: 200,
            ),
           
            const SizedBox(height: 20),
           
           
            TextButton(
              onPressed: rollDice,
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(16),
              ),
              child: const Text(
                'Roll the Dice',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}