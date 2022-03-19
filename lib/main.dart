// import 'dart:html';

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final List<CategoryModel> categories = [
  CategoryModel(category: 'Mountain', icon: Icons.terrain),
  CategoryModel(category: 'Forest', icon: Icons.park),
  CategoryModel(category: 'Beach', icon: Icons.beach_access),
  CategoryModel(category: 'Hiking', icon: Icons.directions_walk_rounded)
];

final List<MountModel> mountItems = [
  MountModel(
    path:
        'https://www.climbing-kilimanjaro.com/wp-content/uploads/2020/11/Mount-Kilimanjaro.jpg',
    name: 'Kilimanjaro',
    description:
        'Mount Kilimanjaro is the highest mountain in Africa also happens to be its most famous and iconic, the poster child of many African tourism brochures and campaigns, and with good reasons.',
    location: 'Tanzania',
  ),
  MountModel(
    path:
        'https://www.climbing-kilimanjaro.com/wp-content/uploads/2020/11/Mount-Kenya.jpg',
    name: 'Mount Kenya',
    description:
        'As our list reaches the final two, we bid farewell to Uganda, the Democratic Republic of Congo and the majestic Rwenzori mountains, and cross over to Kenya, where Mount Kenya awaits.',
    location: 'Kenya',
  ),
  MountModel(
    path:
        'https://www.climbing-kilimanjaro.com/wp-content/uploads/2020/11/Mount-Stanley.jpg',
    name: 'Stanley',
    description:
        'Mount Stanley is the mightiest among the Rwenzoris and is the third highest on our list of mountains in Africa.  Together with Mount Speke (number four) and Mount Baker (number five), these three mountains align into a towering triangle that encloses the Bujuku Valley below.',
    location: 'Congo and Uganda',
  ),
  MountModel(
    path:
        'https://www.climbing-kilimanjaro.com/wp-content/uploads/2020/11/Mount-Speke.jpg',
    name: 'Speke',
    description:
        'The fourth highest mountain in Africa is the second-highest in the Rwenzori mountain range. Mount Speke’s summit consists of four peaks, Vittorio Emanuele, Ensonga, Johnston, and Trident.',
    location: 'Uganda',
  ),
  MountModel(
    path:
        'https://www.climbing-kilimanjaro.com/wp-content/uploads/2020/11/Mount-Baker.jpg',
    name: 'Baker',
    description:
        'We crack into the top five with Mount Baker while not traveling far from number six Mount Emin.  Three of the five highest mountains in all of Africa are found in the Rwenzori mountain range.',
    location: 'Uganda',
  ),
];
const Color mainColor = Color(0xFFFF5656);
Color iconColor = Colors.white;

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    ), //SplashPage
  );
}

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MountsApp(),
        ),
      );
    });
    return Container(
      color: mainColor,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.terrain,
              color: iconColor,
              size: 80,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 80),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(iconColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}

//landing page
class MountsApp extends StatelessWidget {
  // const MountsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: mainColor,
        ),
        title: const Center(
          child: Icon(
            Icons.terrain,
            color: mainColor,
            size: 40,
          ),
        ),
        actions: const [
          SizedBox(
            width: 40,
            height: 60,
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: mainColor,
          padding: const EdgeInsets.all(30),
          alignment: Alignment.bottomLeft,
          child: const Icon(
            Icons.terrain,
            color: Colors.white,
            size: 80,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppHeader(),
          AppSearch(),
          Expanded(
            child: AppMountListView(),
          ),
          AppCategoryList(),
          AppBottomBar(),
        ],
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  MountModel mount;
  DetailsPage(this.mount);
  @override
  Widget build(BuildContext context) {
    var selectedItem = mountItems[1];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage(selectedItem.path),
                      fit: BoxFit.cover,
                    )),
                  ),
                  Positioned.fill(
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            mainColor.withOpacity(0.7)
                          ],
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 0,
                    right: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          selectedItem.name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          selectedItem.location,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                  AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    iconTheme: const IconThemeData(color: Colors.white),
                    title: const Center(
                      child: Icon(Icons.terrain, color: Colors.white, size: 40),
                    ),
                    actions: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: const Icon(
                          Icons.pending,
                          color: Colors.white,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Column(
            children: [
              DetailsRatingBar(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: Text(
                        'About ${selectedItem.name}',
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 20,
                      ),
                      child: Text(
                        selectedItem.description,
                        style: const TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
              DetialsBottomActions()
            ],
          ))
        ],
      ),
    );
  }
}

// -----WIDGETS-----
class AppHeader extends StatelessWidget {
  // const AppHeader({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(
          left: 30,
          top: 30,
          right: 30,
        ),
        child: Row(
          children: [
            ClipOval(
              child: Image.network(
                'https://okada-assets-production.s3.eu-west-2.amazonaws.com/applications/content/images/profilePhotos/8b31a615f3aad2fc9cb850ce83b57800.jpeg',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Hello Paschal',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Goodday',
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 12,
                  ),
                ),
              ],
            )
          ],
        ));
  }
}

class AppSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Discover Africa',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 25,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Search',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.tune,
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class AppMountListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: mountItems.length,
          itemBuilder: (BuildContext context, int index) {
            MountModel currentMount = mountItems[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(currentMount),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(10),
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(currentMount.path),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentMount.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(currentMount.location,
                        style: const TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            );
          },
        ));
  }
}

class AppCategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Category',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'See More',
                    style: TextStyle(
                      color: mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  )
                ],
              )),
          Container(
            height: 100,
            margin: const EdgeInsets.only(left: 10),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  CategoryModel currentCategory = categories[index];
                  return Container(
                    width: 100,
                    margin: const EdgeInsets.only(top: 10, right: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.grey.withOpacity(0.2), width: 2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          currentCategory.icon,
                          color: mainColor,
                        ),
                        Text(
                          currentCategory.category,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
      // height: 100,
    );
  }
}

class AppBottomBar extends StatefulWidget {
  @override
  _AppBottomBarState createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  List<AppBottomBarItem> barItems = [
    AppBottomBarItem(icon: Icons.home, label: 'Home', isSelected: true),
    AppBottomBarItem(icon: Icons.explore, label: 'Explore', isSelected: false),
    AppBottomBarItem(
        icon: Icons.turned_in_not, label: 'Tag', isSelected: false),
    AppBottomBarItem(
        icon: Icons.person_outline, label: 'Profile', isSelected: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset.zero,
          )
        ],
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(barItems.length, (index) {
            AppBottomBarItem currentBarItem = barItems[index];
            Widget barItemWidget;
            if (currentBarItem.isSelected) {
              barItemWidget = Container(
                padding: const EdgeInsets.only(
                    left: 15, top: 5, right: 15, bottom: 5),
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(
                      currentBarItem.icon,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      currentBarItem.label,
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
              );
            } else {
              barItemWidget = IconButton(
                icon: Icon(currentBarItem.icon, color: Colors.grey),
                onPressed: () {
                  setState(() {
                    barItems.forEach((AppBottomBarItem item) {
                      item.isSelected = item == currentBarItem;
                    });
                  });
                },
              );
            }
            return barItemWidget;
          })),
    );
  }
}

class DetailsRatingBar extends StatelessWidget {
  var sampleRatingData = {
    'Rating': '4.6',
    'Price': 'NGN 12',
    'Open': '24hrs',
  };
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          sampleRatingData.entries.length,
          (index) => Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.2), width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(
                  sampleRatingData.entries.elementAt(index).key,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  sampleRatingData.entries.elementAt(index).value,
                  style: const TextStyle(
                      color: mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetialsBottomActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Row(
          children: [
            Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(15),
                color: mainColor,
                child: InkWell(
                  highlightColor: Colors.white.withOpacity(0.2),
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(21),
                    child: const Text(
                      'Book Now',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  border: Border.all(color: mainColor, width: 2)),
              child:
                  const Icon(Icons.turned_in_not, color: mainColor, size: 25),
            )
          ],
        ));
  }
}

//--MODELS--
class MountModel {
  String path;
  String name;
  String location;
  String description;
  MountModel({
    this.path = '',
    this.name = '',
    this.location = '',
    this.description = '',
  });
}

class CategoryModel {
  String category;
  IconData? icon;
  CategoryModel({
    this.category = '',
    this.icon,
  });
}

class AppBottomBarItem {
  IconData? icon;
  bool isSelected;
  String label;
  AppBottomBarItem({
    this.icon,
    this.isSelected = false,
    this.label = '',
  });
}
