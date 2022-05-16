import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({Key? key, required this.title, required this.description, required this.imageUrl, required this.callback}) : super(key: key);

  final String title;
  final String description;
  final String imageUrl;
  final Function() callback;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
        subtitle: Text(description, style: const TextStyle(color: Color.fromARGB(255, 201, 191, 191), fontWeight: FontWeight.w400)),
        tileColor: const Color(0xff212226),
        leading: CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) =>
              const CircularProgressIndicator(
            color: Color(0xff8B0000),
          ),
          errorWidget: (context, url, error) =>
            Image.asset('assets/images/image_error.webp'),
          fadeOutDuration: const Duration(milliseconds: 5),
          imageBuilder: (context, imageProvider) => Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: imageProvider, fit: BoxFit.cover)),
          ),
        ),
        trailing: const Icon(Icons.arrow_right, color: Colors.white,),
        onTap: () => callback(),
      )
    );
  }
}