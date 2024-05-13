import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentala_app/Model/CarsModel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<String> carsLogo = [
    'All',
    'assets/images/bmwlogo.jpg',
    'assets/images/hondalogo.jpg',
    'assets/images/suzukilogo.jpg',
    'assets/images/toyotalogo.jpg',
  ];
  final List<String> carLogo = [
    'All',
    'BMW',
    'Honda',
    'Suzuki',
    'Toyota',
  ];

  String selectedCar = 'All';
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: Image.asset('assets/images/menuicon.png'),
        title: Text(
          'Rental Cars',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey[200],
            ),
            child: TextFormField(
              controller: searchController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: 'Search Cars ...',
                border: InputBorder.none,
                icon: Icon(
                  Icons.search,
                  color: Colors.indigo,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: carLogo.length,
              itemBuilder: (context, index) {
                String carName = carLogo[index];
                String carLogoPath = carsLogo[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCar = carName;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    height: 30,
                    width: 60,
                    decoration: BoxDecoration(
                      color: selectedCar == carName
                          ? Colors.indigo
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: carLogoPath == 'All'
                        ? Center(
                            child: Text(
                            'All',
                            style: TextStyle(
                              color: selectedCar == carName
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ))
                        : Image(
                            fit: BoxFit.contain,
                            height: 30,
                            width: 30,
                            image: AssetImage(carLogoPath),
                          ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20.0),
          Expanded(
            child: ListView.builder(
              itemCount: CarsModel.carList.length,
              itemBuilder: (context, index) {
                var data = CarsModel.carList[index];
                if (selectedCar != 'All' && data.make != selectedCar) {
                  return const SizedBox();
                }
                return Container(
                  height: 150,
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          height: 100,
                          width: 150,
                          fit: BoxFit.cover,
                          image: AssetImage(data.image),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 30),
                              Text(
                                data.name,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                data.make,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\$${data.price}",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  MaterialButton(
                                    height: 40,
                                    minWidth: 60,
                                    color: Colors.indigo,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      'Book Now',
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
