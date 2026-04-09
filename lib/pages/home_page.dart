import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50], // Light background like Figma
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome back,",
                          style: TextStyle(color: Colors.grey)),
                      Text("STUDENT NAME",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: const Icon(Icons.notifications_none,
                        color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 25),

              // TOTAL BALANCE CARD (Matches your Blue Card in Figma)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFF6366F1), // The Figma Indigo/Blue
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total Balance",
                        style: TextStyle(color: Colors.white70)),
                    SizedBox(height: 8),
                    // FIXED: Added \ before $ to fix your syntax error
                    Text(
                      "\$8,945.32",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                    Text("Savings: \$5,500",
                        style: TextStyle(color: Colors.white60)),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              // ACTION BUTTONS (Transfer, Pay Bills, Invest)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _quickAction(Icons.upload_outlined, "Transfer"),
                  _quickAction(
                      Icons.account_balance_wallet_outlined, "Pay Bills"),
                  _quickAction(Icons.link, "Invest"),
                ],
              ),
              const SizedBox(height: 30),

              // RECENT TRANSACTIONS
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Recent Transactions",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("View All", style: TextStyle(color: Colors.blue)),
                ],
              ),
              const SizedBox(height: 15),

              _transactionTile("Netflix Subscri...", "Entertainment - Today",
                  "-\$19.99", Colors.red),
              _transactionTile(
                  "Coffee Shop", "Food & Drink - Today", "-\$4.50", Colors.red),
              _transactionTile("Salary Deposit", "Income - Yesterday",
                  "+\$3500.00", Colors.green),
            ],
          ),
        ),
      ),
    );
  }

  // Helper for buttons
  Widget _quickAction(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)
            ],
          ),
          child: Icon(icon, color: Colors.indigo),
        ),
        const SizedBox(height: 8),
        Text(label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
      ],
    );
  }

  // Helper for list items
  Widget _transactionTile(
      String title, String sub, String amount, Color color) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
          backgroundColor: Colors.grey[100],
          child: const Icon(Icons.receipt_long, color: Colors.black54)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(sub),
      trailing: Text(amount,
          style: TextStyle(color: color, fontWeight: FontWeight.bold)),
    );
  }
}
