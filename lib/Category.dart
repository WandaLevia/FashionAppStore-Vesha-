import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 8.0, // Spacing between columns
          mainAxisSpacing: 8.0, // Spacing between rows
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return buildCategoryItem(categories[index]);
        },
      ),
    );
  }

  Widget buildCategoryItem(CategoryItem category) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () {
          // Handle category item tap
          print('Selected category: ${category.name}');
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(category.imageUrl),
            ),
            SizedBox(height: 8.0),
            Text(category.name),
          ],
        ),
      ),
    );
  }
}

class CategoryItem {
  final String name;
  final String imageUrl;

  CategoryItem({required this.name, required this.imageUrl});
}

List<CategoryItem> categories = [
  CategoryItem(
    name: 'Men\'s Fashion',
    imageUrl:
        'https://i3.wp.com/s3.bukalapak.com/img/8700903846/w-1000/BAJU_ANAK_IMPORT_MODEL_DRESS_KOREA__BAJU_ANAK_CEWEK__BARU.jpg', // Replace with actual image URL
  ),
  CategoryItem(
    name: 'Women\'s Fashion',
    imageUrl:
        'https://i3.wp.com/s3.bukalapak.com/img/8700903846/w-1000/BAJU_ANAK_IMPORT_MODEL_DRESS_KOREA__BAJU_ANAK_CEWEK__BARU.jpg', // Replace with actual image URL
  ),
  // Add more categories as needed
];
