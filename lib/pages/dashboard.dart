import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/game-provider.dart';

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
                          Colors.purple,
                          Colors.purpleAccent,
                          Color(0xFFBF45ED)
                        ]
                    )
                ),
                child: Card(
                  key: ValueKey(provider.products?[index].id),
                  color: Colors.purple,
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 10),

                  child: ListTile(
                    leading: CircleAvatar(
                      child: ClipOval(
                        child: Image.network(provider.products![index].image,
                          height: 70,
                        ),
                      ),
                    ),


                    title: Text(
                      '${provider.products?[index].title}',
                      style: TextStyle(
                          color: Color(0xFF040B20),
                      ),
                    ),
                    subtitle: Text('${provider.products?[index].description}',
                      //style: TextStyle(color: Colors.white),
                    ),


                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
