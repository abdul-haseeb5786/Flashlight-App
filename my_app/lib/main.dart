import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';

void main() {
  runApp(FlashlightApp());
}

class FlashlightApp extends StatefulWidget {
  @override
  _FlashlightAppState createState() => _FlashlightAppState();
}

class _FlashlightAppState extends State<FlashlightApp> {
  bool isOn = false;

  Future<void> toggleFlashlight() async {
    try {
      if (isOn) {
        await TorchLight.disableTorch();
      } else {
        await TorchLight.enableTorch();
      }
      setState(() {
        isOn = !isOn;
      });
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not toggle flashlight: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: isOn ? Colors.black : Colors.white,
        appBar: AppBar(
          title: Text('Flashlight App'),
          backgroundColor: isOn ? Colors.grey : Colors.blue,
        ),
        body: Center(
          child: IconButton(
            iconSize: 120,
            icon: Icon(
              isOn ? Icons.flashlight_on : Icons.flashlight_off,
              color: isOn ? Colors.yellow : Colors.grey,
            ),
            onPressed: toggleFlashlight,
          ),
        ),
      ),
    );
  }
}
