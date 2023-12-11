import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_app/edit_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final User? user = FirebaseAuth.instance.currentUser;

  void _handleEditAction(
      BuildContext context, DocumentSnapshot documentSnapshot) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfile(documentId: documentSnapshot.id),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8A6053),
      appBar: AppBar(
        backgroundColor: Color(0xFFFCDEC0),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Color(0xFF8A6053),
            fontSize: 20.0,
          ),
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(user?.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No Data Available'));
          }

          Map<String, dynamic>? userData =
              snapshot.data?.data() as Map<String, dynamic>?;

          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage(
                        'https://i.pinimg.com/736x/71/c1/fc/71c1fcf3d6189e35ba53277221ac16df.jpg',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  color: Color(0xFF8A6053),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username :',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFCDEC0),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        initialValue:
                            userData?['username'] ?? 'Username not available',
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelStyle: TextStyle(
                            color: Color(0xFFFCDEC0),
                          ),
                          hintStyle: TextStyle(
                            color: Color(0xFFFCDEC0),
                          ),
                        ),
                        style: TextStyle(
                          color: Color(0xFFFCDEC0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  color: Color(0xFF8A6053),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Full Name :',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFCDEC0),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        initialValue:
                            userData?['fullname'] ?? 'Full name not available',
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelStyle: TextStyle(
                            color: Color(0xFFFCDEC0),
                          ),
                          hintStyle: TextStyle(
                            color: Color(0xFFFCDEC0),
                          ),
                        ),
                        style: TextStyle(
                          color: Color(0xFFFCDEC0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  color: Color(0xFF8A6053),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email :',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFCDEC0),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        initialValue:
                            userData?['email'] ?? 'Email not available',
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelStyle: TextStyle(
                            color: Color(0xFFFCDEC0),
                          ),
                          hintStyle: TextStyle(
                            color: Color(0xFFFCDEC0),
                          ),
                        ),
                        style: TextStyle(
                          color: Color(0xFFFCDEC0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFCDEC0),
                  ),
                  onPressed: () {
                    _handleEditAction(context, snapshot.data!);
                  },
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(
                      color: Color(0xFF8A6053),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
