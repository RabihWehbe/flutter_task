class Product{
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final double rate;
  final double count;

  Product({required this.id,required this.title,required this.price,required this.description,
  required this.category,required this.image,required this.rate,required this.count});


  factory Product.fromJson(Map<String,dynamic> json){
    return Product(
      id: json['id'] ?? 0,
      title: json['title'] ?? "",
      price: (json['rating']['rate'] ?? 1).toDouble(),
      description : json['description'] ?? "",
      category : json['category'] ?? "",
      image: json['image'] ?? "",
      rate:  (json['rating']['rate'] ?? 1).toDouble(),
      count: (json['rating']['rate'] ?? 1).toDouble(),
    );
  }
}