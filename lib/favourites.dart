import 'package:flutter/material.dart';
import 'package:fooddelivery_app/data_model.dart';

class Favourites extends StatefulWidget {
   Favourites({super.key});


  @override

  State<Favourites> createState() => _FavouritesState();
}


class _FavouritesState extends State<Favourites> {
  List<Map<String, dynamic>> favouritesList = [];

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  void loadFavorites() async {
    final favs = await DataModel.instance.getAllFavorites();
    setState(() {
      var favour = favs.map((e) => e['id'] as int).toList();
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: favouritesList.isEmpty
          ? Center(child: Text("No favorites found"))
          : ListView.builder(
        itemCount: favouritesList.length,
        itemBuilder: (context, index) {
          final item = favouritesList[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  item['image'],
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(item['name']),
              subtitle: Text("Rating: ${item['rating']}"),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () async {
                  await DataModel.instance.deleteFavorite(item['id']);
                  loadFavorites();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
