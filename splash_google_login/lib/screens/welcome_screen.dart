

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart'; // Import the theme provider
import '../services/auth_service.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Access both AuthService and ThemeProvider
    final authService = Provider.of<AuthService>(context, listen: false);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final User? user = authService.currentUser;

    if (user == null) {
      return const Scaffold(
        body: Center(child: Text('User not found!')),
      );
    }

    return Scaffold(
      // backgroundColor : Colors.amber[100],
      appBar: AppBar(
        // title: const Text('Welcome'),
        backgroundColor: Colors.lightBlue[200],
        actions: [
          IconButton(
            icon: const Icon(Icons.logout,color:Colors.black,size: 40,),
            onPressed: () async {
              await authService.signOut();
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Lottie.asset('assets/welcome-hi.json'),
              SizedBox(width: 80,height: 80,),
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(user.photoURL ?? ''),
                onBackgroundImageError: (exception, stackTrace) {
                  print("Error loading image: $exception");
                },
                child: user.photoURL == null
                    ? const Icon(Icons.person, size: 50)
                    : null,
              ),
              const SizedBox(height: 20),
              Text(
                user.displayName ?? 'No Name',
                style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                user.email ?? 'No Email',
                style: const TextStyle(fontSize: 19, color: Colors.blue),
              ),
              Text(
                user.uid,
                style: const TextStyle(fontSize: 19, color: Colors.blue),
              ),
              const SizedBox(height: 40), // Spacer

              // --- ADD THE TOGGLE SWITCH HERE ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  const Icon(Icons.light_mode),
                  const SizedBox(width: 8),
                  Switch(
                    value: themeProvider.themeMode == ThemeMode.dark,
                    onChanged: (value) {
                      // Use listen: false when calling a method inside a callback
                      final provider = Provider.of<ThemeProvider>(context, listen: false);
                      provider.toggleTheme(value);
                    },
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.dark_mode),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}