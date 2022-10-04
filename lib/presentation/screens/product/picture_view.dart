import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../constants/my_colors.dart';


class PictureView extends StatefulWidget {
  int index;
  List<String> imgs;
  PictureView(this.index, this.imgs);

  @override
  _PictureViewState createState() => _PictureViewState();
}

class _PictureViewState extends State<PictureView> {
  String? selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryAccent,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryAccent,

      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Center(
              child: ListView(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  FadedScaleAnimation(
                    Image.network(
                      widget.imgs[widget.index],
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Stack(
            children: [
              SingleChildScrollView(
                child: FadedSlideAnimation(
                  Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.7,
                    ),
                    // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 140, vertical: 5),
                          child: Divider(
                            thickness: 5,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: Text(
                                'similarPhotos',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 12, color: Colors.grey),
                              ),
                            ),
                            StaggeredGridView.countBuilder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                crossAxisCount: 4,
                                staggeredTileBuilder: (index) =>
                                    const StaggeredTile.fit(2),
                                itemCount: widget.imgs.length,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        widget.index=index;

                                      });
                                    },
                                    child: Container(
                                      // color: Colors.red,
                                      width: MediaQuery.of(context).size.width,
                                      child: Image.network(
                                        widget.imgs[index],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                  beginOffset: const Offset(0, 0.4),
                  endOffset: const Offset(0, 0),
                  slideCurve: Curves.linearToEaseOut,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> {
  bool pressed = true;

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
        color: Colors.red,
        size: 12,
      ),
    );
  }
}
