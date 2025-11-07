import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final List<String> _categories = [];
  final TextEditingController _categoryController = TextEditingController();
  String? _selectedCategory;

  void _addCategory() {
    if (_categoryController.text.isNotEmpty) {
      setState(() {
        _categories.add(_categoryController.text);
        _categoryController.clear();
      });
    }
  }

  void _deleteCategory(int index) {
    setState(() {
      if (_selectedCategory == _categories[index]) {
        _selectedCategory = null;
      }
      _categories.removeAt(index);
    });
  }

  @override
  void dispose() {
    _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Tambah Produk'),
            leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.go('/inventory');
            },
            ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Barang', icon: Icon(Icons.inventory_2)),
              Tab(text: 'Kategori', icon: Icon(Icons.category)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1 - Barang Form
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                child: ListView(
                  children: [
                    DropdownButtonFormField<String>(
                      value: _selectedCategory,
                      decoration: const InputDecoration(
                        labelText: 'Kategori',
                        border: OutlineInputBorder(),
                      ),
                      items: _categories.map((category) {
                        return DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value;
                        });
                      },
                      hint: const Text('Pilih Kategori'),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Barang',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Harga Beli',
                        border: OutlineInputBorder(),
                        prefixText: 'Rp ',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Harga Jual',
                        border: OutlineInputBorder(),
                        prefixText: 'Rp ',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Implement save functionality
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('Simpan'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Tab 2 - Kategori Management
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _categoryController,
                          decoration: const InputDecoration(
                            labelText: 'Kategori Baru',
                            border: OutlineInputBorder(),
                          ),
                          onSubmitted: (_) => _addCategory(),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton.icon(
                        onPressed: _addCategory,
                        icon: const Icon(Icons.add),
                        label: const Text('Tambah'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 16),
                  const Text(
                    'Daftar Kategori',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: _categories.isEmpty
                        ? const Center(
                            child: Text(
                              'Belum ada kategori',
                              style: TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          )
                        : ListView.builder(
                            itemCount: _categories.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: ListTile(
                                  leading: const Icon(Icons.category),
                                  title: Text(_categories[index]),
                                  trailing: IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    onPressed: () => _deleteCategory(index),
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}