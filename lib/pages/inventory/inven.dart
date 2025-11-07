import 'package:belibeli/component/appbar/appbar.dart';
import 'package:belibeli/component/tabbar/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:go_router/go_router.dart';

class InventoryPage extends StatelessWidget {
  InventoryPage({Key? key}) : super(key: key);

  final List<Map<String, String>> products = [
    {
      'nama': 'Sosis Bakar | 500gr',
      'kategori': 'Makanan',
      'harga_beli': 'Rp 15.000',
      'harga': 'Rp 25.000',
      'stok': '20',
    },
    {
      'nama': 'Nasi Goreng | 1 Porsi',
      'kategori': 'Makanan',
      'harga_beli': 'Rp 8.000',
      'harga': 'Rp 15.000',
      'stok': '35',
    },
    {
      'nama': 'Mie Ayam | 1 Porsi',
      'kategori': 'Makanan',
      'harga_beli': 'Rp 7.000',
      'harga': 'Rp 12.000',
      'stok': '50',
    },
    {
      'nama': 'Es Teh Manis | 1 Gelas',
      'kategori': 'Minuman',
      'harga_beli': 'Rp 2.000',
      'harga': 'Rp 5.000',
      'stok': '100',
    },
    {
      'nama': 'Bakso | 1 Porsi',
      'kategori': 'Makanan',
      'harga_beli': 'Rp 10.000',
      'harga': 'Rp 18.000',
      'stok': '40',
    },
    {
      'nama': 'Lumpia | 5 Buah',
      'kategori': 'Makanan',
      'harga_beli': 'Rp 4.000',
      'harga': 'Rp 8.000',
      'stok': '60',
    },
    {
      'nama': 'Jus Jeruk | 1 Gelas',
      'kategori': 'Minuman',
      'harga_beli': 'Rp 5.000',
      'harga': 'Rp 10.000',
      'stok': '45',
    },
    {
      'nama': 'Perkedel | 6 Buah',
      'kategori': 'Makanan',
      'harga_beli': 'Rp 3.500',
      'harga': 'Rp 7.000',
      'stok': '55',
    },
    {
      'nama': 'Kopi Hitam | 1 Cangkir',
      'kategori': 'Minuman',
      'harga_beli': 'Rp 3.000',
      'harga': 'Rp 6.000',
      'stok': '80',
    },
    {
      'nama': 'Tahu Goreng | 1 Porsi',
      'kategori': 'Makanan',
      'harga_beli': 'Rp 4.000',
      'harga': 'Rp 8.000',
      'stok': '70',
    },
    {
      'nama': 'Sambal Matah | 200gr',
      'kategori': 'Makanan',
      'harga_beli': 'Rp 5.000',
      'harga': 'Rp 9.000',
      'stok': '30',
    },
    {
      'nama': 'Wedang Ronde | 1 Mangkok',
      'kategori': 'Minuman',
      'harga_beli': 'Rp 3.500',
      'harga': 'Rp 7.000',
      'stok': '25',
    },
    {
      'nama': 'Gado-gado | 1 Porsi',
      'kategori': 'Makanan',
      'harga_beli': 'Rp 6.000',
      'harga': 'Rp 11.000',
      'stok': '35',
    },
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(
        onSettingsPressed: () {
          // Handle settings navigation
        },
      ),
      body: Padding(
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
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  prefixIcon: const Icon(Icons.search),
                                  hintText: 'Cari produk...',
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12,
                                  ),
                                ),
                                onSubmitted: (value) {},
                                onChanged: (value) {},
                              ),
                            ),
                            const SizedBox(width: 16),
                            ElevatedButton.icon(
                              onPressed: () {
                                context.go('/add_product');
                              },
                              icon: const Icon(Icons.add),
                              label: const Text('Tambah'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightGreen[700],
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          ...products.map((product) {
                            return Card(
                              margin: const EdgeInsets.only(top: 8.0),
                              child: GFListTile(
                              avatar: const GFAvatar(
                                backgroundImage: AssetImage(
                                'img/placeholder.png',
                                ),
                                shape: GFAvatarShape.square,
                              ),
                              titleText: product['nama']!,
                              subTitleText:
                                'Kategori: ${product['kategori']} \nHarga Beli: ${product['harga_beli']} \nHarga Jual: ${product['harga']} \nStok: ${product['stok']}',
                              icon: GFButton(
                                onPressed: () {},
                                text: 'Edit',
                                color: Colors.lightGreen[700] ?? Colors.green,
                              ),
                              padding: const EdgeInsets.all(0),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Tabbar(),
    );
  }
}
