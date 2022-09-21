import 'package:flutter/material.dart';
import 'package:yoko_test/main/domain/models/activity.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({Key? key, required this.activity}) : super(key: key);

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(activity.description ?? ''),
    );
  }
}
