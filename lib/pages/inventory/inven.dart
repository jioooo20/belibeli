import 'package:belibeli/pages/inventory/inven_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InventoryPage extends StatelessWidget {
  InventoryPage({Key? key}) : super(key: key);

  final List<Map<String, String>> products = [
    {
      'nama': 'Sosis Bakar',
      'jenis': '500gr',
      'kategori': 'Makanan',
      'harga_beli': 'Rp 15.000',
      'harga': 'Rp 25.000',
      'stok': '20',
    },
    {
      'nama': 'Nasi Goreng',
      'jenis': '1 Porsi',
      'kategori': 'Makanan',
      'harga_beli': 'Rp 8.000',
      'harga': 'Rp 15.000',
      'stok': '35',
    },
    {
      'nama': 'Mie Ayam',
      'jenis': '1 Porsi',
      'kategori': 'Makanan',
      'harga_beli': 'Rp 7.000',
      'harga': 'Rp 12.000',
      'stok': '50',
    },
    {
      'nama': 'Es Teh Manis',
      'jenis': '1 Gelas',
      'kategori': 'Minuman',
      'harga_beli': 'Rp 2.000',
      'harga': 'Rp 5.000',
      'stok': '100',
    },
    {
      'nama': 'Bakso',
      'jenis': '1 Porsi',
      'kategori': 'Makanan',
      'harga_beli': 'Rp 10.000',
      'harga': 'Rp 18.000',
      'stok': '40',
    },
    {
      'nama': 'Lumpia',
      'jenis': '5 Buah',
      'kategori': 'Makanan',
      'harga_beli': 'Rp 4.000',
      'harga': 'Rp 8.000',
      'stok': '60',
    },
    {
      'nama': 'Jus Jeruk',
      'jenis': '1 Gelas',
      'kategori': 'Minuman',
      'harga_beli': 'Rp 5.000',
      'harga': 'Rp 10.000',
      'stok': '45',
    },
    {
      'nama': 'Perkedel',
      'jenis': '6 Buah',
      'kategori': 'Makanan',
      'harga_beli': 'Rp 3.500',
      'harga': 'Rp 7.000',
      'stok': '55',
    },
    {
      'nama': 'Kopi Hitam',
      'jenis': '1 Cangkir',
      'kategori': 'Minuman',
      'harga_beli': 'Rp 3.000',
      'harga': 'Rp 6.000',
      'stok': '80',
    },
    {
      'nama': 'Tahu Goreng',
      'jenis': '1 Porsi',
      'kategori': 'Makanan',
      'harga_beli': 'Rp 4.000',
      'harga': 'Rp 8.000',
      'stok': '70',
    },
    {
      'nama': 'Sambal Matah',
      'jenis': '200gr',
      'kategori': 'Makanan',
      'harga_beli': 'Rp 5.000',
      'harga': 'Rp 9.000',
      'stok': '30',
    },
    {
      'nama': 'Wedang Ronde',
      'jenis': '1 Mangkok',
      'kategori': 'Minuman',
      'harga_beli': 'Rp 3.500',
      'harga': 'Rp 7.000',
      'stok': '25',
    },
    {
      'nama': 'Gado-gado',
      'jenis': '1 Porsi',
      'kategori': 'Makanan',
      'harga_beli': 'Rp 6.000',
      'harga': 'Rp 11.000',
      'stok': '35',
    },
  ];

  @override
  Widget build(BuildContext context) {

    // No need for Scaffold here - it's provided by the shell layout
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[50],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: Colors.grey[200]!,
                                      width: 1,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: Colors.grey[200]!,
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: Colors.lightGreen[700]!,
                                      width: 1.5,
                                    ),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.grey[600],
                                  ),
                                  hintText: 'Cari produk...',
                                  hintStyle: TextStyle(color: Colors.grey[400]),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 14,
                                  ),
                                ),
                                onSubmitted: (value) {},
                                onChanged: (value) {},
                              ),
                            ),
                            const SizedBox(width: 12),
                            ElevatedButton.icon(
                              onPressed: () {
                                context.go('/add_product');
                              },
                              icon: const Icon(Icons.add, size: 20),
                              label: const Text(
                                'Tambah',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightGreen[700],
                                foregroundColor: Colors.white,
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return InventoryCard(
                          productName: product['nama']!,
                          subProductName: product['jenis']!,
                          category: product['kategori']!,
                          buyPrice: product['harga_beli']!,
                          sellPrice: product['harga']!,
                          stock: product['stok']!,
                          imagePath: 'img/placeholder.png',
                          onEdit: () {
                            // Handle edit action
                          },
                          onTap: () {
                            // Handle tap action
                          },
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
