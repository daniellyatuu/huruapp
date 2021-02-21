import 'package:extended_image/extended_image.dart';
import 'package:huruapp/src/bloc/bloc_files.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: BlocBuilder<InformationBloc, InformationStates>(
        builder: (context, state) {
          if (state is InfoLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is InfoError) {
            return Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline_rounded,
                      color: Colors.grey[700],
                      size: 40,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Failed to fetch information.Tap to try again',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
            );
          } else if (state is InfoSuccess) {
            var data = state.articles;

            if (data.isEmpty) {
              return Center(
                child: Text(
                  'No Posts',
                  style: Theme.of(context).textTheme.headline6,
                ),
              );
            }

            return ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              physics: BouncingScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Stack(
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: 1.0,
                          child: ExtendedImage.network(
                            '${data[index].coverPhoto}',
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
                                color: Colors.black.withOpacity(0.5),
                              ),
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                '${data[index].category}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
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
                            '${data[index].enTitle}',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          FlatButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            child: Text(
                              'Read more...',
                              style: TextStyle(
                                color: Colors.teal,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'By: ${data[index].username}',
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
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
