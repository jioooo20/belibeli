import 'package:flutter/material.dart';

class KategoriTab extends StatefulWidget {
  final List<String> categories;
  final ValueChanged<String> onAddCategory;
  final ValueChanged<int> onDeleteCategory;

  const KategoriTab({
    super.key,
    required this.categories,
    required this.onAddCategory,
    required this.onDeleteCategory,
  });

  @override
  State<KategoriTab> createState() => _KategoriTabState();
}

class _KategoriTabState extends State<KategoriTab> {
  final TextEditingController _categoryController = TextEditingController();

  void _addCategory() {
    if (_categoryController.text.isNotEmpty) {
      widget.onAddCategory(_categoryController.text);
      _categoryController.clear();
    }
  }

  @override
  void dispose() {
    _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            child: widget.categories.isEmpty
                ? const Center(
                    child: Text(
                      'Belum ada kategori',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    itemCount: widget.categories.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: const Icon(Icons.category),
                          title: Text(widget.categories[index]),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () => widget.onDeleteCategory(index),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
