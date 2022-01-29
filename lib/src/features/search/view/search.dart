import 'package:youcondo/core/model/scheduling.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  final Scheduling? scheduling;
  const SearchScreen({Key? key, this.scheduling}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(scheduling != null ? scheduling!.status! : 'Pesquisa'),
      ),
    );
  }
}
