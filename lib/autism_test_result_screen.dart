import 'package:flutter/material.dart';

class AutismResult extends StatelessWidget {
  const AutismResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Result',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          shadowColor: Colors.grey,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  'Your child is at very high risk, please consult immediately ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue[100],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'The Screening test for autism is positive . To confirm the diagnosis book a consultation with us or go to nearby pediatric neurologist',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                btn("Join our parents Community"),
                const SizedBox(height: 10),
                btn("Chat with Doctors")
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget btn(String text) {
  return Container(
    padding: const EdgeInsets.all(15),
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.orange),
      borderRadius: BorderRadius.circular(100),
      color: Colors.orange,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(1),
          spreadRadius: 1,
          blurRadius: 5,
          offset: const Offset(0, 5),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
        const Icon(
          Icons.arrow_right_alt_rounded,
          color: Colors.white,
        )
      ],
    ),
  );
}
