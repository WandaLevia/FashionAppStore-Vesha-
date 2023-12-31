import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fashion_app/Cart.dart';
import 'package:fashion_app/Category.dart';
import 'package:fashion_app/Login.dart';
import 'package:fashion_app/Profile.dart';
import 'package:fashion_app/firestore_service.dart';
import 'package:fashion_app/pages/detail_ak.dart';
import 'package:fashion_app/pages/detail_pa.dart';
import 'package:fashion_app/pages/detail_pp.dart';
import 'package:fashion_app/pages/detail_pw.dart';
import 'package:fashion_app/pages/detail_s.dart';
import 'package:fashion_app/pages/detail_tas.dart';

class MainFashionPage extends StatefulWidget {
  const MainFashionPage({Key? key}) : super(key: key);

  @override
  State<MainFashionPage> createState() => _MainFashionPageState();
}

class _MainFashionPageState extends State<MainFashionPage> {
  late PageController _pageController = PageController();
  int _currentPage = 0;
  late int itemCount; // Declare itemCount here

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'vesha',
          style: TextStyle(
            color: Color(0xFFFCDEC0),
          ),
        ),
        backgroundColor: Color(0xFF8A6053),
        actions: [
          // Tambahkan tombol Logout di dalam AppBar
          IconButton(
            icon: Icon(Icons.exit_to_app, color: Color(0xFFFCDEC0)),
            onPressed: () async {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Color(0xFFFCDEC0), // Set icon color to 0xFFFCDEC0
            ),
            onPressed: () {
              // Navigate to CartPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              color: Color(0xFFFCDEC0), // Set icon color to 0xFFFCDEC0
            ),
            onPressed: () {
              // Navigate to ProfilePage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Color(0xFF8A6053),
        child: Column(
          children: [
            // Hapus widget pencarian (_buildSearchField)
            _buildPageView(),
            _buildCategoryListView(),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recommended for You',
                  style: TextStyle(
                    color: Color(0xFFFCDEC0),
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),

            _buildProductGridView(),
          ],
        ),
      ),
    );
  }

  Widget _buildPageView() {
    return Container(
      height: 200, // Set the desired height for the PageView
      child: StreamBuilder<QuerySnapshot>(
        stream: FirestoreService().getdiscount(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              List userList = snapshot.data!.docs;

              if (userList.isEmpty) {
                return Center(child: Text('No data available.'));
              }

              int itemCount = userList.length > 3 ? 3 : userList.length;

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  DocumentSnapshot documentSnapshot = userList[index];
                  Map<String, dynamic> data =
                      documentSnapshot.data() as Map<String, dynamic>;
                  String imageUrl = data['Image'];

                  return Container(
                    width: MediaQuery.of(context).size.width - 32,
                    margin: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Center(
                      child: Image.network(
                        imageUrl,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }

  Widget _buildCategoryListView() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 80.0,
        child: StreamBuilder<QuerySnapshot>(
          stream: FirestoreService().getcategories(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                List userList = snapshot.data!.docs;
                itemCount = userList.length > 6 ? 6 : userList.length;

                return Container(
                  height: 80.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: itemCount,
                    itemBuilder: (context, index) {
                      DocumentSnapshot documentSnapshot = userList[index];
                      Map<String, dynamic> data =
                          documentSnapshot.data() as Map<String, dynamic>;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            if (data['Nama'] == 'Pakaian Pria') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPP(
                                    categories: categories,
                                  ),
                                ),
                              );
                            } else if (data['Nama'] == 'Pakaian Wanita') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPW(
                                    categories: categories,
                                  ),
                                ),
                              );
                            } else if (data['Nama'] == 'Pakaian Anak') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPA(categories: categories[index]),
                                ),
                              );
                            } else if (data['Nama'] == 'Sepatu') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailS(categories: categories[index]),
                                ),
                              );
                            } else if (data['Nama'] == 'Tas') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailT(categories: categories[index]),
                                ),
                              );
                            } else if (data['Nama'] == 'Aksesoris') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailAK(categories: categories[index]),
                                ),
                              );
                            }
                          },
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  height: 40.0,
                                  child: CircleAvatar(
                                    radius: 25.0,
                                    child: Image.network(
                                      data['Image'],
                                      width: 28.0,
                                      height: 28.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: data['Nama']
                                      .toString()
                                      .split(' ')
                                      .map((word) {
                                    return Text(
                                      word,
                                      style: TextStyle(
                                        color: Color(0xFFFCDEC0),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.0,
                                      ),
                                      textAlign: TextAlign.center,
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }

  Widget _buildProductGridView() {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: FirestoreService().getfashionapp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              List productList = snapshot.data!.docs;

              return SingleChildScrollView(
                child: GridView.builder(
                  shrinkWrap:
                      true, // Allow the GridView to be scrollable inside SingleChildScrollView
                  physics:
                      NeverScrollableScrollPhysics(), // Disable scrolling for the GridView
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: productList.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot productSnapshot = productList[index];
                    Map<String, dynamic> productData =
                        productSnapshot.data() as Map<String, dynamic>;

                    return Card(
                      margin: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 80.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(productData['Image']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              productData['Name'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Rp ${productData['Price']}',
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}
