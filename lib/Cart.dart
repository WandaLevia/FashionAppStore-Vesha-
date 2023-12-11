import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_app/Home.dart';
import 'package:flutter/material.dart';
import 'firestore_service.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late List<Map<String, dynamic>> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: FirestoreService().getcart(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Text("No data available");
                  }
                  var cart = snapshot.data!.docs;

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                      childAspectRatio: 1 / 2,
                    ),
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      var cartItem = cart[index].data() as Map<String, dynamic>;

                      return Card(
                        margin: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                height: 300,
                                child: Image.network(
                                  cartItem['Image'],
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              cartItem['Name'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('Stock: ${cartItem['Stock']}'),
                            Text('Price: \Rp.${cartItem['Price']}'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    // Implement remove quantity logic
                                    setState(() {
                                      if (cartItem['Quantity'] > 1) {
                                        cartItem['Quantity']--;
                                      }
                                    });
                                  },
                                ),
                                Text('${cartItem['Quantity']}'),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    // Implement add quantity logic
                                    setState(() {
                                      if (cartItem['Quantity'] <
                                          cartItem['Stock']) {
                                        cartItem['Quantity']++;
                                        // Update total or perform other calculations here
                                      }
                                    });
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    // Implement remove item logic
                                    setState(() {
                                      FirestoreService().deletecart(
                                          snapshot.data!.docs[index].id);
                                      // Update total or perform other calculations here
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }),
          ),
          buildBottomNavigator(context),
        ],
      ),
    );
  }

  Widget buildBottomNavigator(BuildContext context) {
    return BottomAppBar(
      child: ElevatedButton(
        onPressed: () {
          // Implement checkout logic
          showCheckoutDialog(context);
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.brown, // Warna latar belakang tombol
          elevation: 4.0, // Ketebalan bayangan tombol
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Text(
          'Checkout',
          style: TextStyle(
            color: Colors.white, // Warna teks
            fontSize: 18.0, // Ukuran font teks
            fontWeight: FontWeight.bold, // Ketebalan teks
          ),
        ),
      ),
    );
  }

  void showCheckoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Checkout Successful'),
          content: Text('Thank you for your purchase!'),
          actions: [
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
                // Navigate back to the main fashion page
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => MainFashionPage(),
                  ),
                );
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
