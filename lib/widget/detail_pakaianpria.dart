import 'package:fashion_app/Cart.dart';
import 'package:fashion_app/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:readmore/readmore.dart';

class detail_PP extends StatefulWidget {
  final String id;
  const detail_PP({super.key, required this.id});

  @override
  State<detail_PP> createState() => _Detail_PPState();
}

class _Detail_PPState extends State<detail_PP> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('pakaianpria')
            .doc(widget.id)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            // List<Map<String, dynamic>> data = snapshot.data!.docs
            //     .map((doc) => doc.data() as Map<String, dynamic>)
            //     .toList();
            var data = snapshot.data!.data() as Map<String, dynamic>;
            return _buildUI(data);
          }
        },
      ),
    );
  }

  Widget _buildUI(Map<String, dynamic> data) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(data[
                      'Image']), // Assuming you want the image of the first accessory
                ),
              ),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              top: 332,
              bottom: 0,
              child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['Name'],
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Rp.${data['Price']}',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors
                              .green, // You can customize the color if needed
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ReadMoreText(
                        data['Description'],
                        trimLines: 4,
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.justify,
                        colorClickableText: Color.fromARGB(255, 125, 75, 57),
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show more',
                        trimExpandedText: 'Show less',
                        moreStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )))
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.grey[200],
        child: Card(
          elevation: 5.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        if (quantity > 0) {
                          setState(() {
                            quantity--;
                          });
                        }
                      },
                    ),
                    Text(
                      "$quantity",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Times New Roman',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        // Implement add quantity logic
                        setState(() {
                          // You may want to add a maximum limit check here
                          quantity++;
                        });
                      },
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    FirestoreService().addcart(data['Image'], data['Name'],
                        data['Price'], quantity.toString(), data['Stock']);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartPage(),
                      ),
                    );
                  },
                  child: Text('Add to Cart'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
