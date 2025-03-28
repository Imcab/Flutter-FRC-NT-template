import 'package:flutter/material.dart';
import 'servers/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late Dashboard _dashboard;
  bool _isConnected = false;

  @override
  void initState() {
    super.initState();
    _dashboard = Dashboard();

    _dashboard.connectionStatus().listen((connected) {
      setState(() {
        _isConnected = connected;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: down(),
      backgroundColor: const Color.fromARGB(255, 28, 29, 38),
      body: Row(
        children: [],
      ),
    );
  }

  BottomAppBar down() {
    return BottomAppBar(
      color: const Color.fromARGB(255, 18, 19, 24),
      height: 45,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: const Text(
              "Team - 3472",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _isConnected ? Icons.wifi : Icons.wifi_off,
                    color: _isConnected ? Colors.green : Colors.red,
                    size: 18,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    _isConnected ? "Network Tables: Connected" : "Network Tables: Disconnected",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: _isConnected ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
