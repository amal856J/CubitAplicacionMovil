import 'package:cubit_example/models/Products.dart';

class RepositoryData{

  //Funcion que simula obtener un listado de productos de una base de datos o Servicio externo
  List<Product> getProducts() {
    return [
      Product(name: 'Refrigerator', description: 'A large fridge', price: 1000, discount: 15, stock: 5,),
      Product(name: 'Bed', description: 'A soft bed to rest in peace', price: 700, discount: 10, stock: 6, ),
      Product(name: 'TV', description: 'Excellent Tv to watch movies', price: 499.99, discount: 20, stock: 4,),
      Product(name: 'Printer', price: 1000, discount: 100, stock: 2,),
      Product(name: 'Air Conditioner', description: 'Start to feel the fresh weather', price: 1000, discount: 25, stock: 5,),
      Product(name: 'Headphones', description: 'Nice article to hear music', price: 1000, discount: 100, stock: 10, ),
      Product(name: 'Monitor', description: 'High resolution for gaming', price: 1000, discount: 100, stock: 4, ),
      Product(name: 'Drill', price: 1000, discount: 100, stock: 2, ),
    ];
  }
}