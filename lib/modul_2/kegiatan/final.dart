import 'package:flutter/material.dart';

// ============================================================================
// MAIN MENU
// ============================================================================
class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: const Text('Menu Utama'),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.local_laundry_service,
                    size: 90, color: Colors.blueAccent),
                const SizedBox(height: 30),
                const Text(
                  'Pilih Jenis Animasi / Demo',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),

                // Tombol ke MediaQuery
                ElevatedButton.icon(
                  icon: const Icon(Icons.view_module),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ProductCatalogPage1()),
                    );
                  },
                  label: const Text(
                    'Demo MediaQuery (Katalog)',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 12),

                // Tombol ke LayoutBuilder demo
                ElevatedButton.icon(
                  icon: const Icon(Icons.grid_view),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const LayoutBuilderDemoPage()),
                    );
                  },
                  label: const Text(
                    'Demo LayoutBuilder (Katalog Modular)',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 12),

                // Tombol ke Animasi Impisit
                ElevatedButton.icon(
                  icon: const Icon(Icons.animation),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ImplicitAnimationPage()),
                    );
                  },
                  label: const Text(
                    'Animasi Impisit (AnimatedContainer)',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 12),

                // Tombol ke Animasi Eksplisit
                ElevatedButton.icon(
                  icon: const Icon(Icons.play_circle_outline),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ExplicitAnimationPage()),
                    );
                  },
                  label: const Text(
                    'Animasi Eksplisit (AnimationController)',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 12),

                // Tombol ke Transition Implicit (Navigasi ke detail)
                ElevatedButton.icon(
                  icon: const Icon(Icons.compare_arrows),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const TransitionImplicitPage()),
                    );
                  },
                  label: const Text(
                    'Demo Transisi Antar Halaman',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




// ---------- MEDIA QUERY ----------
class ProductCatalogPage1 extends StatefulWidget {
  const ProductCatalogPage1({super.key});

  @override
  State<ProductCatalogPage1> createState() => _ProductCatalogPage1State();
}

class _ProductCatalogPage1State extends State<ProductCatalogPage1> {
  double _itemSpacing = 16.0;

  final List<String> produkLaundry = [
    'Cuci Kering',
    'Cuci Setrika',
    'Setrika Saja',
    'Cuci Sepatu',
    'Cuci Karpet',
    'Dry Cleaning',
    'Laundry Express',
    'Bed Cover',
    'Jas & Gaun',
    'Boneka',
    'Tas & Helm',
    'Sprei & Selimut',
    'Sarung Bantal',
    'Jaket Kulit',
    'Pakaian Bayi',
    'Handuk',
    'Pakaian Kantor',
    'Seragam Sekolah',
    'Karpet Besar',
    'Gorden',
  ];

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;

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
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Katalog Gangnam Laundry'),
      ),
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
              itemCount: produkLaundry.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.lightBlue[100],
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.lightBlue[50],
                          child: const Icon(Icons.local_laundry_service,
                              size: 48, color: Colors.blueGrey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          produkLaundry[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: titleFontSize,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text('Ubah Jarak Antar Item: ${_itemSpacing.toStringAsFixed(1)}'),
                Slider(
                  activeColor: Colors.blue,
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

// ---------- LAYOUT BUILDER ----------
class ModularProductGrid extends StatelessWidget {
  final List<String> produkLaundry;
  const ModularProductGrid({super.key, required this.produkLaundry});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final int crossAxisCount;
        if (maxWidth >= 700) {
          crossAxisCount = 4;
        } else if (maxWidth >= 500) {
          crossAxisCount = 3;
        } else {
          crossAxisCount = 2;
        }

        final spacing = 12.0;

        return GridView.builder(
          padding: EdgeInsets.all(spacing),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
            childAspectRatio: 1,
          ),
          itemCount: produkLaundry.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.lightBlue[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.local_laundry_service,
                          color: Colors.blueGrey, size: 40),
                      const SizedBox(height: 8),
                      Text(
                        produkLaundry[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class LayoutBuilderDemoPage extends StatelessWidget {
  const LayoutBuilderDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final produkKiri = [
      'Cuci Kering',
      'Setrika Saja',
      'Cuci Sepatu',
      'Dry Cleaning',
      'Bed Cover',
      'Handuk',
      'Gorden',
      'Karpet',
    ];

    final produkKanan = [
      'Laundry Express',
      'Cuci Setrika',
      'Pakaian Kantor',
      'Seragam Sekolah',
      'Jas & Gaun',
      'Jaket Kulit',
      'Tas & Helm',
      'Boneka',
      'Sprei & Selimut',
      'Sarung Bantal',
      'Pakaian Bayi',
      'Karpet Besar',
      'Sepatu Premium',
      'Bed Cover Besar',
      'Selimut Tebal',
      'Bantal Hotel',
    ];

    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Katalog Gangnam Laundry'),
      ),
      body: Row(
        children: [
          // sisi kiri
          Container(
            width: 250,
            color: Colors.lightBlue[100],
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Layanan Populer',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Expanded(
                  child: ModularProductGrid(produkLaundry: produkKiri),
                ),
              ],
            ),
          ),

          // sisi kanan
          Expanded(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Semua Produk Laundry',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Expanded(
                  child: ModularProductGrid(produkLaundry: produkKanan),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// ImplicitAnimationPage (tetap di posisi semula, efek tap saja)
// ============================================================================
class ImplicitAnimationPage extends StatefulWidget {
  const ImplicitAnimationPage({super.key});

  @override
  State<ImplicitAnimationPage> createState() => _ImplicitAnimationPageState();
}

class _ImplicitAnimationPageState extends State<ImplicitAnimationPage> {
  final List<String> produkLaundry = [
    'Cuci Kering',
    'Cuci Setrika',
    'Setrika Saja',
    'Cuci Sepatu',
    'Cuci Karpet',
    'Dry Cleaning',
    'Laundry Express',
    'Bed Cover',
    'Jas & Gaun',
    'Boneka',
    'Tas & Helm',
    'Sprei & Selimut',
  ];

  int? _tappedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animasi Impisit - AnimatedContainer'),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = 2;
          if (constraints.maxWidth > 600) crossAxisCount = 3;
          if (constraints.maxWidth > 900) crossAxisCount = 4;

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: produkLaundry.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 3 / 4,
            ),
            itemBuilder: (context, index) {
              final bool isTapped = _tappedIndex == index;

              return GestureDetector(
                onTapDown: (_) => setState(() => _tappedIndex = index),
                onTapUp: (_) {
                  Future.delayed(const Duration(milliseconds: 200), () {
                    setState(() => _tappedIndex = null);
                  });
                },
                onTapCancel: () => setState(() => _tappedIndex = null),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  transform: Matrix4.identity()..scale(isTapped ? 1.05 : 1.0),
                  decoration: BoxDecoration(
                    color: isTapped
                        ? Colors.lightBlue.shade300
                        : Colors.lightBlue.shade100,
                    borderRadius: BorderRadius.circular(isTapped ? 24 : 12),
                    boxShadow: [
                      if (isTapped)
                        BoxShadow(
                          color: Colors.blueAccent.withOpacity(0.4),
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: const Offset(0, 6),
                        ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.local_laundry_service,
                        size: isTapped ? 60 : 50,
                        color: isTapped ? Colors.white : Colors.blueGrey.shade700,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        produkLaundry[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: isTapped ? 18 : 16,
                          color: isTapped ? Colors.white : Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// ============================================================================
// ANIMASI EKSPLISIT PROFESIONAL
// ============================================================================
class ExplicitAnimationPage extends StatefulWidget {
  const ExplicitAnimationPage({super.key});

  @override
  State<ExplicitAnimationPage> createState() => _ExplicitAnimationPageState();
}

class _ExplicitAnimationPageState extends State<ExplicitAnimationPage>
    with TickerProviderStateMixin {
  final List<String> produkLaundry = [
    'Cuci Kering',
    'Cuci Setrika',
    'Setrika Saja',
    'Cuci Sepatu',
    'Cuci Karpet',
    'Dry Cleaning',
    'Laundry Express',
    'Bed Cover',
    'Jas & Gaun',
    'Boneka',
    'Tas & Helm',
    'Sprei & Selimut',
  ];

  late List<AnimationController> _controllers;
  late List<Animation<double>> _scaleAnimations;
  late List<Animation<Color?>> _colorAnimations;

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(
      produkLaundry.length,
      (index) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
      ),
    );

    _scaleAnimations = _controllers
        .map((controller) => Tween<double>(begin: 1.0, end: 1.1).animate(
              CurvedAnimation(parent: controller, curve: Curves.easeInOut),
            ))
        .toList();

    _colorAnimations = _controllers
        .map((controller) => ColorTween(
              begin: Colors.lightBlue[100],
              end: Colors.lightBlueAccent.shade100,
            ).animate(
              CurvedAnimation(parent: controller, curve: Curves.easeInOut),
            ))
        .toList();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  // gunakan repeat(reverse: true) untuk animasi loop, dan stop/reset untuk hentikan
  void _startAnimation(AnimationController controller) {
    controller.repeat(reverse: true);
  }

  void _stopAnimation(AnimationController controller) {
    controller.stop();
    controller.reset();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // pastikan hasil clamp berupa int
    final int crossAxisCount = (screenWidth ~/ 180).clamp(2, 5).toInt();

    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Animasi Eksplisit - AnimationController'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 3 / 4,
        ),
        itemCount: produkLaundry.length,
        itemBuilder: (context, index) {
          final controller = _controllers[index];
          final scaleAnim = _scaleAnimations[index];
          final colorAnim = _colorAnimations[index];

          return AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Transform.scale(
                scale: scaleAnim.value,
                child: Card(
                  color: colorAnim.value,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Icon(
                            Icons.local_laundry_service,
                            size: screenWidth < 500 ? 36 : 48,
                            color: Colors.blueGrey.shade700,
                          ),
                        ),
                        Text(
                          produkLaundry[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth < 500 ? 12 : 14,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildMiniButton(
                              label: 'Pick',
                              color: Colors.green,
                              onTap: () => _startAnimation(controller),
                            ),
                            _buildMiniButton(
                              label: 'Cancel',
                              color: Colors.redAccent,
                              onTap: () => _stopAnimation(controller),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildMiniButton({
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      height: 26,
      width: 60,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 11, color: Colors.white),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// TransitionMenuPage (stub) - agar Navigator ke halaman transisi tidak error
// -----------------------------------------------------------------------------
class TransitionMenuPage extends StatelessWidget {
  const TransitionMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Transisi (Stub)'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: Text(
          'Ini halaman stub untuk demo transisi.\nGanti ini dengan implementasi transisi yang kamu mau.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.blueGrey.shade700),
        ),
      ),
    );
  }
}

// AFTER (ProductDetailPage) - Hero target
class ProductDetailPage extends StatelessWidget {
  final String productName;
  const ProductDetailPage({super.key, required this.productName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Hero target: tag harus sama persis
            Hero(
              tag: productName, // sama dengan tag di halaman daftar
              child: Icon(
                Icons.local_laundry_service,
                size: 150, // ukuran lebih besar di halaman detail
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Detail untuk $productName',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}


// ============================================================================
// Halaman Dummy untuk Transisi
// ============================================================================
class TransitionDummyPage extends StatelessWidget {
  final String title;
  const TransitionDummyPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Text(
          'Ini halaman dummy untuk demo transisi.',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// ============================================================================
// TransitionImplicitPage (salinan ImplicitAnimationPage dengan navigasi ke detail)
// ============================================================================
class TransitionImplicitPage extends StatelessWidget {
  const TransitionImplicitPage({super.key});

  final List<String> produkLaundry = const [
    'Cuci Kering',
    'Cuci Setrika',
    'Setrika Saja',
    'Cuci Sepatu',
    'Cuci Karpet',
    'Dry Cleaning',
    'Laundry Express',
    'Bed Cover',
    'Jas & Gaun',
    'Boneka',
    'Tas & Helm',
    'Sprei & Selimut',
  ];

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = (MediaQuery.of(context).size.width ~/ 180).clamp(2, 4);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Animasi + Transisi'),
        backgroundColor: Colors.deepPurple,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: produkLaundry.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 3 / 4,
        ),
        itemBuilder: (context, index) {
  final product = produkLaundry[index];

  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 450),
          pageBuilder: (context, animation, secondaryAnimation) =>
              ProductDetailPage(productName: product),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final fade = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
            return FadeTransition(
              opacity: fade,
              child: child,
            );
          },
        ),
      );
    }, // <-- onTap ditutup di sini
    child: Card(
      color: Colors.lightBlue[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: product, // tag harus sama di ProductDetailPage
            child: Icon(Icons.local_laundry_service, size: 50),
          ),
          const SizedBox(height: 10),
          Text(
            product,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    ),
  );
},
      ),
    );
  }
}
  
