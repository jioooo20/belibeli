import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'barang_tab.dart';
import 'kategori_tab.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final List<String> _categories = [];
  String? _selectedCategory;

  void _addCategory(String categoryName) {
    setState(() {
      _categories.add(categoryName);
    });
  }

  void _deleteCategory(int index) {
    setState(() {
      if (_selectedCategory == _categories[index]) {
        _selectedCategory = null;
      }
      _categories.removeAt(index);
    });
  }

  void _onCategoryChanged(String? value) {
    setState(() {
      _selectedCategory = value;
    });
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
            BarangTab(
              categories: _categories,
              selectedCategory: _selectedCategory,
              onCategoryChanged: _onCategoryChanged,
            ),
            // Tab 2 - Kategori Management
            KategoriTab(
              categories: _categories,
              onAddCategory: _addCategory,
              onDeleteCategory: _deleteCategory,
            ),
          ],
        ),
      ),
    );
  }
}