import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'auth_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    'assets/images/profile.jpg'), // Add your profile image
              ),
              const SizedBox(height: 10),
              const Text(
                'Ashutosh Singh',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                'GAplha',
                style: TextStyle(color: Colors.grey[600]),
              ),
              const SizedBox(height: 20),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          '138',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          'Favorites',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '56',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          'Orders',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ProfileOption(
                icon: Icons.location_on,
                title: 'Shipping Address',
                onTap: () {},
              ),
              ProfileOption(
                icon: Icons.payment,
                title: 'Payment Settings',
                onTap: () {},
              ),
              ProfileOption(
                icon: Icons.history,
                title: 'Order History',
                onTap: () {},
              ),
              ProfileOption(
                icon: Icons.settings,
                title: 'Settings',
                onTap: () {},
              ),
              ProfileOption(
                icon: Icons.policy,
                title: 'Privacy Policy',
                onTap: () {},
              ),
              ProfileOption(
                icon: Icons.logout,
                title: 'Sign In/Log In',
                onTap: () {
                  // Provider.of<AuthProvider>(context, listen: false).logout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileOption({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
