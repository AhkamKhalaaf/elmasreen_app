import 'package:elmasreenapp/core/models/SubCategoriesModel.dart';
import 'package:elmasreenapp/core/providermodels/CategoryProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'LoadingUi.dart';
import 'layout/CommonAppBarUi.dart';
import 'layout/NoProductFoundUI.dart';
import 'widgets/OneItemSubCategoryUI.dart';

class SubCategoryUi extends StatefulWidget {
  final int categoryId;
  final String title;

  const SubCategoryUi({Key key, this.categoryId, this.title}) : super(key: key);

  @override
  _SubCategoeryUiState createState() => _SubCategoeryUiState();
}

class _SubCategoeryUiState extends State<SubCategoryUi> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        child: commonAppBarUi(widget.title, context),
        preferredSize: Size.fromHeight(50.0),
      ),
      body: Consumer<CategoryProvider>(
          builder: (context, categoryModel, widgetUi) {
        return Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder(
              future: categoryModel.getSubCategory(widget.categoryId),
              builder: (contxt, snapShot) {
                if (snapShot.hasData) {
                  List<SubCategory> items = snapShot.data;
                  if (items.length > 0) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12.0,
                          crossAxisSpacing: 12.0,
                          childAspectRatio: 3 / 3.75),
                      itemBuilder: (context, index) {
                        return OneItemSubCategoryUI(
                          subCategory: items[index],
                        );
                      },
                      itemCount: items.length,
                    );
                  } else {
                    return NoProductFoundUI();
                  }
                }
                return LoadingUi();
              },
            ));
      }),
    ));
  }
}
