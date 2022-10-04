import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:bridy_go_user/presentation/screens/product/picture_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class Album extends StatefulWidget {
  List<String> images;
  Album(this.images);

  @override
  _AlbumState createState() => _AlbumState();
}

class _AlbumState extends State<Album> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: StaggeredGridView.countBuilder(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            crossAxisCount: 4,
            staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
            itemCount: widget.images.length,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            itemBuilder: (context, index) {
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PictureView(index, widget.images)));
                    },
                    child: FadedScaleAnimation(
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(
                          widget.images[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          pressed = !pressed;
        });
      },
      child: Icon(
        pressed ? Icons.favorite : Icons.favorite_outline,
        color: pressed ? Colors.red : Colors.white,
        size: 12,
      ),
    );
  }
}
