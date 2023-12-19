import 'package:finalproject/screens/details.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  HomePage({super.key});

  List Categories = [
    {
      "Iconname": Icons.laptop,
      "title": "laptop",
    },
    {
      "Iconname": Icons.phone_android,
      "title": "Phone",
    },
    {
      "Iconname": Icons.tv,
      "title": "TV",
    },
    {
      "Iconname": Icons.microwave,
      "title": "microwave",
    },
    {
      "Iconname": Icons.electric_car,
      "title": "bike",
    },
    {
      "Iconname": Icons.electric_bike,
      "title": "Car",
    },
  ];
  List images = [
    {
      "image": "images/laptop-1242570.jpg",
      "title": "laptop",
      "subtitle": "350\$"
    },
    {
      "image": "images/francesco-1bBCtUAUMFI-unsplash.jpg",
      "title": "Phone",
      "subtitle": "250\$"
    },
    {
      "image":
          "images/—Pngtree—realistic stereo product physical lcd_4566525.png",
      "title": "TV",
      "subtitle": "450\$"
    },
    {
      "image": "images/8-2-watch-free-download-png.png",
      "title": "Watch",
      "subtitle": "150\$"
    },
    {
      "image": "images/red-luxury-sedan-road.jpg",
      "title": "Car",
      "subtitle": "1520\$"
    },
    {
      "image": "images/pngimg.com - microwave_PNG15732.png",
      "title": "Microwave",
      "subtitle": "220\$"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "search",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearch());
              },
              icon: const Icon(Icons.search),
              color: Colors.black,
            )
          ]),
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 40,
          selectedItemColor: Colors.orange,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          ]),
      body: Container(
        padding: const EdgeInsets.all(25),
        child: ListView(
          children: [
            Container(
              height: 30,
            ),
            const Text(
              "Categories",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Container(
              height: 20,
            ),
            Container(
              height: 100,
              child: ListView.builder(
                  itemCount: Categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(100),
                            ),
                            padding: const EdgeInsets.all(15),
                            child: Icon(
                              Categories[i]["Iconname"],
                              size: 40,
                            ),
                          ),
                          Text(
                            Categories[i]["title"],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: const Text(
                "Best Selling",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            GridView.builder(
              itemCount: images.length,
              padding: const EdgeInsets.all(10),
              physics:
                  const NeverScrollableScrollPhysics(), // عشان يوقف الاسكرول في الليست فيو
              shrinkWrap:
                  true, //  عشان يوقف الاسكرول في الليست فيو وتظهر الصورة
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 230),
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ItemDetails(
                              data: images[i],
                            )));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: 400,
                        color: Colors.grey[200],
                        child: Image.asset(
                          images[i]["image"],
                          height: 130
                        ,
                          fit: BoxFit.fill,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          images[i]["title"],
                        ),
                        subtitle: Text(
                          images[i]["subtitle"],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.orange),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
         
          ],
        ),
      ),
    );
  }
}

class CustomSearch extends SearchDelegate {
 
  List images = [
    {
      "image": "images/laptop-1242570.jpg",
      "title": "laptop",
      "subtitle": "350\$"
    },
    {
      "image": "images/francesco-1bBCtUAUMFI-unsplash.jpg",
      "title": "Phone",
      "subtitle": "250\$"
    },
    {
      "image":
          "images/—Pngtree—realistic stereo product physical lcd_4566525.png",
      "title": "TV",
      "subtitle": "450\$"
    },
    {
      "image": "images/8-2-watch-free-download-png.png",
      "title": "Watch",
      "subtitle": "150\$"
    },
    {
      "image": "images/red-luxury-sedan-road.jpg",
      "title": "Car",
      "subtitle": "1520\$"
    },
    {
      "image": "images/pngimg.com - microwave_PNG15732.png",
      "title": "Microwave",
      "subtitle": "220\$"
    },
  ];
  List? filterimages;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
      return  GridView.builder(
              itemCount: images.length,
              padding: const EdgeInsets.all(10),
              physics:
                  const NeverScrollableScrollPhysics(), // عشان يوقف الاسكرول في الليست فيو
              shrinkWrap:
                  true, //  عشان يوقف الاسكرول في الليست فيو وتظهر الصورة
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 230),
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ItemDetails(
                              data: images[i],
                            )));
                  },);
  });}

  @override
  Widget buildSuggestions(BuildContext context) { // body search
    if (query == ""){
        return ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, i) {
          return InkWell(
             onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ItemDetails(
                              data: images[i],
                            )));
                  },
            child: Card(
              child: Padding(padding: const EdgeInsets.all(10),
              child: Text(
                "${images[i]["title"]}",
                style:const  TextStyle(fontSize: 16),
              ),
            )),
          );
        });

    }else {
      filterimages = images.where((element) => element(query)).toList();
       return ListView.builder(
        itemCount: filterimages!.length,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: (){
              showResults((context));
            },
            child: Card(
              child: Padding(padding: const EdgeInsets.all(10),
              child: Text(
                "${filterimages![i]}",
                style:const  TextStyle(fontSize: 16),
              ),
            )),
          );
        });
    }
  
  }
}
