import 'package:elmasreenapp/core/providermodels/AddressProvider.dart';
import 'package:elmasreenapp/ui/LoadingUi.dart';
import 'package:elmasreenapp/ui/widgets/AddAddressUi.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Values.dart';
import '../AddressDetailsUi.dart';
import 'NoDataFoundLayout.dart';
 class MainPartAddressLayout extends StatefulWidget {
  @override
  _MainPartAddressLayoutState createState() => _MainPartAddressLayoutState();
}

class _MainPartAddressLayoutState extends State<MainPartAddressLayout> {
  AddressProvider addressProvider;

  init()async
  {
    await Future.delayed(Duration(milliseconds: 100));
    addressProvider=Provider.of<AddressProvider>(context,listen:false);
    addressProvider.getUserAddress();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }
  @override
  Widget build(BuildContext context) {
    return dataUi(context);
  }

  Widget dataUi(BuildContext context)
  {


    return Consumer<AddressProvider>(builder: (context,addressProvider,widgetUi){
      return Column(
        children: [
          AddAddressUi(),
          SizedBox(height:MediaQuery.of(context).size.width*0.05),
          Expanded(
            child:Consumer<AddressProvider>(builder: (context,addressProvider,widget){
              return  addressProvider.userAddressState?addressProvider.itemsAddressesUser.length>0?
              ListView.builder(shrinkWrap: true,
                  itemCount: addressProvider.itemsAddressesUser.length,itemBuilder: (context,index){
                return GestureDetector(onTap: (){
                  showBottomSheetAddressFunction(context,
                      (){
                        Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddressDetailsUi(addressesUser:
                        addressProvider.itemsAddressesUser[index] ,)),
                      );
                     },
                      (){
                        addressProvider.deleteAddress(context, addressProvider.itemsAddressesUser[index]);
                      });

                },
                  child: Container(margin: EdgeInsets.only(top: 10.0,bottom: 10.0), child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,children: [
                        Expanded(child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,children: [
                          Text('${addressProvider.itemsAddressesUser[index].addressTitle!=null?
                          addressProvider.itemsAddressesUser[index].addressTitle:'' } '),
                          SizedBox(height:5.0,),
                          Text('${addressProvider.itemsAddressesUser[index].address} ',
                          style: Theme.of(context).textTheme.headline2,),
                          SizedBox(height:5.0,),
                          Text(addressProvider.itemsAddressesUser[index].landMark,
                            style: Theme.of(context).textTheme.headline2,),
                          SizedBox(height:5.0,),
                          Text(DemoLocalizations.of(context).title['phone']+' '+'${ addressProvider.itemsAddressesUser[index].phone1}',
                            style: Theme.of(context).textTheme.headline2,),

                        ],))
                        ,SizedBox(width: 50.0,),
                        GestureDetector(onTap: (){
                          addressProvider.makeAddressPrimary( context,
                              addressProvider.itemsAddressesUser[index]);
                        },
                            child:addressProvider.itemsAddressesUser[index].isPrimary.toString()
                                == '1'?
                            ImageIcon(AssetImage('assets/icons/select.png'),
                              size: 25.0,color:Theme.of(context).primaryColor ,)
                                :Container(width: 25.0,height: 25.0,decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25.0),border: Border.all(width: 1.0,
                                color: Colors.grey)),)),


                      ],),
                      Divider(thickness: 1.0,color: Colors.grey.withOpacity(0.5),)
                    ],
                  ),),
                );
              }):noData(context):LoadingUi();
            },),
          ),
        ],
      );
    });
  }

  Widget noData(BuildContext context)
  {
    return NoDataFoundLayout(spaceOrNot: true,imagePath:'assets/images/noaddress.png' ,
        title: DemoLocalizations.of(context).title['noaddress'],
        widget:SizedBox());
  }
}
