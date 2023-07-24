import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CollectionReference _products =
      FirebaseFirestore.instance.collection('products');

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  //update method
  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _nameController.text = documentSnapshot['name'];
      _priceController.text = documentSnapshot['price'].toString();
    }

    await showModalBottomSheet(
        backgroundColor: Colors.grey[900],
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Courier New',
                      fontSize: 25.0),
                  controller: _nameController,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: 'Name',
                    labelStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Courier New',
                        fontSize: 25.0),
                  ),
                ),
                TextField(
                  style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Courier New',
                      fontSize: 25.0),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _priceController,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: 'Price',
                    labelStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Courier New',
                        fontSize: 25.0),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: const Text(
                    'Update',
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Courier New',
                        fontSize: 25.0),
                  ),
                  onPressed: () async {
                    final String name = _nameController.text;
                    final double? price =
                        double.tryParse(_priceController.text);
                    if (price != null) {
                      await _products
                          .doc(documentSnapshot!.id)
                          .update({"name": name, "price": price});
                      _nameController.text = '';
                      _priceController.text = '';
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  //create method
  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _nameController.text = documentSnapshot['name'];
      _priceController.text = documentSnapshot['price'].toString();
    }

    await showModalBottomSheet(
        backgroundColor: Colors.grey[900],
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Courier New',
                      fontSize: 25.0),
                  controller: _nameController,
                  decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      labelText: 'Name',
                      labelStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Courier New',
                          fontSize: 25.0)),
                ),
                TextField(
                  style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Courier New',
                      fontSize: 25.0),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _priceController,
                  decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      labelText: 'Price',
                      labelStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Courier New',
                          fontSize: 25.0)),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: const Text('Add',
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Courier New',
                          fontSize: 25.0)),
                  onPressed: () async {
                    final String name = _nameController.text;
                    final double? price =
                        double.tryParse(_priceController.text);
                    if (price != null) {
                      await _products.add({"name": name, "price": price});
                      _nameController.text = '';
                      _priceController.text = '';
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  Future<void> _delete(String productID) async {
    await _products.doc(productID).delete();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.grey[900],
        content: Text(
          'You have succesfully deleted a product',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
              fontFamily: 'Courier New'),
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //create floating action button
      floatingActionButton: FloatingActionButton(
          shape: const StadiumBorder(
              side: BorderSide(color: Colors.grey, width: 2)),
          backgroundColor: Colors.grey[900],
          child: Icon(Icons.add, color: Colors.grey),
          onPressed: () => _create()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      backgroundColor: Colors.black,
      appBar: AppBar(
        shape: Border(bottom: BorderSide(color: Colors.grey, width: 2)),
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: const Text(
          'Expenses',
          style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w700,
              color: Colors.grey,
              fontFamily: 'Courier New'),
        ),
      ),
      body: StreamBuilder(
        stream: _products.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
                    child: ListTile(
                      tileColor: Colors.grey[900],
                      title: Text(
                        documentSnapshot['name'],
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                            fontFamily: 'Courier New'),
                      ),
                      subtitle: Text(
                        '\$' + documentSnapshot['price'].toString(),
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                            fontFamily: 'Courier New'),
                      ),

                      //update icon button
                      trailing: SizedBox(
                        width: 100,
                        child: Row(children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.grey),
                            onPressed: () => _update(documentSnapshot),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete_outline_rounded,
                                color: Colors.grey),
                            onPressed: () => _delete(documentSnapshot.id),
                          )
                        ]),
                      ),
                    ),
                  );
                });
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
