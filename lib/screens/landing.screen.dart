import '../widgets/item.widget.dart';

import '../widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Landing",
        ),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: ItemWidget(),
      ),
    );
  }
}