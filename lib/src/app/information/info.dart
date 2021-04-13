import 'package:extended_image/extended_image.dart';
import 'package:huruapp/src/app/information/info_file.dart';
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
                return Card(
                  child: ListTile(
                    onTap: () {
                      print(data[index]);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SingleInfo(
                            article: data[index],
                          ),
                        ),
                      );
                    },
                    leading: AspectRatio(
                      aspectRatio: 1.5,
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
                    title: Text('${data[index].enTitle}'),
                    subtitle: Text('By: ${data[index].username}'),
                    trailing: Icon(Icons.arrow_right),
                  ),
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
