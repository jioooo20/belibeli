import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'widgets/widgets.dart';

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: ListView(
          children: [
            CategoryDropdownField(
              categories: widget.categories,
              selectedCategory: widget.selectedCategory,
              onChanged: widget.onCategoryChanged,
            ),
            const SizedBox(height: 16),
            const CustomTextField(
              labelText: 'Barang',
            ),
            const SizedBox(height: 16),
            CustomTextField(
              labelText: 'Harga Beli',
              prefixText: 'Rp ',
              keyboardType: const TextInputType.numberWithOptions(
                  decimal: true, signed: false),
              inputFormatters: _priceInputFormatters,
              validator: _validatePrice,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              labelText: 'Harga Jual',
              prefixText: 'Rp ',
              keyboardType: const TextInputType.numberWithOptions(
                  decimal: true, signed: false),
              inputFormatters: _priceInputFormatters,
              validator: _validatePrice,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              labelText: 'Stok',
              keyboardType: TextInputType.number,
              inputFormatters: _stockInputFormatters,
              validator: _validateStock,
            ),
            const SizedBox(height: 16),
            ImageUploadField(
              selectedImage: _selectedImage,
              onImageChanged: (XFile? image) {
                setState(() {
                  _selectedImage = image;
                });
              },
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
