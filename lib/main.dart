import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: MainNavigation(),
      debugShowCheckedModeBanner: false,
    ));

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});
  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomePage(), // Page 1
    const ReportsPage(), // Page 2
    const CardsPage(), // Page 3
    const ProfilePage(), // Page 4
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF6366F1),
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart), label: "Reports"),
          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card), label: "Cards"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Profile"),
        ],
      ),
    );
  }
}

// --- PAGE 1: HOME ---
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Welcome back,\nMD MONIRUZZAMAN MISHU",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                    color: const Color(0xFF6366F1),
                    borderRadius: BorderRadius.circular(24)),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total Balance",
                        style: TextStyle(color: Colors.white70)),
                    Text("\$8,945.32",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Text("Recent Transactions",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              _tile(Icons.movie, "Netflix", "-\$19.99", Colors.red),
              _tile(Icons.coffee, "Coffee Shop", "-\$4.50", Colors.red),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tile(IconData i, String t, String p, Color c) => ListTile(
      leading: CircleAvatar(child: Icon(i)),
      title: Text(t),
      trailing:
          Text(p, style: TextStyle(color: c, fontWeight: FontWeight.bold)));
}

// --- PAGE 2: MONTHLY SPENDING REPORT ---
class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Monthly Spending Report",
              style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.transparent,
          elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text("Total Expenses (Last 30 days)",
                style: TextStyle(color: Colors.grey)),
            const Text("-\$1270.00",
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.red)),
            const SizedBox(height: 30),
            _breakdown("Food & Drink", 0.35, Colors.orange),
            _breakdown("Shopping", 0.25, Colors.blue),
            _breakdown("Housing", 0.22, Colors.green),
            _breakdown("Transport", 0.12, Colors.purple),
          ],
        ),
      ),
    );
  }

  Widget _breakdown(String label, double pct, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(label), Text("${(pct * 100).toInt()}%")]),
          const SizedBox(height: 5),
          LinearProgressIndicator(
              value: pct,
              backgroundColor: Colors.grey[200],
              color: color,
              minHeight: 8),
        ],
      ),
    );
  }
}

// --- PAGE 3: MY CARDS ---
class CardsPage extends StatelessWidget {
  const CardsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("My Cards"),
          elevation: 0,
          backgroundColor: Colors.transparent),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Color(0xFF1E293B), Color(0xFF0F172A)]),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(25),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: Text("BANK",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                  Text("4567 **** **** 1234",
                      style: TextStyle(
                          color: Colors.white, fontSize: 22, letterSpacing: 2)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("CARD HOLDER",
                                style: TextStyle(
                                    color: Colors.white54, fontSize: 10)),
                            Text("MD MONIRUZZAMAN MISHU",
                                style: TextStyle(color: Colors.white))
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("EXPIRES",
                                style: TextStyle(
                                    color: Colors.white54, fontSize: 10)),
                            Text("12/28", style: TextStyle(color: Colors.white))
                          ]),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- PAGE 4: PROFILE ---
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xFF6366F1),
                child: Text("MM",
                    style: TextStyle(color: Colors.white, fontSize: 24))),
            const SizedBox(height: 20),
            const Text("MD MONIRUZZAMAN MISHU",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Text("ID: 2130066", style: TextStyle(color: Colors.grey)),
            const Text("2130066@iub.edu.bd",
                style: TextStyle(color: Colors.indigo)),
          ],
        ),
      ),
    );
  }
}
