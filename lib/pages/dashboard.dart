import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product-provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final provider = Provider.of<ProductData>(context,listen: false);
    if(provider.products!.isEmpty){
      print('------> get product data');
      provider.getProductData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('products'),
        centerTitle: true,
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  elevation: 0,
                  side: BorderSide.none
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person),
                  Text('register'),
                ],
              )
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Consumer<ProductData>(
          builder: (context,product,child) {
            final provider = Provider.of<ProductData>(context,listen: false);
            return ListView.builder(
              itemCount: provider.products!.length,
              itemBuilder: (context,index) => Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Colors.lightBlue,
                          Colors.blue,
                          Colors.lightBlueAccent
                        ]
                    )
                ),
                child: ProductCard(image: provider.products!.elementAt(index).image,
                  price: provider.products!.elementAt(index).price,
                  description: provider.products!.elementAt(index).description,
                  title: provider.products!.elementAt(index).title,
                  rating: provider.products!.elementAt(index).rate,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}



class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final double rating;
  final double price;

  ProductCard({
    required this.image,
    required this.title,
    required this.description,
    required this.rating,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Image.network(
            image,
            height: 200,
            width: double.infinity,
            fit: BoxFit.fitHeight,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Rating: $rating',
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Price: $price',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}