import 'package:flutter/material.dart';
import 'package:flutter_base_pro/api/apz_api_repository.dart';
import 'package:flutter_base_pro/models/product_model.dart';
import 'package:flutter_base_pro/themes/apz_theme_provider.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  // Create an instance of our repository to make API calls
  final AppRepository _repository = AppRepository();
  
  // This key is used to refresh the FutureBuilder when a new product is added
  Key _futureBuilderKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        actions: [
          // This is the button to toggle the theme
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      // The FutureBuilder handles the GET request automatically
      body: FutureBuilder(
        key: _futureBuilderKey,
        future: _repository.getProducts(),
        builder: (context, snapshot) {
          // While waiting for the API response, show a loading spinner
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          // If the API call failed, show an error message
          if (snapshot.hasError || !snapshot.data!.isSuccess) {
            final error = snapshot.error?.toString() ?? snapshot.data?.errorMessage;
            return Center(child: Text("An Error Occurred: $error"));
          }
          // If the call was successful, display the list of products
          final products = snapshot.data!.data!;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ListTile(
                leading: CircleAvatar(backgroundImage: NetworkImage(product.image)),
                title: Text(product.title),
                subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
              );
            },
          );
        },
      ),
      // This button triggers the POST request
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateProductDialog(context),
        child: const Icon(Icons.add),
      ),
      
    );
  }

  // This function shows a dialog to get input for the new product
  void _showCreateProductDialog(BuildContext context) {
    final titleController = TextEditingController();
    final priceController = TextEditingController();
    final descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Create New Product"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(controller: titleController, decoration: const InputDecoration(labelText: "Title")),
                TextField(controller: priceController, decoration: const InputDecoration(labelText: "Price"), keyboardType: TextInputType.number),
                TextField(controller: descriptionController, decoration: const InputDecoration(labelText: "Description")),
              ],
            ),
          ),
          
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text("Cancel")),
            ElevatedButton(
              onPressed: () async {
                // This is where the request is taken for the POST call
                final productToCreate = Product(
                  title: titleController.text,
                  price: double.tryParse(priceController.text) ?? 0.0,
                  description: descriptionController.text,
                  image: 'https://i.pravatar.cc', // Fake Store API requires an image url
                  category: 'electronic',
                );

                // Call the repository to make the POST request
                final response = await _repository.createProduct(productToCreate);

                // This is the "callback" part. We check if the response was successful.
                if (response.isSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Success! Created product with ID: ${response.data!.id}")),
                  );
                  // Refresh the list of products by changing the key of the FutureBuilder
                  setState(() {
                    _futureBuilderKey = UniqueKey();
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Error: ${response.errorMessage}")),
                  );
                }
                Navigator.of(context).pop();
              },
              child: const Text("Create"),
            ),
            
          ],
        );
        
      },
    );
  }
}