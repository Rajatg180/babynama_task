// import 'package:flutter/material.dart';

// class VaccineTrackerScreen extends StatefulWidget {
//   @override
//   _VaccineTrackerScreenState createState() => _VaccineTrackerScreenState();
// }

// class _VaccineTrackerScreenState extends State<VaccineTrackerScreen>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     // Initialize the TabController
//     _tabController = TabController(length: 4, vsync: this);
//   }

//   @override
//   void dispose() {
//     // Dispose of the TabController
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         iconTheme: IconThemeData(
//           color: Colors.black,
//         ),
//         elevation: 0,
//         title: const Text(
//           'Vaccination Tracker',
//           style: TextStyle(color: Colors.black),
//         ),
//         bottom: TabBar(
//           isScrollable: true,
//           unselectedLabelColor: Colors.redAccent,
//           indicatorSize: TabBarIndicatorSize.tab,
//           indicator: BoxDecoration(
//               gradient: const LinearGradient(
//                   colors: [Colors.redAccent, Colors.orangeAccent]),
//               borderRadius: BorderRadius.circular(50),
//               color: Colors.redAccent),
//           controller: _tabController,
//           tabs: const [
//             Tab(text:"Past due vaccines"),
//             Tab(text: 'Upcoming Doses'),
//             Tab(text: 'Taken Doese'),
//             Tab(text: 'All Vaccine Status'),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: [
//           VaccineList(category: 'Past Due Vaccine'),
//           VaccineList(category: 'Upcoming Doses'),
//           VaccineList(category: 'Taken Doses'),
//           VaccineList(category: 'All Vaccine Status'),
//         ],
//       ),
//     );
//   }
// }

// class VaccineList extends StatelessWidget {
//   final String category;

//   VaccineList({required this.category});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('List of $category'),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: VaccineTrackerScreen(),
  ));
}

class VaccineTrackerScreen extends StatefulWidget {
  @override
  _VaccineTrackerScreenState createState() => _VaccineTrackerScreenState();
}

class _VaccineTrackerScreenState extends State<VaccineTrackerScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Map<String, String>> _doses = [
    {
      "title": "BCG",
      "sub": "Protects against Tuberculosis",
      "status": "Pending",
    },
    {
      "title": "OPV",
      "sub": "Protects against Polio",
      "status": "Upcoming",
    },
    {
      "title": "IPV",
      "sub": "Protects against polio",
      "status": "Pending",
    },
    {
      "title": "Hepatitis B",
      "sub": "Protects against Hepatitis B virus",
      "status": "Upcoming",
    },
    {
      "title": "DPT",
      "sub": "Protects against diphtheria, pertussis and tetanus",
      "status": "Taken",
    },
    {
      "title": "HIB",
      "sub": "Proctects against Haemophilus influenza type B bacteria",
      "status": "Taken",
    },
    {
      "title": "Pneymococcal",
      "sub": "Protects against streptococcus pneumoniae bacteria",
      "status": "Pending",
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Map<String, String>> getDosesByStatus(String status) {
    return _doses.where((dose) => dose["status"] == status).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: const Text('Vaccination Tracker',
            style: TextStyle(color: Colors.black)),
        bottom: TabBar(
          physics: BouncingScrollPhysics(),
          isScrollable: true,
          unselectedLabelColor: Colors.redAccent,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [Colors.redAccent, Colors.orangeAccent]),
              borderRadius: BorderRadius.circular(50),
              color: Colors.redAccent),
          controller: _tabController,
          tabs: const [
            Tab(text: "Past Due Vaccines"),
            Tab(text: 'Upcoming Doses'),
            Tab(text: 'Taken Doses'),
            Tab(text: 'All Vaccine Status'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          VaccineList(
              category: 'Past Due Vaccine', doses: getDosesByStatus("Pending")),
          VaccineList(
              category: 'Upcoming Doses', doses: getDosesByStatus("Upcoming")),
          VaccineList(
              category: 'Taken Doses', doses: getDosesByStatus("Taken")),
          VaccineList(category: 'All Vaccine Status', doses: _doses),
        ],
      ),
    );
  }
}

class VaccineList extends StatelessWidget {
  final String category;
  final List<Map<String, String>> doses;

  VaccineList({required this.category, required this.doses});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: doses.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 12),
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
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
          child: ListTile(
            title: Text(
              doses[index]["title"]!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800
              ),
            ),
            subtitle: Text(
              doses[index]["sub"]!,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
        );
      },
    );
  }
}
