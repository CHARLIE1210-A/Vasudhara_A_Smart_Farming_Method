import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_model.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Shop'),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Seeds'),
              Tab(text: 'Plants'),
              Tab(text: 'Pesticides'),
              Tab(text: 'Equipment'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ProductList(products: seeds),
            ProductList(products: plants),
            ProductList(products: pesticides),
            ProductList(products: equipment),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class ProductList extends StatelessWidget {
  final List<Product> products;

  const ProductList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(product: product);
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              product.imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            Text(
              product.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              product.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              '\$${product.price}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implement the buy button functionality here
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Purchased ${product.name}')),
                    );
                  },
                  child: const Text('Buy'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<CartModel>(context, listen: false).add(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Added ${product.name} to cart')),
                    );
                  },
                  child: const Text('Add to Cart'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Sample data for different categories
final List<Product> seeds = [
  Product(
    name: 'Tomato Seeds',
    description: 'High-quality tomato seeds for your garden.',
    price: 2.99,
    imageUrl: 'assets/images/seed1.jpeg',
  ),
  Product(
    name: 'Bean Seeds',
    description: 'Organic bean seeds.',
    price: 1.99,
    imageUrl: 'assets/images/seed3.jpeg',
  ),
  Product(
    name: 'Carrot Seeds',
    description: 'Organic carrot seeds.',
    price: 1.99,
    imageUrl: 'assets/images/seed2.jpeg',
  ),
  Product(
    name: 'Pumpkin Seeds',
    description: 'Organic pumpkin seeds.',
    price: 1.99,
    imageUrl: 'assets/images/seed4.jpeg',
  ),
  Product(
    name: 'Potato Seeds',
    description: 'Organic potato seeds.',
    price: 1.99,
    imageUrl: 'assets/images/seed1.jpeg',
  ),
];

final List<Product> plants = [
  Product(
    name: 'Rose Plant',
    description: 'Beautiful rose plant.',
    price: 14.99,
    imageUrl: 'assets/images/plant1.jpeg',
  ),
  Product(
    name: 'Banana Plant',
    description: 'Low-maintenance banana plant.',
    price: 9.99,
    imageUrl: 'assets/images/plant2.jpeg',
  ),
  Product(
    name: 'Lemon Plant',
    description: 'Lemon plant.',
    price: 9.99,
    imageUrl: 'assets/images/plant3.jpeg',
  ),
  Product(
    name: 'Cactus Plant',
    description: 'Low-maintenance cactus plant.',
    price: 9.99,
    imageUrl: 'assets/images/plant6.jpeg',
  ),
  Product(
    name: 'Orange Plant',
    description: 'Healthy orange plant.',
    price: 9.99,
    imageUrl: 'assets/images/plant5.jpeg',
  ),
];

final List<Product> pesticides = [
  Product(
    name: 'Organic Pesticide',
    description: 'Safe and effective organic pesticide.',
    price: 12.99,
    imageUrl: 'assets/images/pesti6.jpeg',
  ),
  Product(
    name: 'Chemical Pesticide',
    description: 'Strong chemical pesticide for pests.',
    price: 8.99,
    imageUrl: 'assets/images/pesti5.jpeg',
  ),
  Product(
    name: 'Chemical Pesticide',
    description: 'Strong chemical pesticide for pests.',
    price: 8.99,
    imageUrl: 'assets/images/pesti4.jpeg',
  ),
  Product(
    name: 'Chemical Pesticide',
    description: 'Strong chemical pesticide for pests.',
    price: 8.99,
    imageUrl: 'assets/images/pesti3.jpeg',
  ),
  Product(
    name: 'Chemical Pesticide',
    description: 'Strong chemical pesticide for pests.',
    price: 8.99,
    imageUrl: 'assets/images/pesti2.jpeg',
  ),
];

final List<Product> equipment = [
  Product(
    name: 'Harvester',
    description: 'Complete harvester kit for your farm.',
    price: 49.99,
    imageUrl: 'assets/images/equi1.jpeg',
  ),
  Product(
    name: 'Sprinkler',
    description: 'Adjustable lawn sprinkler for efficient watering.',
    price: 19.99,
    imageUrl: 'assets/images/equi2.jpeg',
  ),
  Product(
    name: 'Tractor 6sA',
    description: 'Adjustable lawn sprinkler for efficient watering.',
    price: 19.99,
    imageUrl: 'assets/images/equi3.jpeg',
  ),
  Product(
    name: 'Roller A4',
    description: 'Adjustable lawn sprinkler for efficient watering.',
    price: 19.99,
    imageUrl: 'assets/images/equi4.jpeg',
  ),
  Product(
    name: 'Tractor 7B',
    description: 'Adjustable lawn sprinkler for efficient watering.',
    price: 19.99,
    imageUrl: 'assets/images/equi3.jpeg',
  ),
];
