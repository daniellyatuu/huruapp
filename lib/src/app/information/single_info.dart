import 'package:extended_image/extended_image.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:huruapp/src/model/model_files.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleInfo extends StatefulWidget {
  final Article article;

  SingleInfo({@required this.article});
  @override
  _SingleInfoState createState() => _SingleInfoState();
}

class _SingleInfoState extends State<SingleInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article'),
        backgroundColor: Color(0xFF417690),
      ),
      body: ListView(
        children: [
          if (this.widget.article.displayCoverPhotoOnViewArticle)
            Stack(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1.0,
                  child: ExtendedImage.network(
                    '${this.widget.article.coverPhoto}',
                    cache: true,
                    loadStateChanged: (ExtendedImageState state) {
                      switch (state.extendedImageLoadState) {
                        case LoadState.loading:
                          return CupertinoActivityIndicator();
                          break;

                        ///if you don't want override completed widget
                        ///please return null or state.completedWidget
                        //return null;
                        //return state.completedWidget;
                        case LoadState.completed:
                          return ExtendedRawImage(
                            fit: BoxFit.cover,
                            image: state.extendedImageInfo?.image,
                          );
                          break;
                        case LoadState.failed:
                          // _controller.reset();
                          return GestureDetector(
                            child: Center(
                              child: Icon(Icons.refresh),
                            ),
                            onTap: () {
                              state.reLoadImage();
                            },
                          );
                          break;
                      }
                      return null;
                    },
                  ),
                ),
                Positioned(
                  top: 5.0,
                  right: 6.0,
                  child: GestureDetector(
                    onTap: () {
                      print('show category data');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.black.withOpacity(0.7),
                      ),
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        '${this.widget.article.category}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${this.widget.article.enTitle}',
                  style: Theme.of(context).textTheme.headline5,
                ),
                Html(data: '${this.widget.article.enContent}'),
                Row(
                  mainAxisAlignment:
                      this.widget.article.displayCoverPhotoOnViewArticle
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.spaceBetween,
                  children: [
                    if (this.widget.article.displayCoverPhotoOnViewArticle ==
                        false)
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.black.withOpacity(0.7),
                        ),
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          '${this.widget.article.category}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    Text(
                      'By: ${this.widget.article.username}',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
