import 'package:flutter/material.dart';

class FarmingFeature {
  final String title;
  final IconData icon;

  const FarmingFeature({
    required this.title,
    required this.icon,
  });
}

class FarmingFeatureItem extends StatelessWidget {
  final FarmingFeature feature;

  const FarmingFeatureItem({Key? key, required this.feature}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            height: 70,
            decoration: BoxDecoration(
              color: const Color(0xFFFFECDF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Icon(
                feature.icon,
                size: 35.0,
                color: Colors.green,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            feature.title,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 10.0,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

class FarmingFeatures extends StatelessWidget {
  final List<FarmingFeature> features; // List of farming features

  const FarmingFeatures({Key? key, required this.features}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 100.0, // Adjust max width of each card
      childAspectRatio: 0.75, // Adjust aspect ratio for desired sizing
      padding: const EdgeInsets.all(16.0),
      mainAxisSpacing: 15.0, // Spacing between rows
      crossAxisSpacing: 20.0, // Spacing between columns
      children: features
          .map((feature) => FarmingFeatureItem(feature: feature))
          .toList(),
    );
  }
}
