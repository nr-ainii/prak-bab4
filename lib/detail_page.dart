import 'package:bab4/const.dart';
import 'package:flutter/material.dart';

import 'fetch_data.dart';

class DetailPage extends StatefulWidget {
  Album album;

  DetailPage({required this.album});

  @override
  State<DetailPage> createState() => _DetailPageState(album: album);
}

class _DetailPageState extends State<DetailPage> {
  Album album;

  _DetailPageState({
    required this.album
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Page'
        ),
      ),
      body: ListView(
        children: [
          Text(
            '${album.title}',
            style: title,
            textAlign: TextAlign.justify,
          ),
          Text(
            'author: ${album.author}',
            style: subtitle,
            textAlign: TextAlign.justify,
          ),
          Image.network(
              album.urlToImage,
            width: double.infinity,
          ),
          Text(
            'Published At: ${album.publishedAt}',
            style: body,
          ),
          Text(
            '${album.description}',
            style: body,
          )
        ],
      ),
    );
  }
}
