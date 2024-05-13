class CarsModel {
  final String name;
  final String image;
  final String price;
  final String category;
  final String description;
  final String make;

  CarsModel({
    required this.name,
    required this.image,
    required this.price,
    required this.category,
    required this.description,
    required this.make,
  });

  static List<CarsModel> carList = [
    CarsModel(
      name: 'Honda Civic',
      image: 'assets/images/civic.jpg',
      price: '150',
      category: 'Sedan',
      description:
          'Rent the stylish and reliable Honda Civic for your next trip. With its sleek design and advanced features, the Civic offers a comfortable and enjoyable driving experience.',
      make: 'Honda',
    ),
    CarsModel(
      name: 'Toyota Corolla',
      image: 'assets/images/corrola.jpg',
      price: '100',
      category: 'Sedan',
      description:
          'Experience the efficiency and practicality of the Toyota Corolla. Ideal for city driving and long journeys, the Corolla combines fuel efficiency with comfort and safety.',
      make: 'Toyota',
    ),
    CarsModel(
      name: 'Suzuki Alto',
      image: 'assets/images/alto.jpg',
      price: '50',
      category: 'Hatchback',
      description:
          'Get around town with ease in the Suzuki Alto. Compact and agile, the Alto is perfect for navigating busy streets and tight parking spaces.',
      make: 'Suzuki',
    ),
    CarsModel(
      name: 'BMW',
      image: 'assets/images/bmw.jpg',
      price: '500',
      category: 'Sedan',
      description:
          'Indulge in luxury and performance with the BMW. With its premium features and powerful engine, the BMW offers a truly exhilarating driving experience.',
      make: 'BMW',
    ),
  ];
}
