import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huruapp/src/bloc/bloc_files.dart';
import 'package:flutter_html/flutter_html.dart';

class Service extends StatefulWidget {
  @override
  _ServiceState createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0xFF417690),
      //   leading: IconButton(
      //     onPressed: () {},
      //     icon: Icon(
      //       Icons.search,
      //       size: 25.0,
      //     ),
      //   ),
      //   title: Container(
      //     padding: EdgeInsets.only(left: 10.0),
      //     decoration: BoxDecoration(
      //       color: Color.fromARGB(50, 255, 255, 255),
      //       borderRadius: BorderRadius.all(
      //         Radius.circular(4.0),
      //       ),
      //     ),
      //     child: GestureDetector(
      //       onTap: () {},
      //       child: Row(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Expanded(
      //             flex: 1,
      //             child: AbsorbPointer(
      //               absorbing: true,
      //               child: TextField(
      //                 autofocus: false,
      //                 style: TextStyle(color: Colors.white),
      //                 decoration: InputDecoration(
      //                   border: InputBorder.none,
      //                   hintText: 'Search',
      //                   hintStyle: TextStyle(
      //                       fontWeight: FontWeight.bold, color: Colors.white),
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      appBar: AppBar(
        title: Text('Services'),
        backgroundColor: Color(0xFF417690),
      ),
      body: BlocBuilder<ServiceBloc, ServiceStates>(
        builder: (context, state) {
          if (state is ServiceLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ServiceError) {
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
                      'Failed to fetch service.Tap to try again',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
            );
          } else if (state is ServiceSuccess) {
            var data = state.services;

            if (data.isEmpty) {
              return Center(
                child: Text(
                  'No Services',
                  style: Theme.of(context).textTheme.headline6,
                ),
              );
            }

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                dataRowHeight: 100.0,
                columns: [
                  DataColumn(
                    label: Text('Facility'),
                    numeric: false,
                    onSort: (i, b) {},
                    tooltip: 'Facility',
                  ),
                  DataColumn(
                    label: Text('Facility-Type'),
                    numeric: false,
                    onSort: (i, b) {},
                    tooltip: 'Facility-Type',
                  ),
                  DataColumn(
                    label: Text('Service'),
                    numeric: false,
                    onSort: (i, b) {},
                    tooltip: 'Service',
                  ),
                  DataColumn(
                    label: Text('Contact'),
                    numeric: false,
                    onSort: (i, b) {},
                    tooltip: 'Contact',
                  ),
                  DataColumn(
                    label: Text('Location'),
                    numeric: false,
                    onSort: (i, b) {},
                    tooltip: 'Location',
                  ),
                ],
                rows: [
                  for (var service in data)
                    DataRow(
                      cells: [
                        DataCell(
                          Text('${service.facility}'),
                        ),
                        DataCell(
                          Text('${service.facilityType}'),
                        ),
                        DataCell(
                          Html(
                            data: '${service.serviceOffered}',
                          ),
                        ),
                        DataCell(
                          Text('${service.contact}'),
                        ),
                        DataCell(
                          Text('${service.location}'),
                        ),
                      ],
                    ),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
