import 'package:flutter/material.dart';

void main() {
  runApp(const WhatsappSender());
}

class WhatsappSender extends StatefulWidget {
  const WhatsappSender({super.key});

  @override
  State<WhatsappSender> createState() => _WhatsappSenderState();
}

class _WhatsappSenderState extends State<WhatsappSender> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(),
        ));
  }
}
