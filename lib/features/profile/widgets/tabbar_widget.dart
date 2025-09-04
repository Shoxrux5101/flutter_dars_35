import 'package:flutter/material.dart';

class TabbarWidget extends StatelessWidget {
  const TabbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            labelColor: Theme.of(context).colorScheme.inverseSurface,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Theme.of(context).colorScheme.inverseSurface,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
            tabs: const [
              Tab(text: "Recipe"),
              Tab(text: "Favorites"),
            ],
          ),
          TabBarView(
            children: [
              Center(child: Text("Recipe page content")),
              Center(child: Text("Favorites page content")),
            ],
          ),
        ],
      ),
    );
  }
}