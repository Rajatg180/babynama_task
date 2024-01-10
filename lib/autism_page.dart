import 'package:flutter/material.dart';
import 'package:task/autism_test_result_screen.dart';

class AutismPage extends StatefulWidget {
  const AutismPage({super.key});

  @override
  State<AutismPage> createState() => _AutismPageState();
}

class _AutismPageState extends State<AutismPage> {
  final List<String> questions = [
    "If you point at something across the room, does your child look at it?(FOR EXAMPLE,if you point at a toy or an animal , does your child look at the toy or animal?)",
    "Have you ever wondered if your child might be deaf?",
    "Does your child parented or make-believe?",
    "Does your child like climbing on the things?",
    "Does your child make unusal finger movements near his or her eyes?",
    "Does your child point with one finger to ask for something or to get help"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return MCQItem(question: questions[index]);
              },
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AutismResult()),
                );
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20),
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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Get Score",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    Icon(
                      Icons.arrow_right_alt_rounded,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MCQItem extends StatefulWidget {
  final String question;

  MCQItem({Key? key, required this.question}) : super(key: key);

  @override
  _MCQItemState createState() => _MCQItemState();
}

class _MCQItemState extends State<MCQItem> {
  Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor ?? Colors.grey),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.question, style: const TextStyle(fontSize: 16)),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ChoiceButton(
                text: 'Yes',
                color: Colors.green,
                onPressed: () => _selectAnswer(true),
              ),
              ChoiceButton(
                text: 'No',
                color: Colors.red,
                onPressed: () => _selectAnswer(false),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _selectAnswer(bool isYes) {
    setState(() {
      borderColor = isYes ? Colors.green : Colors.red;
    });
  }
}

class ChoiceButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  const ChoiceButton(
      {Key? key,
      required this.text,
      required this.color,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
            border: Border.all(color: color),
            color: color,
            borderRadius: BorderRadius.circular(100)),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const  TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
