import 'dart:math';

import 'package:flutter/material.dart';

class CategoryItemViewModel {
  final int categoryID;
  final String imageURL;
  final String title;

  CategoryItemViewModel({this.categoryID, this.imageURL, this.title});
}

class CategoryItemView extends StatelessWidget {

  List _placeholderColors = [Colors.red[400], Colors.orange[600], Colors.green[600]];
  Random _random = new Random();
  
  final CategoryItemViewModel viewModel;

  CategoryItemView({this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 12.0, left: 16.0, bottom: 12.0, right: 16.0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _thumnailImage(context),
          SizedBox(width: 16.0),
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
    if (this.viewModel.imageURL == null) {
      return Container(
        width: 36.0,
        height: 36.0,
        child: Center(
          child: Text(
            viewModel.title.characters.first.toUpperCase(),
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        decoration: BoxDecoration(
            color: _placeholderColors[_random.nextInt(_placeholderColors.length)],
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
      );
    }

    return Container(
      width: 36.0,
      height: 36.0,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(this.viewModel.imageURL ?? "")),
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(18.0))),
    );
  }
}
