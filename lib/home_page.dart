import 'package:flutter/material.dart';
import 'package:task/autism_page.dart';
import 'package:task/vaccination_tracking_screen.dart';
import 'package:task/widget/grid_items.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            color: const Color.fromARGB(255, 183, 220, 250),
            elevation: 8.0,
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  10.0), 
            ),
            child: Padding(
              padding: const EdgeInsets.all(
                  16.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 16, 76, 125),
                      borderRadius: BorderRadius.circular(80),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.child_care,
                        color: Colors.white,
                        size: 100,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  const Flexible(
                    child: Text(
                      "Find the perfect card for your child: Explore Our Plans Now!",
                      style: TextStyle(
                        color: Color.fromARGB(255, 4, 70, 124),
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          child: Expanded(
            child: GridView.count(
              physics: BouncingScrollPhysics(),
              crossAxisCount: 2,
              padding: const EdgeInsets.all(10.0),
              childAspectRatio: 9.0 / 9.0,
              children: <Widget>[
                FeatureItem(
                  icon: Icons.question_answer,
                  label: 'Questions & Answers',
                  onTap: () {},
                  color: Colors.green,
                ),
                FeatureItem(
                  icon: Icons.local_hospital,
                  label: 'Consult a doctor',
                  onTap: () {},
                  color: Colors.blue,
                ),
                FeatureItem(
                  icon: Icons.music_note,
                  label: 'White Noise',
                  onTap: () {},
                  color: Colors.red,
                ),
                FeatureItem(
                  icon: Icons.dashboard,
                  label: 'Autism detection test(18m+)',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AutismPage(),
                      ),
                    );
                  },
                  color: Colors.cyan,
                ),
                FeatureItem(
                  icon: Icons.medical_services,
                  label: 'Track Vaccination',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VaccineTrackerScreen(),
                      ),
                    );
                  },
                  color: Colors.orange,
                ),
                FeatureItem(
                  icon: Icons.group,
                  label: 'Join Community',
                  onTap: () {
                    
                  },
                  color: Colors.transparent,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

