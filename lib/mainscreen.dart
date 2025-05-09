import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fooddelivery_app/Add%20to%20cart.dart';
import 'package:fooddelivery_app/api.dart';
import 'package:fooddelivery_app/provider.dart';
import 'package:provider/provider.dart';

class page4 extends StatefulWidget {
  page4({super.key});

  @override
  State<page4> createState() => _page3State();
}

class _page3State extends State<page4> {
  Networking net = Networking();
  final TextEditingController searchController = TextEditingController();
  List<String> image = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPQeOegaKvREOZ7jWssbdXXPjOt0HC6q0YXQ&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuxtTPBwxo-2EzMAgtiWAsZ-d9K4Un9FxRNw&s",
    "https://content.jdmagicbox.com/comp/kozhikode/g5/0495px495.x495.220317013138.k8g5/catalogue/broast-club-nadapuram-kozhikode-fast-food-k48t6wqtz7.jpg"
  ];
  void initState() {
    super.initState();
    fetchitems();
  }

  Future<void> fetchitems() async {
    var items = await net.multiuser();
    Provider.of<filter>(context, listen: false).setitem(items);
  }

  Widget build(BuildContext context) {
    final favProvider = Provider.of<favour>(context);
    final receipeprovider = Provider.of<filter>(context);
    final filtereditems = receipeprovider.filtereditems;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        toolbarHeight: 130,
        title: Row(
          children: [
            Container(
              width: 250,
              child: TextField(
                onChanged: (value) {
                  receipeprovider.filteritems(value);
                },
                controller: searchController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: InkWell(
                    onTap: () {
                      searchController.clear();
                      receipeprovider.filteritems('');
                    },
                    child: Icon(Icons.search, color: Colors.black, size: 20),
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.black, fontSize: 15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.grey[400],
        child: ListView(
          children: [
            ListTile(
              title: Text(
                "Profile",
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                "settings",
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                "Refer and earn",
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(
                CupertinoIcons.group_solid,
                color: Colors.white,
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                "Payment details",
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(
                Icons.payment,
                color: Colors.white,
              ),
            ),
            Divider(),
            InkWell(
                onTap: () {
                  // logout();
                },
                child: ListTile(
                  title: Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                ))
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Carousel Slider
          SizedBox(
            height: 200,
            child: CarouselSlider.builder(
              options: CarouselOptions(
                  autoPlay: true, autoPlayInterval: Duration(seconds: 2)),
              itemCount: image.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Container(
                  width: double.infinity,
                  height: 300,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(image[index]),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: SizedBox(
                height: 500,
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: filtereditems.length,
                  padding: EdgeInsets.all(5),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.6,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemBuilder: (context, index) {
                    final item = filtereditems[index];
                    return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[300]),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Cartscreen(
                                              id: item.id,
                                            ),
                                          ));
                                    },
                                    child: Image.network("${item.image}",
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${item.rating} ratings",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      favProvider.isFavorite(item.id)
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: favProvider.isFavorite(item.id)
                                          ? Colors.red
                                          : Colors.white,
                                      size: 25,
                                    ),
                                    onPressed: () {
                                      favProvider.toggle(item.id);
                                    },
                                  ),
                                ],
                              ),
                              Text(
                                "${item.name}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ]));
                  },
                )),
          ),
        ],
      ),
    );
  }
}
