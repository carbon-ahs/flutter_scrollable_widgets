// ignore_for_file: unused_import, unused_local_variable

import 'package:flutter/material.dart';
import '../components/components.dart';
import '../models/models.dart';
import '../api/mock_fooderlich_service.dart';

class ExploreScreen extends StatelessWidget {
// 1
  final mockService = MockFooderlichService();
  ExploreScreen({super.key});
  @override
  Widget build(BuildContext context) {
// 2
// TodayRecipeListView FutureBuilder
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final recipes = snapshot.data?.todayRecipes ?? [];
          // TodayRecipeListView
          return TodayRecipeListView(recipes: recipes);

          // return Center(
          //   child: Container(
          //     child: const Text('Show TodayRecipeListView'),
          //   ),
          // );
        } else {
          // 6
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
