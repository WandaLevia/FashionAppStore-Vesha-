import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_app/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  final String documentId;

  EditProfile({required this.documentId});

  @override
  editProfile createState() => editProfile();
}

class editProfile extends State<EditProfile> {
  final User? user = FirebaseAuth.instance.currentUser;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUsersData();
  }

  void _loadUsersData() async {
    Map<String, dynamic>? usersData =
        await FirestoreService().getUsersById(widget.documentId);

    if (usersData != null) {
      setState(() {
        emailController.text = usersData['email'];
        fullnameController.text = usersData['fullname'];
        usernameController.text = usersData['username'];
      });
    }
  }

  void _updateUsers() async {
    await FirestoreService().updateusers(
      widget.documentId,
      emailController.text,
      fullnameController.text,
      usernameController.text,
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8A6053),
      appBar: AppBar(
        backgroundColor: Color(0xFFFCDEC0),
        title: const Text(
          'Edit Profile',
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
          if (!snapshot.hasData) {
            return Center(child: Text('No Data Available'));
          }
          var userData = snapshot.data!.data() as Map<String, dynamic>;

          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(height: 70),
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
                        controller: usernameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelStyle: TextStyle(
                              color: Color(0xFFFCDEC0)), // Set label color
                          hintStyle: TextStyle(
                              color: Color(0xFFFCDEC0)), // Set hint color
                        ),
                        style: TextStyle(
                            color: Color(0xFFFCDEC0)), // Set text color
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
                        controller: fullnameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelStyle: TextStyle(
                              color: Color(0xFFFCDEC0)), // Set label color
                          hintStyle: TextStyle(
                              color: Color(0xFFFCDEC0)), // Set hint color
                        ),
                        style: TextStyle(
                            color: Color(0xFFFCDEC0)), // Set text color
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
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelStyle: TextStyle(
                              color: Color(0xFFFCDEC0)), // Set label color
                          hintStyle: TextStyle(
                              color: Color(0xFFFCDEC0)), // Set hint color
                        ),
                        style: TextStyle(
                            color: Color(0xFFFCDEC0)), // Set text color
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFCDEC0),
                  ),
                  onPressed: _updateUsers,
                  child: Text(
                    'Update',
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
