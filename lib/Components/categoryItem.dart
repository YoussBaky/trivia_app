import 'package:flutter/material.dart';
import 'package:trivia_app/API/requests.dart';
import 'package:trivia_app/Models/category.dart';

class BuildCategoryItem extends StatefulWidget {
  const BuildCategoryItem({Key key, String name, int id}) : super(key: key);

  @override
  _BuildCategoryItemState createState() => _BuildCategoryItemState();
}

class _BuildCategoryItemState extends State<BuildCategoryItem> {
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

class CategoryList extends StatelessWidget {
  final List<CategoryClass> category;

  CategoryList({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: category.length,
      itemBuilder: _buildCategoryItem,
    );
  }

  Widget _buildCategoryItem(BuildContext context, int index) {
    return Container(
      alignment: Alignment.bottomRight,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.pink,
        elevation: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ListTile(
              trailing: Icon(Icons.album, size: 20),
              title: Text(
                  category[index].name.replaceAll('Entertainment: ', ''),
                  style: TextStyle(color: Colors.white)),
              //subtitle: Text('', style: TextStyle(color: Colors.white)),
            ),
            FlatButton(
              hoverColor: Colors.green,
              child: Text(
                'Play',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
