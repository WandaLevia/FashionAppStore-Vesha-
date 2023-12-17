import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference fashionapp =
      FirebaseFirestore.instance.collection('fashionapp');
  final CollectionReference pakaianpria =
      FirebaseFirestore.instance.collection('pakaianpria');
  final CollectionReference pakaianwanita =
      FirebaseFirestore.instance.collection('pakaianwanita');
  final CollectionReference pakaiananak =
      FirebaseFirestore.instance.collection('pakaiananak');
  final CollectionReference sepatu =
      FirebaseFirestore.instance.collection('sepatu');
  final CollectionReference tas = FirebaseFirestore.instance.collection('tas');
  final CollectionReference aksesoris =
      FirebaseFirestore.instance.collection('aksesoris');
  final CollectionReference discount =
      FirebaseFirestore.instance.collection('discount');
  final CollectionReference categories =
      FirebaseFirestore.instance.collection('categories');
  final CollectionReference cart =
      FirebaseFirestore.instance.collection('cart');
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

//fashionapp
  Stream<QuerySnapshot> getfashionapp() {
    final fashionappStream = fashionapp.snapshots();
    return fashionappStream;
  }

  Future<void> addFashions(
      String Image, String Name, String Description) async {
    fashionapp.add({'Image': Image, 'Name': Name, 'Description': Description});
  }

  Future<void> updateFashions(
      String id, String Image, String Name, String Description) async {
    fashionapp
        .doc(id)
        .update({'Image': Image, 'Name': Name, 'Description': Description});
  }

  Future<void> deleteFashions(String id) async {
    fashionapp.doc(id).delete();
  }

  Future<Map<String, dynamic>?> getFashionById(String id) async {
    try {
      DocumentSnapshot documentSnapshot = await fashionapp.doc(id).get();
      if (documentSnapshot.exists) {
        return documentSnapshot.data() as Map<String, dynamic>;
      }
    } catch (e) {
      print("Error getting fashion by ID: $e");
    }
    return null;
  }

  //pakaianpria
  Stream<QuerySnapshot> getpakaianpria() {
    final pakaianpriaStream = pakaianpria.snapshots();
    return pakaianpriaStream;
  }

  Future<void> addpakaianpria(
      String Image,
      String Name,
      String Description,
      String Price,
      String Amount,
      String Short_Description,
      String Stock) async {
    pakaianpria.add({
      'Image': Image,
      'Name': Name,
      'Description': Description,
      'Price': Price,
      'Amount': Amount,
      'Short Description': Short_Description,
      'Stock': Stock
    });
  }

  Future<void> updatepakaianpria(
      String id,
      String Image,
      String Name,
      String Description,
      String Price,
      String Amount,
      String Short_Description,
      String Stock) async {
    pakaianpria.doc(id).update({
      'Image': Image,
      'Name': Name,
      'Description': Description,
      'Price': Price,
      'Amount': Amount,
      'Short Description': Short_Description,
      'Stock': Stock
    });
  }

  Future<void> deletepakaianpria(String id) async {
    pakaianpria.doc(id).delete();
  }

  Future<Map<String, dynamic>?> getpakaianpriaById(String id) async {
    try {
      DocumentSnapshot documentSnapshot = await pakaianpria.doc(id).get();
      if (documentSnapshot.exists) {
        return documentSnapshot.data() as Map<String, dynamic>;
      }
    } catch (e) {
      print("Error getting Men's Clothing by ID: $e");
    }
    return null;
  }

  //pakaianwanita
  Stream<QuerySnapshot> getpakaianwanita() {
    final pakaianwanitaStream = pakaianwanita.snapshots();
    return pakaianwanitaStream;
  }

  Future<void> addpakaianwanita(
      String Image,
      String Name,
      String Description,
      String Price,
      String Amount,
      String Short_Description,
      String Stock) async {
    pakaianwanita.add({
      'Image': Image,
      'Name': Name,
      'Description': Description,
      'Price': Price,
      'Amount': Amount,
      'Short Description': Short_Description,
      'Stock': Stock
    });
  }

  Future<void> updatepakaianwanita(
      String id,
      String Image,
      String Name,
      String Description,
      String Price,
      String Amount,
      String Short_Description,
      String Stock) async {
    pakaianwanita.doc(id).update({
      'Image': Image,
      'Name': Name,
      'Description': Description,
      'Price': Price,
      'Amount': Amount,
      'Short Description': Short_Description,
      'Stock': Stock
    });
  }

  Future<void> deletepakaianwanita(String id) async {
    pakaianwanita.doc(id).delete();
  }

  Future<Map<String, dynamic>?> getpakaianwanitaById(String id) async {
    try {
      DocumentSnapshot documentSnapshot = await pakaianwanita.doc(id).get();
      if (documentSnapshot.exists) {
        return documentSnapshot.data() as Map<String, dynamic>;
      }
    } catch (e) {
      print("Error getting Women's Clothing by ID: $e");
    }
    return null;
  }

  //pakaiananak
  Stream<QuerySnapshot> getpakaiananak() {
    final pakaiananakStream = pakaiananak.snapshots();
    return pakaiananakStream;
  }

  Future<void> addpakaiananak(
      String Image,
      String Name,
      String Description,
      String Price,
      String Amount,
      String Short_Description,
      String Stock) async {
    pakaiananak.add({
      'Image': Image,
      'Name': Name,
      'Description': Description,
      'Price': Price,
      'Amount': Amount,
      'Short Description': Short_Description,
      'Stock': Stock
    });
  }

  Future<void> updatepakaiananak(
      String id,
      String Image,
      String Name,
      String Description,
      String Price,
      String Amount,
      String Short_Description,
      String Stock) async {
    pakaiananak.doc(id).update({
      'Image': Image,
      'Name': Name,
      'Description': Description,
      'Price': Price,
      'Amount': Amount,
      'Short Description': Short_Description,
      'Stock': Stock
    });
  }

  Future<void> deletepakaiananak(String id) async {
    pakaiananak.doc(id).delete();
  }

  Future<Map<String, dynamic>?> getpakaiananakById(String id) async {
    try {
      DocumentSnapshot documentSnapshot = await pakaiananak.doc(id).get();
      if (documentSnapshot.exists) {
        return documentSnapshot.data() as Map<String, dynamic>;
      }
    } catch (e) {
      print("Error getting Children's Clothing by ID: $e");
    }
    return null;
  }

  //sepatu
  Stream<QuerySnapshot> getsepatu() {
    final sepatuStream = sepatu.snapshots();
    return sepatuStream;
  }

  Future<void> addsepatu(
      String Image,
      String Name,
      String Description,
      String Price,
      String Amount,
      String Short_Description,
      String Stock) async {
    sepatu.add({
      'Image': Image,
      'Name': Name,
      'Description': Description,
      'Price': Price,
      'Amount': Amount,
      'Short Description': Short_Description,
      'Stock': Stock
    });
  }

  Future<void> updatesepatu(
      String id,
      String Image,
      String Name,
      String Description,
      String Price,
      String Amount,
      String Short_Description,
      String Stock) async {
    sepatu.doc(id).update({
      'Image': Image,
      'Name': Name,
      'Description': Description,
      'Price': Price,
      'Amount': Amount,
      'Short Description': Short_Description,
      'Stock': Stock
    });
  }

  Future<void> deletesepatu(String id) async {
    sepatu.doc(id).delete();
  }

  Future<Map<String, dynamic>?> getsepatuById(String id) async {
    try {
      DocumentSnapshot documentSnapshot = await sepatu.doc(id).get();
      if (documentSnapshot.exists) {
        return documentSnapshot.data() as Map<String, dynamic>;
      }
    } catch (e) {
      print("Error getting shoes by ID: $e");
    }
    return null;
  }

  //tas
  Stream<QuerySnapshot> gettas() {
    final tasStream = tas.snapshots();
    return tasStream;
  }

  Future<void> addtas(
      String Image,
      String Name,
      String Description,
      String Price,
      String Amount,
      String Short_Description,
      String Stock) async {
    tas.add({
      'Image': Image,
      'Name': Name,
      'Description': Description,
      'Price': Price,
      'Amount': Amount,
      'Short Description': Short_Description,
      'Stock': Stock
    });
  }

  Future<void> updatetas(
      String id,
      String Image,
      String Name,
      String Description,
      String Price,
      String Amount,
      String Short_Description,
      String Stock) async {
    tas.doc(id).update({
      'Image': Image,
      'Name': Name,
      'Description': Description,
      'Price': Price,
      'Amount': Amount,
      'Short Description': Short_Description,
      'Stock': Stock
    });
  }

  Future<void> deletetas(String id) async {
    tas.doc(id).delete();
  }

  Future<Map<String, dynamic>?> gettasById(String id) async {
    try {
      DocumentSnapshot documentSnapshot = await tas.doc(id).get();
      if (documentSnapshot.exists) {
        return documentSnapshot.data() as Map<String, dynamic>;
      }
    } catch (e) {
      print("Error getting bag by ID: $e");
    }
    return null;
  }

  //aksesoris
  Stream<QuerySnapshot> getaksesoris() {
    final aksesorisStream = aksesoris.snapshots();
    return aksesorisStream;
  }

  Future<void> addaksesoris(
      String Image,
      String Name,
      String Description,
      String Price,
      String Amount,
      String Short_Description,
      String Stock) async {
    aksesoris.add({
      'Image': Image,
      'Name': Name,
      'Description': Description,
      'Price': Price,
      'Amount': Amount,
      'Short Description': Short_Description,
      'Stock': Stock
    });
  }

  Future<void> updateaksesoris(
      String id,
      String Image,
      String Name,
      String Description,
      String Price,
      String Amount,
      String Short_Description,
      String Stock) async {
    aksesoris.doc(id).update({
      'Image': Image,
      'Name': Name,
      'Description': Description,
      'Price': Price,
      'Amount': Amount,
      'Short Description': Short_Description,
      'Stock': Stock
    });
  }

  Future<void> deleteaksesoris(String id) async {
    aksesoris.doc(id).delete();
  }

  Future<Map<String, dynamic>?> getaksesorisById(String id) async {
    try {
      DocumentSnapshot documentSnapshot = await aksesoris.doc(id).get();
      if (documentSnapshot.exists) {
        return documentSnapshot.data() as Map<String, dynamic>;
      }
    } catch (e) {
      print("Error getting accessories by ID: $e");
    }
    return null;
  }

  //discount
  Stream<QuerySnapshot> getdiscount() {
    final discountStream = discount.snapshots();
    return discountStream;
  }

  Future<void> adddiscount(String Image) async {
    discount.add({'Image': Image});
  }

  Future<void> updatediscount(String id, String Image) async {
    discount.doc(id).update({'Image': Image});
  }

  Future<void> deletediscount(String id) async {
    discount.doc(id).delete();
  }

  Future<Map<String, dynamic>?> getadiscountById(String id) async {
    try {
      DocumentSnapshot documentSnapshot = await discount.doc(id).get();
      if (documentSnapshot.exists) {
        return documentSnapshot.data() as Map<String, dynamic>;
      }
    } catch (e) {
      print("Error getting accessories by ID: $e");
    }
    return null;
  }

  //categories
  Stream<QuerySnapshot> getcategories() {
    final categoriesStream = categories.snapshots();
    return categoriesStream;
  }

  Future<void> addcategories(String Image, String Name) async {
    categories.add({'Image': Image, 'Name': Name});
  }

  Future<void> updatecategories(String id, String Image, String Name) async {
    categories.doc(id).update({'Image': Image, 'Name': Name});
  }

  Future<void> deletecategories(String id) async {
    categories.doc(id).delete();
  }

  Future<Map<String, dynamic>?> getcategoriesById(String id) async {
    try {
      DocumentSnapshot documentSnapshot = await categories.doc(id).get();
      if (documentSnapshot.exists) {
        return documentSnapshot.data() as Map<String, dynamic>;
      }
    } catch (e) {
      print("Error getting categories by ID: $e");
    }
    return null;
  }

//cart
  Stream<QuerySnapshot> getcart() {
    final cartStream = cart.snapshots();
    return cartStream;
  }

  Future<void> addcart(String Image, String Name, String Price, String Quantity,
      String Stock) async {
    cart.add({
      'Image': Image,
      'Name': Name,
      'Price': Price,
      'Quantity': Quantity,
      'Stock': Stock
    });
  }

  Future<void> updatecart(String id, String Image, String Name, String Price,
      String Quantity, String Stock) async {
    cart.doc(id).update({
      'Image': Image,
      'Name': Name,
      'Price': Price,
      'Quantity': Quantity,
      'Stock': Stock
    });
  }

  Future<void> deletecart(String id) async {
    cart.doc(id).delete();
  }

  Future<Map<String, dynamic>?> getcartById(String id) async {
    try {
      DocumentSnapshot documentSnapshot = await cart.doc(id).get();
      if (documentSnapshot.exists) {
        return documentSnapshot.data() as Map<String, dynamic>;
      }
    } catch (e) {
      print("Error getting accessories by ID: $e");
    }
    return null;
  }

  //users
  Stream<QuerySnapshot> getusers() {
    final usersStream = users.snapshots();
    return usersStream;
  }

  Future<void> addusers(String email, String fullname, String username) async {
    users.add({'email': email, 'fullname': fullname, 'username': username});
  }

  Future<void> updateusers(
      String id, String email, String fullname, String username) async {
    users
        .doc(id)
        .update({'email': email, 'fullname': fullname, 'username': username});
  }

  Future<void> deleteusers(String id) async {
    users.doc(id).delete();
  }

  Future<Map<String, dynamic>?> getUsersById(String id) async {
    try {
      DocumentSnapshot documentSnapshot = await users.doc(id).get();
      if (documentSnapshot.exists) {
        return documentSnapshot.data() as Map<String, dynamic>;
      }
    } catch (e) {
      print("Error getting users by ID: $e");
    }
    return null;
  }
}
