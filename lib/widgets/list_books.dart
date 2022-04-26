import 'package:flutter/material.dart';
import 'package:books/widgets/images.dart';

class Movie {
  // class for list movies
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie({
    required this.imageName,
    required this.title,
    required this.time,
    required this.description,
  });
}

class MovieListWidget extends StatefulWidget {
  MovieListWidget({Key? key}) : super(key: key);

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    //создаем экземпляры класса movies
    // нельзя сделать класс константным если в нем есть неконстантные поля
    Movie(
      imageName: AppImages.pic.assetName,
      title: 'Mortal combat',
      time: 'April 4, 2021',
      description: 'Wndn bjkbk bkbkbk kbkbk kjbkbk kjbkjbbbkk bkk',
    ),
    Movie(
      imageName: AppImages.pic.assetName,
      title: 'Mortal combat 2',
      time: 'April 4, 2022',
      description: 'Dffhh dsfsdfsf kbkbk kjbkbk kjbkjbbbkk bkk',
    ),
    Movie(
      imageName: AppImages.pic.assetName,
      title: 'Mortal combat',
      time: 'April 4, 2021',
      description: 'Wndn bjkbk bkbkbk kbkbk kjbkbk kjbkjbbbkk bkk',
    ),
    Movie(
      imageName: AppImages.pic.assetName,
      title: 'Tigi combat 2',
      time: 'April 4, 2022',
      description: 'Dffhh dsfsdfsf kbkbk kjbkbk kjbkjbbbkk bkk',
    ),
    Movie(
      imageName: AppImages.pic.assetName,
      title: 'Mortal combat',
      time: 'April 4, 2021',
      description: 'Wndn bjkbk bkbkbk kbkbk kjbkbk kjbkjbbbkk bkk',
    ),
    Movie(
      imageName: AppImages.pic.assetName,
      title: 'Mortal combat 2',
      time: 'April 4, 2022',
      description: 'Dffhh dsfsdfsf kbkbk kjbkbk kjbkjbbbkk bkk',
    ),
    Movie(
      imageName: AppImages.pic.assetName,
      title: 'pin combat 2',
      time: 'April 4, 2022',
      description: 'Dffhh dsfsdfsf kbkbk kjbkbk kjbkjbbbkk bkk',
    ),
    Movie(
      imageName: AppImages.pic.assetName,
      title: 'Mortal combat',
      time: 'April 4, 2021',
      description: 'Wndn bjkbk bkbkbk kbkbk kjbkbk kjbkjbbbkk bkk',
    ),
    Movie(
      imageName: AppImages.pic.assetName,
      title: 'Get combat 2',
      time: 'April 4, 2022',
      description: 'Dffhh dsfsdfsf kbkbk kjbkbk kjbkjbbbkk bkk',
    ),
    Movie(
      imageName: AppImages.pic.assetName,
      title: 'Mortal combat 2',
      time: 'April 4, 2022',
      description: 'Dffhh dsfsdfsf kbkbk kjbkbk kjbkjbbbkk bkk',
    ),
    Movie(
      imageName: AppImages.pic.assetName,
      title: 'Mortal combat',
      time: 'April 4, 2021',
      description: 'Wndn bjkbk bkbkbk kbkbk kjbkbk kjbkjbbbkk bkk',
    ),
    Movie(
      imageName: AppImages.pic.assetName,
      title: 'Kavabanga combat 2',
      time: 'April 4, 2022',
      description: 'Dffhh dsfsdfsf kbkbk kjbkbk kjbkjbbbkk bkk',
    ),
  ];
  var _filteredMovies = <Movie>[];

  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredMovies = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredMovies = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _filteredMovies = _movies;
    _searchController.addListener(_searchMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
            padding: EdgeInsets.only(top: 70),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: _filteredMovies.length,
            itemExtent: 163,
            itemBuilder: (BuildContext context, int index) {
              final movie = _filteredMovies[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Colors.black.withOpacity(0.2)),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            )
                          ]),
                      clipBehavior: Clip.hardEdge,
                      child: Row(
                        children: [
                          Image(image: AssetImage(movie.imageName)),
                          SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Text(
                                  movie.title,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  movie.time,
                                  style: TextStyle(color: Colors.grey),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 20),
                                Text(
                                  movie.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          print('waw!!');
                        },
                      ),
                    )
                  ],
                ),
              );
            }),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Search',
              filled: true, //чтобы можно было задать fillColor
              fillColor: Colors.white.withAlpha(235),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:books/widgets/images.dart';

// class Movie {
//   // class for list movies
//   final String imageName;
//   final String title;
//   final String time;
//   final String description;

//   Movie({
//     required this.imageName,
//     required this.title,
//     required this.time,
//     required this.description,
//   });
// }

// class ListBooksWidget extends StatefulWidget {
//   ListBooksWidget({Key? key}) : super(key: key);

//   @override
//   State<ListBooksWidget> createState() => _ListBooksWidgete();
// }

// class _ListBooksWidgete extends State<ListBooksWidget> {
//   final _movies = [
//     Movie(
//       imageName: AppImages.pic.assetName,
//       title: 'Mortal combat',
//       time: 'April 4, 2021',
//       description: 'Wndn bjkbk bkbkbk kbkbk kjbkbk kjbkjbbbkk bkk',
//     ),
//     Movie(
//       imageName: AppImages.pic.assetName,
//       title: 'Mortal combat 2',
//       time: 'April 4, 2022',
//       description: 'Dffhh dsfsdfsf kbkbk kjbkbk kjbkjbbbkk bkk',
//     ),
//     Movie(
//       imageName: AppImages.pic.assetName,
//       title: 'Mortal combat',
//       time: 'April 4, 2021',
//       description: 'Wndn bjkbk bkbkbk kbkbk kjbkbk kjbkjbbbkk bkk',
//     ),
//     Movie(
//       imageName: AppImages.pic.assetName,
//       title: 'Tigi combat 2',
//       time: 'April 4, 2022',
//       description: 'Dffhh dsfsdfsf kbkbk kjbkbk kjbkjbbbkk bkk',
//     ),
//     Movie(
//       imageName: AppImages.pic.assetName,
//       title: 'Mortal combat',
//       time: 'April 4, 2021',
//       description: 'Wndn bjkbk bkbkbk kbkbk kjbkbk kjbkjbbbkk bkk',
//     ),
//     Movie(
//       imageName: AppImages.pic.assetName,
//       title: 'Mortal combat 2',
//       time: 'April 4, 2022',
//       description: 'Dffhh dsfsdfsf kbkbk kjbkbk kjbkjbbbkk bkk',
//     ),
//     Movie(
//       imageName: AppImages.pic.assetName,
//       title: 'pin combat 2',
//       time: 'April 4, 2022',
//       description: 'Dffhh dsfsdfsf kbkbk kjbkbk kjbkjbbbkk bkk',
//     ),
//     Movie(
//       imageName: AppImages.pic.assetName,
//       title: 'Mortal combat',
//       time: 'April 4, 2021',
//       description: 'Wndn bjkbk bkbkbk kbkbk kjbkbk kjbkjbbbkk bkk',
//     ),
//     Movie(
//       imageName: AppImages.pic.assetName,
//       title: 'Get combat 2',
//       time: 'April 4, 2022',
//       description: 'Dffhh dsfsdfsf kbkbk kjbkbk kjbkjbbbkk bkk',
//     ),
//     Movie(
//       imageName: AppImages.pic.assetName,
//       title: 'Mortal combat 2',
//       time: 'April 4, 2022',
//       description: 'Dffhh dsfsdfsf kbkbk kjbkbk kjbkjbbbkk bkk',
//     ),
//     Movie(
//       imageName: AppImages.pic.assetName,
//       title: 'Mortal combat',
//       time: 'April 4, 2021',
//       description: 'Wndn bjkbk bkbkbk kbkbk kjbkbk kjbkjbbbkk bkk',
//     ),
//     Movie(
//       imageName: AppImages.pic.assetName,
//       title: 'Kavabanga combat 2',
//       time: 'April 4, 2022',
//       description: 'Dffhh dsfsdfsf kbkbk kjbkbk kjbkjbbbkk bkk',
//     ),
//   ];

//   var _filteredMovies = <Movie>[];

//   final _searchController = TextEditingController();

//   void _searchMovies() {
//     final query = _searchController.text;
//     if (query.isNotEmpty) {
//       _filteredMovies = _movies.where((Movie movie) {
//         return movie.title.toLowerCase().contains(query.toLowerCase());
//       }).toList();
//     } else {
//       _filteredMovies = _movies;
//     }
//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();

//     _filteredMovies = _movies;
//     _searchController.addListener(_searchMovies);
//   }

// // class ListBooksWidget extends StatelessWidget {
// //   const ListBooksWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         ListView.builder(
//             itemCount: _filteredMovies.length,
//             itemExtent: 170,
//             itemBuilder: (BuildContext context, int index) {
//               final movie = _filteredMovies[index];
//               return Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
//                 child: Stack(
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           border:
//                               Border.all(color: Colors.black.withOpacity(0.2)),
//                           borderRadius: BorderRadius.all(Radius.circular(10)),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.1),
//                               blurRadius: 8,
//                               offset: Offset(0, 2),
//                             ),
//                           ]),
//                       child: Row(
//                         children: [
//                           Image(image: AssetImage(movie.imageName)),
//                           SizedBox(width: 15),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 SizedBox(height: 20),
//                                 Text(
//                                   movie.title,
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                                 SizedBox(height: 5),
//                                 Text(
//                                   movie.time,
//                                   style: TextStyle(color: Colors.grey),
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                                 SizedBox(height: 20),
//                                 Text(
//                                   movie.description,
//                                   maxLines: 2,
//                                   overflow: TextOverflow.ellipsis,
//                                 )
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             }),
//         Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: TextField(
//             decoration: InputDecoration(
//               labelText: 'Search',
//               filled: true, //чтобы можно было задать fillColor
//               fillColor: Colors.white.withAlpha(235),
//               border: OutlineInputBorder(),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
