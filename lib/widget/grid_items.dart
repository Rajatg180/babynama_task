import 'package:flutter/material.dart';

class FeatureItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color color;

  const FeatureItem(
      {Key? key, required this.icon, required this.label, required this.onTap,required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Card(
    shadowColor: Colors.black,
    color: color,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(icon, size: 48.0, color: Colors.white),
          const SizedBox(height: 10.0),
          Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 3,
            style: const TextStyle(color: Colors.white,fontSize: 18),
          ),
        ],
      ),
    ),
  );
}
}