import 'package:ecommerce_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/common/widgets/container/header_component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            PrimaryHeaderComponent(
                child: Column(
              children: [
                // AppBar
                HomeAppBar(),
              ],
            )),

            // Search

            // Categories

            // Products

            // Footer
          ],
        ),
      ),
    );
  }
}
