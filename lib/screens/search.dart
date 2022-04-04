import 'package:flutter/material.dart';

class MysearchDelegate extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    IconButton(onPressed: (){}, icon: Icon(Icons.clear));
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SizedBox();
    // TODO: implement buildSuggestions
//     List<String>suggestions =[
// 'malayalam',
// 'hindi'
//     ];
  }
  
}