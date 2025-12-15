import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class Product {
  final int id;
  final String name;
  final int price;
  final String desc;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.desc,
  });
}

// 샘플 데이터
const products = [
  Product(id: 1, name: "키보드", price: 49000, desc: "타건감 좋은 기계식 키보드"),
  Product(id: 2, name: "마우스", price: 29000, desc: "가벼운 무선 마우스"),
  Product(id: 3, name: "모니터", price: 189000, desc: "27인치 QHD 모니터"),
];

// 장바구니(공유 상태)
final cart = ValueNotifier<List<Product>>([]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shop Demo",
      theme: ThemeData(useMaterial3: true),
      home: const ProductListPage(),
    );
  }
}

/// 공통 Drawer
class AppDrawer extends StatelessWidget {
  final String current; // "products" or "cart"
  const AppDrawer({super.key, required this.current});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Shop Demo", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text("Drawer로 화면 이동"),
                ],
              ),
            ),
            ListTile(
              selected: current == "products",
              leading: const Icon(Icons.list),
              title: const Text("제품 목록"),
              onTap: () {
                Navigator.pop(context); // drawer 닫기
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const ProductListPage()),
                      (route) => false,
                );
              },
            ),
            ValueListenableBuilder<List<Product>>(
              valueListenable: cart,
              builder: (context, items, _) {
                return ListTile(
                  selected: current == "cart",
                  leading: const Icon(Icons.shopping_cart),
                  title: Text("장바구니 (${items.length})"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const CartPage()));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// AppBar 오른쪽 장바구니 아이콘 + 개수 배지
class CartIconButton extends StatelessWidget {
  const CartIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<Product>>(
      valueListenable: cart,
      builder: (context, items, _) {
        return IconButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CartPage())),
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(Icons.shopping_cart),
              if (items.isNotEmpty)
                Positioned(
                  right: -6,
                  top: -6,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      "${items.length}",
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

/// 1) 제품 목록 페이지
class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(current: "products"),
      appBar: AppBar(
        title: const Text("제품 목록"),
        actions: const [CartIconButton()],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: products.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final p = products[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(child: Text("${p.id}")),
              title: Text(p.name),
              subtitle: Text("${p.price}원"),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ProductDetailPage(product: p)),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// 2) 제품 상세 페이지
class ProductDetailPage extends StatelessWidget {
  final Product product;
  const ProductDetailPage({super.key, required this.product});

  void addToCart(BuildContext context) {
    cart.value = [...cart.value, product]; // 새 리스트로 갱신(중요)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("${product.name} 장바구니에 담김")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(current: "products"),
      appBar: AppBar(
        title: const Text("제품 상세"),
        actions: const [CartIconButton()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(product.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text("${product.price}원", style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 12),
                Text(product.desc),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () => addToCart(context),
                  icon: const Icon(Icons.add_shopping_cart),
                  label: const Text("장바구니 담기"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// 3) 장바구니 페이지
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  int totalPrice(List<Product> items) => items.fold(0, (sum, p) => sum + p.price);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(current: "cart"),
      appBar: AppBar(
        title: const Text("장바구니"),
      ),
      body: ValueListenableBuilder<List<Product>>(
        valueListenable: cart,
        builder: (context, items, _) {
          if (items.isEmpty) {
            return const Center(child: Text("장바구니가 비어있어요"));
          }

          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(12),
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final p = items[index];
                    return Card(
                      child: ListTile(
                        title: Text(p.name),
                        subtitle: Text("${p.price}원"),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_outline),
                          onPressed: () {
                            final newList = [...items]..removeAt(index);
                            cart.value = newList;
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  border: Border(top: BorderSide(color: Colors.grey.shade300)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("총합: ${totalPrice(items)}원", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("결제는 예시라서 생략!")),
                        );
                      },
                      child: const Text("결제하기"),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
