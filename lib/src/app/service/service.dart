import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Service extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF417690),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            size: 25.0,
          ),
        ),
        title: Container(
          padding: EdgeInsets.only(left: 10.0),
          decoration: BoxDecoration(
            color: Color.fromARGB(50, 255, 255, 255),
            borderRadius: BorderRadius.all(
              Radius.circular(4.0),
            ),
          ),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: AbsorbPointer(
                    absorbing: true,
                    child: TextField(
                      autofocus: false,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Coming soon',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      // body: SingleChildScrollView(
      //   scrollDirection: Axis.horizontal,
      //   child: DataTable(
      //     columns: [
      //       DataColumn(
      //         label: Text('Data 1'),
      //         numeric: false,
      //         onSort: (i, b) {},
      //         tooltip: 'tooltip in here',
      //       ),
      //       DataColumn(
      //         label: Text('Data 2'),
      //         numeric: false,
      //         onSort: (i, b) {},
      //         tooltip: 'tooltip in here',
      //       ),
      //     ],
      //     rows: [
      //       DataRow(
      //         cells: [
      //           DataCell(
      //             Text(
      //                 'sdsddsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsd sdsd sdsdsds dsd'),
      //           ),
      //           DataCell(
      //             Text('sdsd'),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
