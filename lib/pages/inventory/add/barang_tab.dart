import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class BarangTab extends StatefulWidget {
  final List<String> categories;
  final String? selectedCategory;
  final ValueChanged<String?> onCategoryChanged;

  const BarangTab({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  @override
  State<BarangTab> createState() => _BarangTabState();
}

class _BarangTabState extends State<BarangTab> {
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;

  // Input formatters
  List<TextInputFormatter> get _priceInputFormatters => [
        FilteringTextInputFormatter.deny(RegExp(r'-')),
        FilteringTextInputFormatter.allow(RegExp(r'[\d.]')),
      ];

  List<TextInputFormatter> get _stockInputFormatters => [
        FilteringTextInputFormatter.deny(RegExp(r'-')),
        FilteringTextInputFormatter.digitsOnly,
      ];

  // Validators
  String? _validatePrice(String? value) {
    if (value == null || value.trim().isEmpty) return null;
    final v = double.tryParse(value.replaceAll(',', '.'));
    if (v == null) return 'Masukkan angka yang valid';
    if (v < 0) return 'Tidak boleh negatif';
    return null;
  }

  String? _validateStock(String? value) {
    if (value == null || value.trim().isEmpty) return null;
    final v = int.tryParse(value);
    if (v == null) return 'Masukkan angka yang valid';
    if (v < 0) return 'Tidak boleh negatif';
    return null;
  }

  // Image picker methods
  Future<void> _pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _selectedImage = image;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error memilih gambar: $e')),
        );
      }
    }
  }

  Future<void> _pickImageFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        setState(() {
          _selectedImage = image;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error mengambil foto: $e')),
        );
      }
    }
  }

  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pilih Sumber Gambar'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Galeri'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImageFromGallery();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Kamera'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImageFromCamera();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _removeImage() {
    setState(() {
      _selectedImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: ListView(
          children: [
            DropdownButtonFormField<String>(
              value: widget.selectedCategory,
              decoration: const InputDecoration(
                labelText: 'Kategori',
                border: OutlineInputBorder(),
              ),
              items: widget.categories.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: widget.onCategoryChanged,
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
              keyboardType: const TextInputType.numberWithOptions(
                  decimal: true, signed: false),
              inputFormatters: _priceInputFormatters,
              validator: _validatePrice,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Harga Jual',
                border: OutlineInputBorder(),
                prefixText: 'Rp ',
              ),
              keyboardType: const TextInputType.numberWithOptions(
                  decimal: true, signed: false),
              inputFormatters: _priceInputFormatters,
              validator: _validatePrice,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Stok',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: _stockInputFormatters,
              validator: _validateStock,
            ),
            const SizedBox(height: 16),
            // Image Upload Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Foto Barang',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                if (_selectedImage != null)
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          File(_selectedImage!.path),
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: IconButton(
                          onPressed: _removeImage,
                          icon: const Icon(Icons.close),
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                else
                  InkWell(
                    onTap: _showImageSourceDialog,
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_photo_alternate,
                            size: 64,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Tambah Foto',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
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
    );
  }
}
