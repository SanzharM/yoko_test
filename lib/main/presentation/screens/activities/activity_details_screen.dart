import 'package:flutter/material.dart';
import 'package:yoko_test/main/domain/models/activity.dart';
import 'package:yoko_test/main/presentation/widgets/custom_app_bar.dart';

class ActivityDetailsScreen extends StatefulWidget {
  const ActivityDetailsScreen({Key? key, required this.activity}) : super(key: key);

  final Activity activity;

  @override
  State<ActivityDetailsScreen> createState() => _ActivityDetailsScreenState();
}

class _ActivityDetailsScreenState extends State<ActivityDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO SliverAppBar and Sliver body;
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.activity.nameRu ?? widget.activity.nameKk ?? widget.activity.nameEn ?? '',
        needLeading: true,
      ),
      body: Column(
        children: const <Widget>[],
      ),
    );
  }
}
