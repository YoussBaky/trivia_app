import 'package:flutter/material.dart';
import 'package:trivia_app/API/requests.dart';
import 'package:trivia_app/Models/categoryModel.dart';

import 'Components/categoryItem.dart';

class BuildCategory extends StatefulWidget {
  const BuildCategory({Key key, String name, int id}) : super(key: key);

  @override
  _BuildCategoryState createState() => _BuildCategoryState();
}

class _BuildCategoryState extends State<BuildCategory> {
  Future<List<CategoryClass>> futureCategory;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureCategory = fetchCategorys();
  }

  final someOtherSliver = SliverToBoxAdapter();
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 280),
        child: FutureBuilder<List<CategoryClass>>(
          future: futureCategory,
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? CategoryList(category: snapshot.data)
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
