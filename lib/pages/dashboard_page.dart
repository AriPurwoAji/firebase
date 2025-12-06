import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_pages.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const MyLogin()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Email: ${user?.email}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("UID: ${user?.uid}", style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
