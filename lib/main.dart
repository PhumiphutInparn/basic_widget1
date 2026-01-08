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
  // --- ส่วนเก็บตัวแปร (State) ---
  
  // กำหนดรูปเริ่มต้น (เช่น dice-1.png)
  // *เช็คชื่อไฟล์ในโฟลเดอร์ images ของคุณให้ตรงเป๊ะๆ นะครับ*
  String activeDice = 'images/dice-1.png'; 

  // --- ฟังก์ชันสุ่มเลข (จากรูปที่คุณส่งมา) ---
  void rollDice() {
    setState(() {
      // สุ่มเลข 1 ถึง 6
      var dice = Random().nextInt(6) + 1; 
      
      // เปลี่ยนชื่อไฟล์รูปภาพตามเลขที่สุ่มได้
      // (ต้องแน่ใจว่าคุณมีไฟล์ชื่อ dice-1.png ถึง dice-6.png ในโฟลเดอร์ images)
      activeDice = 'images/dice-$dice.png'; 
      
      print('Rolled: $dice'); // ปริ้นท์ดูใน Terminal
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // พื้นหลัง Gradient
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