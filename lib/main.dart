import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final TextEditingController _number = TextEditingController();
String _num = "";

// final Uri _url = ;

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
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Center(child: Text('Whatsapp Sender')),
              backgroundColor: Colors.teal[800],
            ),
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://i.pinimg.com/736x/85/04/30/850430a750fb80c1ebaa5e740fc7cbd6.jpg'),
                    fit: BoxFit.cover),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    TextField(
                      controller: _number,
                      cursorColor: Colors.red,
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        // labelText: 'hey',

                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.teal,
                        ),
                        focusedBorder: InputBorder.none,
                        hintText: "Enter number with Country Code",
                        hintStyle: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.normal,
                          fontSize: 25,
                        ),
                      ),
                      onChanged: (text) {
                        _num = text;
                      },
                    ),
                    MaterialButton(
                      color: Colors.deepOrange,
                      height: 60,
                      minWidth: 150,
                      onPressed: () async {
                        if (!await launchUrl(Uri.parse('https://wa.me/$_num'),
                            mode: LaunchMode.externalApplication)) {
                          throw 'Could not launch';
                        }
                      },
                      child: const Text('Send Message'),
                    ),
                    const SizedBox(height: 10),
                  ]),
            ),
          ),
        ));
  }
}
