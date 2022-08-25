import 'package:flutter/material.dart';

import 'all_jokes.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(icon: Text('Any')),
              Tab(icon: Text('Misc')),
              Tab(icon: Text('Programming')),
              Tab(icon: Text('Dark')),
              Tab(icon: Text('Pun')),
              Tab(icon: Text('Spooky')),
              Tab(icon: Text('Christmas')),
            ],
          ),
          title: const Text('Jokes App'),
        ),
        body: const TabBarView(
          children: [
            AnyJokes(),
            Icon(Icons.directions_transit, size: 350),
            Icon(Icons.directions_car, size: 350),
            Icon(Icons.directions_car, size: 350),
            Icon(Icons.directions_car, size: 350),
            Icon(Icons.directions_car, size: 350),
            Icon(Icons.directions_car, size: 350),
          ],
        ),
      ),
    );
  }
}
