import 'package:carousel_pro/carousel_pro.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HuruApp'),
        backgroundColor: Color(0xFF417690),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Stack(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 1.0,
                    child: Carousel(
                      autoplay: false,
                      animationCurve: Curves.fastOutSlowIn,
                      dotSize: 4.0,
                      dotIncreasedColor: Color(0xFFFF335C),
                      dotBgColor: Colors.transparent,
                      dotPosition: DotPosition.bottomCenter,
                      dotColor: Colors.white,
                      dotVerticalPadding: 0.0,
                      showIndicator: false,
                      indicatorBgPadding: 8.0,
                      onImageChange: (int, activeImage) {
                        // setState(() {
                        //   _activePhoto = activeImage + 1;
                        // });
                      },
                      images: [
                        ExtendedImage.network(
                          'https://helpx.adobe.com/content/dam/help/en/stock/how-to/visual-reverse-image-search/jcr_content/main-pars/image/visual-reverse-image-search-v2_intro.jpg',
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
                      ],
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
                          color: Colors.black.withOpacity(0.5),
                        ),
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'category',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0),
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
                      'article title in here',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    FlatButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      child: Text(
                        'Read more...',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'By: Admin',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        itemCount: 10,
      ),
    );
  }
}
