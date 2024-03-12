import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/movie_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buscador',
      debugShowCheckedModeBanner: false,
      home: const SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  static List<MovieModel> mainMovieList = [
    MovieModel("El mapa de los anhelos", 2020, 9.3,
        "https://tse3.mm.bing.net/th?id=OIP.A0hPJkWWHG6HcwGmvcaJZgHaJ3&pid=Api&P=0&h=180"),
    MovieModel(
        "Alas de Hierro",2019,9.5,
        "https://tse3.mm.bing.net/th?id=OIP.4ar2j3c2J-O1HK3hFndLwgHaLW&pid=Api&P=0&h=180"),
    MovieModel("Bajo La Misma Estrella ", 2018, 9.3,
        "https://tse3.mm.bing.net/th?id=OIP.Pk64yRFEoFihyMjp_qfAKQHaLo&pid=Api&P=0&h=180"),
    MovieModel("La Seleccion", 2019, 9.5,
        "https://tse1.mm.bing.net/th?id=OIP.b95cmwRDzvekB8aSP3oSggAAAA&pid=Api&P=0&h=180"),
    MovieModel("Un cuento Perfecto", 2017, 9.0,
        "https://tse1.mm.bing.net/th?id=OIP.61RoWxcupyRH0JpL5WLvTAHaLl&pid=Api&P=0&h=180"),
    MovieModel("Cartas De Amor A Los Muertos", 2016, 9.1,
        "https://tse1.mm.bing.net/th?id=OIP.p15OSL_CLu873yylGxm-3QHaHa&pid=Api&P=0&h=180"),
        MovieModel("El Jardin De Las Mariposas ", 2019, 9.8,
        "https://tse1.mm.bing.net/th?id=OIP.7Avs_PO0FjkxCkQT4bo1twHaHa&pid=Api&P=0&h=180"),
        MovieModel("Fabricante de Lagrimas ", 2024, 9.9,
        "https://m.media-amazon.com/images/I/41Co3m1IWfL.jpg"),
  ];

  List<MovieModel> displayList = List.from(mainMovieList);

  void updateList(String value) {
   setState(() {
     displayList = mainMovieList.where((element) => element.movie_title!.toLowerCase().contains(value.toLowerCase()))
     .toList();
   }); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1f1545),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1f1545),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Buscador de películas',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              onChanged: (value) =>  updateList(value),
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF1f1545),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "Buscar",
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
             child: displayList.length == 0 ?Center(child: Text("No Hay Resultados", style: TextStyle(color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold ),),):
               ListView.builder(
                itemCount: displayList.length,
                itemBuilder: (context, index) => ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  title: Text(
                    displayList[index].movie_title!,
                    style: const TextStyle(color: Colors.white, 
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text('${displayList[index].movie_release_year!}',
                  style: TextStyle(
                    color: Colors.white60
                    ),
                  ),
                  trailing: Text("${displayList[index].rating}",
                  style: TextStyle(color: Colors.amber),
                  ),
                  leading: Image.network(displayList[index].movie_poster_url!),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}