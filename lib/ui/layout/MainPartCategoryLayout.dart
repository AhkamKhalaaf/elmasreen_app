 import 'package:dotted_border/dotted_border.dart';
import 'package:elmasreenapp/core/models/CategoriesModel.dart';
import 'package:elmasreenapp/core/providermodels/CategoryProvider.dart';
import 'package:elmasreenapp/ui/LoadingUi.dart';
import 'package:elmasreenapp/ui/layout/NoDataFoundLayout.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
 import 'package:elmasreenapp/ui/widgets/OneItemCategoryUI.dart';
import 'package:provider/provider.dart';

import '../HomePageUI.dart';
import 'NoProductFoundUI.dart';

class MainPartCategoryLayout extends StatefulWidget {
  @override
  _MainPartCategoryLayoutState createState() => _MainPartCategoryLayoutState();
}

class _MainPartCategoryLayoutState extends State<MainPartCategoryLayout> {

  @override
  Widget build(BuildContext context) {
    return    Consumer<CategoryProvider>(builder: (context,categoryModel,widget){
      return
      Container(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05,
      right: MediaQuery.of(context).size.width * 0.05,
      top: MediaQuery.of(context).size.width * 0.05),width: MediaQuery.of(context).size.width
          ,child: FutureBuilder(future: categoryModel.getMainCategory(),builder: (context,snapShot){
            if(snapShot.hasData)
              {
                List<MainCategory>items=snapShot.data;
                if(items.length>0)
                  {
                    return  GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12.0,
                          crossAxisSpacing: 12.0,
                          childAspectRatio: 3/3.525
                      ),
                      itemBuilder: (context,index){
                        return  OneItemCategoryUI(category:items[index] ,);
                      },
                      itemCount:items.length,

                    );
                  }
                else{
                  return NoProductFoundUI();
                }
              }
            return LoadingUi();


          },)

      )

      ;
    });
  }
}
