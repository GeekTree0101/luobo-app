import 'package:flutter/material.dart';

class FeedArticleViewModel {
  final String title;
  final String description;
  final int price;

  String get displayPrice {
    return price.toString() + "원";
  }

  FeedArticleViewModel({this.title, this.description, this.price});
}

class FeedArticleView extends StatelessWidget {

  FeedArticleViewModel viewModel;

  FeedArticleView({this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _content(context),
          _bottomLine(context),
        ],
      ),
    );
  }

  Widget _content(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _thumnailImage(context),
          SizedBox(width: 16.0),
          _articleInfo(context),
        ],
      ),
    );
  }

  Widget _bottomLine(BuildContext context) {
    return SizedBox(
      height: 0.5,
      child: Container(
        color: Colors.grey[300],
      )
    );
  }

  Widget _articleInfo(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          viewModel.title,
          style: TextStyle(
            color: Colors.grey[900],
            fontSize: 18.0,
          ),
        ),
        SizedBox(
          height: 4.0,
        ),
        Text(
          viewModel.description,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 14.0,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          viewModel.displayPrice,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[900],
            fontSize: 18.0,
          ),
        )
      ],
    );
  }

  Widget _thumnailImage(BuildContext context) {
    return Container(
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
    );
  }
}
