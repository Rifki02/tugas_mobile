import 'package:flutter/material.dart';

class StockScreen extends StatefulWidget {
  @override
  _StockScreenState createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  final List<Map<String, dynamic>> _items = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _addItem() {
    final String name = _nameController.text;
    final int quantity = int.tryParse(_quantityController.text) ?? 0;

    if (name.isNotEmpty && quantity > 0) {
      setState(() {
        _items.add({
          'name': name,
          'quantity': quantity,
          'date': _selectedDate,
        });
        _nameController.clear();
        _quantityController.clear();
        _selectedDate = DateTime.now(); // Reset tanggal setelah menambahkan barang
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stok Barang'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: TextField(
                          controller: _nameController,
                          decoration: InputDecoration(labelText: 'Nama Barang'),
                        ),
                      ),
                      SizedBox(width: 16),
                      Flexible(
                        child: TextField(
                          controller: _quantityController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(labelText: 'Jumlah Stok'),
                        ),
                      ),
                      SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: _addItem,
                        child: Text('Tambah'),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Tanggal: ${_selectedDate.toLocal().toString().split(' ')[0]}',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => _selectDate(context),
                        child: Text('Pilih Tanggal'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                return ListTile(
                  title: Text(item['name']),
                  subtitle: Text('Stok: ${item['quantity']} | Tanggal: ${item['date'].toLocal().toString().split(' ')[0]}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
