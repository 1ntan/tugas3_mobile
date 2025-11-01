import 'package:flutter/material.dart';

class ProductCatalogPage2 extends StatefulWidget {
  const ProductCatalogPage2({super.key});

  @override
  State<ProductCatalogPage2> createState() => _ProductCatalogPage2State();
}

class _ProductCatalogPage2State extends State<ProductCatalogPage2> {
  double _itemSpacing = 16.0;
  int? _selectedIndex; 

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final int crossAxisCount;
    if (screenWidth >= 800) {
      crossAxisCount = 4;
    } else if (screenWidth >= 600) {
      crossAxisCount = 3;
    } else {
      crossAxisCount = 2;
    }

    final double titleFontSize = screenWidth < 600 ? 14.0 : 18.0;
    const double cardAspectRatio = 0.8;

    return Scaffold(
      appBar: AppBar(title: const Text('Katalog Produk Dinamis')),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(_itemSpacing),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: _itemSpacing,
                mainAxisSpacing: _itemSpacing,
                childAspectRatio: cardAspectRatio,
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                final bool isSelected = _selectedIndex == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = isSelected ? null : index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue[200] : Colors.grey[200],
                      borderRadius:
                          BorderRadius.circular(isSelected ? 20 : 12),
                      boxShadow: isSelected
                          ? [
                              const BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              )
                            ]
                          : [],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_bag_outlined,
                          size: isSelected ? 64 : 48,
                          color: Colors.grey[700],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Produk ${index + 1}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: titleFontSize,
                            color: isSelected ? Colors.blue[900] : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'Ubah Jarak Antar Item: ${_itemSpacing.toStringAsFixed(1)}',
                ),
                Slider(
                  value: _itemSpacing,
                  min: 8.0,
                  max: 32.0,
                  divisions: 6,
                  label: _itemSpacing.toStringAsFixed(1),
                  onChanged: (value) => setState(() => _itemSpacing = value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
