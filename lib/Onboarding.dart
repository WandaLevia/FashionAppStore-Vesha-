// boarding_page.dart
import 'package:fashion_app/Login.dart';
import 'package:flutter/material.dart';

class BoardingPage extends StatelessWidget {
  final List<BoardingItem> boardingItems = [
    BoardingItem(
      icon: Icons.shopping_bag,
      title: 'Selamat Datang!',
      description: 'Temukan dan beli pakaian terbaru di sekitarmu',
    ),
    BoardingItem(
      icon: Icons.style,
      title: 'Jelajahi Gaya',
      description:
          'Lihat koleksi pakaian, ulasan, dan informasi lengkap tentang fashion',
    ),
    BoardingItem(
      icon: Icons.discount,
      title: 'Promo Spesial',
      description: 'Dapatkan potongan harga 20% sekarang (tawaran terbatas)',
    ),
    // Additional slide
    BoardingItem(
      icon: null, // Set icon to null for no icon
      title: 'vesha',
      description: '', // Empty description
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8A6053),
      body: PageView.builder(
        itemCount: boardingItems.length,
        itemBuilder: (context, index) {
          return BoardingItemWidget(
            item: boardingItems[index],
            onComplete: () {
              if (index == boardingItems.length - 1) {
                // If this is the last page, navigate to the LoginPage
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              }
            },
          );
        },
      ),
    );
  }
}

class BoardingItem {
  final IconData? icon; // Make icon nullable
  final String title;
  final String description;

  BoardingItem({
    required this.icon,
    required this.title,
    required this.description,
  });
}

class BoardingItemWidget extends StatelessWidget {
  final BoardingItem item;
  final VoidCallback onComplete;

  BoardingItemWidget({
    required this.item,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onComplete,
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (item.icon != null)
              Icon(
                item.icon!,
                size: 70,
                color: Color(0xFFFCDEC0),
              ),
            SizedBox(height: 20),
            Text(
              item.title,
              style: TextStyle(
                fontSize: item.title == 'vesha' ? 30 : 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFCDEC0),
              ),
            ),
            SizedBox(height: 10),
            Text(
              item.description,
              style: TextStyle(fontSize: 15, color: Color(0xFFFCDEC0)),
              textAlign: TextAlign.center,
            ),
            // Additional: Show "Get Started" button on the last slide
            if (item.title == 'vesha') SizedBox(height: 50),
            if (item.title == 'vesha')
              ElevatedButton(
                onPressed: onComplete,
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    color: Color(0xFF8A6053),
                    fontSize: 15, // Change button text size to 20
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFFCDEC0),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
