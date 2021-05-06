
import 'package:flutter/material.dart';

class CategoryItemViewModel {

  final int categoryID;
  final String imageURL;
  final String title;
  
  CategoryItemViewModel({this.categoryID, this.imageURL, this.title});
}

class CategoryItemView extends StatelessWidget {

  final CategoryItemViewModel viewModel;

  CategoryItemView({this.viewModel});

  @override 
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _thumnailImage(context),
          SizedBox(width: 8.0),
          Text(
            this.viewModel.title,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[900],
            ),
          ),
        ],
      ),
    );
  }

  Widget _thumnailImage(BuildContext context) {
    return Container(
      width: 36.0,
      height: 36.0,
      decoration: BoxDecoration(
          image: _networkImage(),
          color: Colors.grey[400],
          borderRadius: BorderRadius.all(Radius.circular(18.0))),
    );
  }
  
  DecorationImage _networkImage() {

    if (this.viewModel.imageURL == null) {
      return null;
    }

    return DecorationImage(image: NetworkImage(this.viewModel.imageURL ?? ""));
  }
}