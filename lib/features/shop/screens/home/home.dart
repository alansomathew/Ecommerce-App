
import 'package:ecommerce_app/common/widgets/container/header_component.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            PrimaryHeaderComponent(
                child: Column(
              children: [],
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


