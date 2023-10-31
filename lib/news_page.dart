import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

import 'const.dart';
import 'detail_page.dart';
import 'fetch_data.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late Future<Album> futureAlbum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<List<Album>>(
          future: fetchAlbum(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                '${snapshot.data![0].source.name}',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              );
            } else {
              return Text(
                  'Loading...',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              );
            }
          },
        ),
      ),
      body: FutureBuilder(
          future: fetchAlbum(),
          builder: (context, snapshot){
            if (snapshot.hasData) {
              return buildView(snapshot.data as List<Album>);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }
      ),
    );
  }

  Widget buildView(List<Album> albums){
    return MasonryGridView.count(
        mainAxisSpacing: 10,
        crossAxisSpacing: 8,
        crossAxisCount: 2,
        itemCount: albums.length,
        itemBuilder: (context, index) {
          final album = albums[index];
          return InkWell(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    albums[index].urlToImage,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    '${album.title}',
                    style: title,
                  ),
                  Text(
                    '${album.publishedAt}',
                    style: subtitle,
                  ),
                ],
              ),
            ),
            onTap: (){
              Get.to(DetailPage(album: album));
            },
          );
        }
    );
  }
}
