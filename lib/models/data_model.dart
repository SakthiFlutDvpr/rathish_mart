class DataSource {
  List<Map<String, dynamic>> data = [
    // watches ................................................................

    {
      'title': "Wrist Watches",
      'product_items': [
        {
          'name': 'Elegant Watch',
          'image': 'assets/watch_1.jpeg',
          'price': 1200,
          'size': ['S', 'M', 'L'],
          'description': "A sleek and elegant wristwatch for formal occasions."
        },
        {
          'name': 'Sporty Watch',
          'image': 'assets/watch_2.jpeg',
          'price': 800,
          'size': ['M', 'L'],
          'description': "A durable watch designed for sports enthusiasts."
        },
        {
          'name': 'Classic Watch',
          'image': 'assets/watch_3.jpg',
          'price': 1500,
          'size': ['S', 'M', 'L'],
          'description': "A classic wristwatch with a timeless design."
        },
      ]
    },

    // shoes ..................................................................

    {
      'title': "Modern Shoes",
      'product_items': [
        {
          'name': 'Running Shoes',
          'image': 'assets/shoe_1.jpg',
          'price': 1500,
          'size': [8, 9, 10, 11],
          'description':
              "Lightweight running shoes with excellent grip and comfort."
        },
        {
          'name': 'Leather Boots',
          'image': 'assets/shoe_2.jpg',
          'price': 2200,
          'size': [7, 8, 9, 10],
          'description':
              "Stylish leather boots that offer durability and fashion."
        },
        {
          'name': 'Casual Sneakers',
          'image': 'assets/shoe_3.jpg',
          'price': 1100,
          'size': [6, 7, 8, 9, 10],
          'description': "Comfortable sneakers for a relaxed, casual look."
        },
        {
          'name': 'Formal Shoes',
          'image': 'assets/shoe_4.jpg',
          'price': 1800,
          'size': [7, 8, 9, 10, 11],
          'description':
              "Elegant formal shoes perfect for business or special occasions."
        },
      ]
    },

    // clothes.................................................................

    {
      'title': "Modern Clothes",
      'product_items': [
        {
          'name': 'Casual T-Shirt',
          'image': 'assets/cloth_1.jpg',
          'price': 300,
          'size': ['S', 'M', 'L', 'XL'],
          'description': "A comfortable and stylish t-shirt for everyday wear."
        },
        {
          'name': 'Denim Jacket',
          'image': 'assets/cloth_3.jpg',
          'price': 1200,
          'size': ['M', 'L', 'XL'],
          'description': "A rugged denim jacket perfect for a casual look."
        },
        {
          'name': 'Formal Shirt',
          'image': 'assets/cloth_4.jpg',
          'price': 900,
          'size': ['S', 'M', 'L', 'XL'],
          'description':
              "A crisp and professional formal shirt for business settings."
        },
        {
          'name': 'Hoodie',
          'image': 'assets/cloth_2.jpg',
          'price': 800,
          'size': ['M', 'L', 'XL'],
          'description': "A cozy hoodie for cool weather."
        },
      ]
    },

    // sun galsses ............................................................

    {
      'title': "Modern Shoes",
      'product_items': [
        {
          'name': 'Aviator Sunglasses',
          'image': 'assets/glass_1.jpeg',
          'price': 600,
          'size': ['Standard'],
          'description': "Classic aviator sunglasses with UV protection."
        },
        {
          'name': 'Round Sunglasses',
          'image': 'assets/glass_2.jpeg',
          'price': 450,
          'size': ['Standard'],
          'description': "Stylish round sunglasses for a retro look."
        },
        {
          'name': 'Sport Sunglasses',
          'image': 'assets/glass_3.jpeg',
          'price': 700,
          'size': ['Standard'],
          'description':
              "Durable sport sunglasses designed for outdoor activities."
        },
      ]
    },
  ];
}

class DataModel {
  List<ProductModel> productModels;

  DataModel({required this.productModels});

  factory DataModel.fromJson(List json) {
    return DataModel(
        productModels: List.from(json).map((productModel) {
      return ProductModel.fromJson(productModel);
    }).toList());
  }
}

class ProductModel {
  final String title;
  final List<Product> products;

  ProductModel({required this.title, required this.products});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        title: json['title'],
        products: List.from(json['product_items']).map((product) {
          return Product.fromJson(product);
        }).toList());
  }
}

class Product {
  final String name;
  int value = 0;
  final String image;
  final String price;
  final List<String> size;
  final String description;

  Product(
      {required this.name,
      required this.image,
      required this.price,
      required this.size,
      required this.description});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        name: json['name'],
        image: json['image'],
        price: json['price'].toString(),
        size: List.from(json['size']).map((e) => e.toString()).toList(),
        description: json['description']);
  }
}
