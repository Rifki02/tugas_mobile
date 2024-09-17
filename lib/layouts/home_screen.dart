import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  // Daftar contoh alat tulis
  final List<StationeryItem> items = [
    StationeryItem(name: 'Pensil', stock: 50),
    StationeryItem(name: 'Penghapus', stock: 20),
    StationeryItem(name: 'Buku', stock: 15),
    StationeryItem(name: 'Rautan', stock: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home - Daftar Stok Alat Tulis'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 items per row
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        padding: const EdgeInsets.all(8.0),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            child: ListTile(
              title: Text(item.name),
              subtitle: Text('Stok: ${item.stock}'),
            ),
          );
        },
      ),
    );
  }
}

// Model untuk alat tulis
class StationeryItem {
  final String name;
  final int stock;

  StationeryItem({required this.name, required this.stock});
}
