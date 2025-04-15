import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fooddelivery_app/Add%20to%20cart.dart';
import 'package:fooddelivery_app/api.dart';
import 'package:fooddelivery_app/intropage.dart';
import 'package:fooddelivery_app/modelclass.dart';
import 'package:fooddelivery_app/signup.dart';
class page4 extends StatefulWidget {
   page4({super.key});

  @override
  State<page4> createState() => _page3State();
}
class _page3State extends State<page4> {
  Networking net = Networking();
  var favour =[];
  var currentindex=0;
  final TextEditingController searchController = TextEditingController();
  List<String> image=["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPQeOegaKvREOZ7jWssbdXXPjOt0HC6q0YXQ&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuxtTPBwxo-2EzMAgtiWAsZ-d9K4Un9FxRNw&s",
    "https://content.jdmagicbox.com/comp/kozhikode/g5/0495px495.x495.220317013138.k8g5/catalogue/broast-club-nadapuram-kozhikode-fast-food-k48t6wqtz7.jpg"];
  Widget build(BuildContext context) {
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
                controller: searchController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: InkWell(
                    onTap: () {
                      searchController.clear();
                    },
                    child: Icon(Icons.search, color: Colors.black, size: 20),
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.black, fontSize: 15),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
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
            ListTile(title: Text("Profile",),leading: Icon(CupertinoIcons.profile_circled),),
            Divider(),
            ListTile(title: Text("settings"),leading: Icon(Icons.settings),),
            Divider(),
            ListTile(title: Text("Refer and earn"),leading: Icon(CupertinoIcons.group_solid),),
            Divider(),
            ListTile(title: Text("Payment details"),leading: Icon(Icons.payment),),
            Divider(),
            ListTile(title: Text("Logout"),leading: Icon(Icons.logout),)
          ],
      ),),
      backgroundColor: Colors.white,
      body:  Column(
        children: [
          // Carousel Slider
          SizedBox(
            height: 200,
            child: CarouselSlider.builder(
              options: CarouselOptions(autoPlay: true, autoPlayInterval: Duration(seconds: 5)),
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
            child: SizedBox(height: 500,
              child:FutureBuilder(future: net.multiuser(), builder: (context, snapshot) {
                return GridView.builder(
                  itemCount: snapshot.data?.length,
                  padding: EdgeInsets.all(5),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                childAspectRatio: 1/1.6,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,),

                  itemBuilder: (context, index) {
                    final item=snapshot.data![index];
                    final vb=snapshot.data![index].ingredients;
                    return Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey[300]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Cart(id:item.id,),));},
                                      child: Image.network("${snapshot.data?[index].image}", fit: BoxFit.cover)),),
                                SizedBox(height: 5,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("${snapshot.data?[index].rating} ratings",style: TextStyle(fontWeight: FontWeight.bold),),
                                              IconButton(

                                                  onPressed: () {
                                                setState(() {
                                                  favour.add(index);
                                                });
                                              }, icon:Icon(Icons.favorite,color: favour.contains(index)?Colors.red:Colors.white)
                                              ),
                                            ],
                                          ),
                                          Text("${snapshot.data?[index].name}",
                                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                                          ),
                      ]
                    )
                    );
                    },
                );

              })
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.blue),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomNavigationBar(
              unselectedItemColor: Colors.black,
              selectedItemColor: Colors.grey,
              currentIndex: currentindex,
              onTap: (value) {
                setState(() {
                  currentindex=value;
                });
              },
              items:
          [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home',),
            BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'favourites'),
            BottomNavigationBarItem(icon: Icon(Icons.qr_code),label: 'scan'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'cart'),
          ]),
        ),
      ),
    );
  }
}

