import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ContactListScreen(),
    );
  }
}

class ContactListScreen extends StatelessWidget {
  const ContactListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Hardcoded data to match the UI screenshot
    final List<Map<String, String>> contacts = [
      {'name': 'Jawad', 'phone': '01877-777777'},
      {'name': 'Ferdous', 'phone': '01673-777777'},
      {'name': 'Hasan', 'phone': '01745-777777'},
      {'name': 'Hasan', 'phone': '01745-777777'},
      {'name': 'Hasan', 'phone': '01745-777777'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact List',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF5A7D8C), // Matches the teal color
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // --- Form Section ---
            TextFormField(
              initialValue: 'Hasan',
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              initialValue: '01745-777777',
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5A7D8C), // Teal button
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  'Add',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // --- Contact List Section ---
            // Using ListView.builder for efficiency, but since it's a small list
            // we could also use a Column with children.
            ListView.builder(
              shrinkWrap: true, // Important to prevent infinite height error inside Column
              physics: const NeverScrollableScrollPhysics(), // Disables internal scrolling
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return Card(
                  elevation: 0, // Flat card style
                  margin: const EdgeInsets.only(bottom: 8.0),
                  color: const Color(0xFFF5F5F5), // Light grey background
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.person,
                      color: Color(0xFF6D4C41), // Brownish person icon
                      size: 32,
                    ),
                    title: Text(
                      contact['name']!,
                      style: const TextStyle(
                        color: Color(0xFFE57373), // Reddish name color
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      contact['phone']!,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    trailing: const Icon(
                      Icons.phone,
                      color: Colors.blue,
                    ),
                    onTap: () {},
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}