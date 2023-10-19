import 'package:ecommerce_app/common/widgets/container/circular_container.dart';
import 'package:ecommerce_app/common/widgets/curved_edges/curved_edges_widget.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
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
            CurvedEdgeWidget(
              child: Container(
                color: TColors.primary,
                padding: const EdgeInsets.all(0),
                child: SizedBox(
                  height: 400,
                  child: Stack(
                    children: [
                      Positioned(
                        top: -150,
                        right: -250,
                        child: CircularContainer(
                            backgroundColor: TColors.white.withOpacity(0.1)),
                      ),
                      Positioned(
                        top: 100,
                        right: -300,
                        child: CircularContainer(
                            backgroundColor: TColors.white.withOpacity(0.1)),
                      ),
                    ],
                  ),
                ),
              ),
            ),

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
