import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContactList(),
    );
  }
}

class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  final List<Map<String, String>> contacts = [];
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Tambahkan form key untuk validasi

  void _addContact() {
    // Cek validasi form sebelum menambahkan kontak
    if (_formKey.currentState!.validate()) {
      setState(() {
        contacts.add({
          'name': _nameController.text,
          'phone': _phoneController.text,
        });
      });
      _nameController.clear();
      _phoneController.clear();
    }
  }

  void _deleteContact(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Daftar Kontak')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(contacts[index]['name']!),
                  subtitle: Text(contacts[index]['phone']!),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteContact(index),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey, // Tambahkan key pada Form
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Nama'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _phoneController,
                    decoration: InputDecoration(labelText: 'Nomor Telepon'),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nomor telepon tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _addContact,
                    child: Text('Tambah Kontak'),
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
