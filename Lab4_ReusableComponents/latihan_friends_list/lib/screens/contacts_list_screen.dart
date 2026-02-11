import 'package:flutter/material.dart';
import '../models/contact.dart';
import '../widgets/contact_cards.dart';
import '../data/mock_data.dart';
import 'chat_screen.dart';

class ContactsListScreen extends StatelessWidget {
  const ContactsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        backgroundColor: const Color.fromARGB(255, 255, 168, 168),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: mockContacts.length,
        itemBuilder: (context, index) {
          final contact = mockContacts[index];
          
          return ContactCard(
            contact: contact,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(contact: contact),
                ),
              );
            },
          );
        },
      ),
    );
  }
}