import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ui/widgets/navBar.dart';
import 'dart:math' as math;

import 'package:food_ui/widgets/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> items = [
    'https://static.vecteezy.com/system/resources/previews/015/933/115/non_2x/chole-bhature-is-a-north-indian-food-dish-a-combination-of-chana-masala-and-bhatura-or-puri-free-photo.jpg',
    'https://i.pinimg.com/564x/b8/a7/5e/b8a75e580a202cce7ac6bc3693e96672.jpg',
    'https://images.herzindagi.info/image/2018/Oct/indian-foods-loved-by-foreigners.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7LbdMP2BE85O9CA35ZOEzidcMYvJb9IBDFg&s',
    'https://rainbowplantlife.com/wp-content/uploads/2021/02/braised-indian-chickpea-stew-in-bowl-with-naan-and-yogurt-1-of-1-500x500.jpg',
    'https://www.thespruceeats.com/thmb/hqqNrNhIpqPqV2u0T0K-IUzUsEo=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/SES-cuisine-of-north-india-1957883-d32a933f506d43f59ac38a8eb956884a.jpg'
  ];
  List<String> title = [
    'Chole Bhature',
    'Burger',
    'Matka Beryani',
    'Sabzi Roti',
    'Choly',
    'Cuisine'
  ];
  List<String> discription = [
    'Chole Bhature is a North Indian food dish. A combination of Chana Masala and Bhatura or Puri',
    'Burger',
    'Matka Chicken Beryani',
    'Sabzi Roti',
    'Indian Foods Loved By Foreigners',
    'Cuisine'
  ];
  List<String> rating = [
    '4.2',
    '4.3',
    '4.1',
    '4.5',
    '4.4',
    '3.9',
  ];
  List<String> time = [
    '20Min',
    '30Min',
    '40Min',
    '25Min',
    '35Min',
    '45Min',
  ];

  List<String> category = [
    '🥗 All Foods',
    '🍔 Burger',
    '🍛 Biryani',
    '🍕 Pizza',
    '🍝 Pasta',
  ];
  late PageController pageController;
  double currentPage = 0.0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.8,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        currentPage = pageController.page ?? 0.0;
      });
    });
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page ?? 0.0;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  String currentindex = '🥗 All Foods';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Food UI'),
      ),
      body: Column(
        children: [
          const Profile(),
          SizedBox(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: category.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentindex = category[index];
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        width: 120,
                        decoration: BoxDecoration(
                            color: currentindex == category[index]
                                ? Colors.green
                                : Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                            child: Text(
                          category[index],
                          style: TextStyle(
                              color: currentindex == category[index]
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 18),
                        )),
                      ),
                    );
                  })),
          Expanded(
            flex: 8,
            child: PageView.builder(
              controller: pageController,
              itemCount: items.length,
              itemBuilder: (context, index) {
                double angle = (currentPage - index) * (2 * math.pi);
                return AnimatedBuilder(
                  animation: pageController,
                  builder: (context, child) {
                    double pageValue = pageController.page ?? 0.0;
                    double delta = (index - pageValue).abs();
                    double scale = 1 - (delta * 0.3).clamp(0.0, 0.3);

                    return SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Column(
                        children: [
                          Container(
                            height: 350,
                            width: 400,
                            margin: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: Colors.green.shade200,
                                borderRadius: BorderRadius.circular(20)),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  child: Transform.rotate(
                                    angle: angle,
                                    child: Center(
                                      child: Transform.scale(
                                        scale: scale,
                                        child: Container(
                                          height: 200,
                                          width: 200,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.green.shade600,
                                                  width: 18),
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      items[index]),
                                                  fit: BoxFit.cover)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 20,
                                  left: 70,
                                  child: Column(
                                    children: [
                                      Text(
                                        title[index],
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            time[index],
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                          const SizedBox(
                                            width: 35,
                                          ),
                                          const Icon(
                                            Icons.star_border,
                                            color: Colors.yellow,
                                          ),
                                          Text(
                                            rating[index],
                                            style: TextStyle(fontSize: 18),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Container(
                                          height: 50,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: const Icon(
                                            CupertinoIcons.cart,
                                            color: Colors.white,
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Navbar()
        ],
      ),
    );
  }
}
