import 'package:flutter/material.dart';
import 'package:trivia_app/Components/OptionsDialog.dart';
import 'package:trivia_app/Models/categoryModel.dart';

class CategoryList extends StatelessWidget {
  final List<CategoryClass> category;

  CategoryList({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: category.length,
        itemBuilder: _buildCategoryItem,
      ),
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
              title: Text(category[index].name,
                  style: TextStyle(color: Colors.white)),
              //subtitle: Text('', style: TextStyle(color: Colors.white)),
            ),
            FlatButton(
              hoverColor: Colors.green,
              child: Text(
                'Play',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                _categoryPressed(context, category[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  _categoryPressed(BuildContext context, CategoryClass category) {
    showModalBottomSheet(
      context: context,
      builder: (sheetContext) => BottomSheet(
        builder: (_) => OptionsDialog(
          category: category,
        ),
        onClosing: () {},
      ),
    );
  }
}
