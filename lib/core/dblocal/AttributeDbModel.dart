//AttributDbModel
class AttributeLDBModel
{
  String _productId;//contain main product ID  to filter atrributes
  String _attributeId; //primary ID
  String _id;
  String _value;
  double _price;
  String _title;

  AttributeLDBModel(dynamic obj){
    _productId=obj['productId'];
    _attributeId=obj['attributeId'];
    _id=obj['id'];
    _value=obj['value'];
    _price=obj['price'];
    _title=obj['title'];

  }
  AttributeLDBModel.fromMap(Map<String,dynamic>data)
  {
    _productId=data['productId'];
    _attributeId=data['attributeId'];
    _id=data['id'];
    _value=data['value'];
    _price=data['price'];
    _title=data['title'];
  }
  Map<String,dynamic>toMap()=>
      {
        'productId':_productId,
        'attributeId':_attributeId,
        'id':_id,
        'value':_value,
        'price':_price,
        'title':_title,

      };
  String get productId=>_productId;
  String get attributeId=>_attributeId;
  String get id=>_id;
  String get value=>_value;
  double get price=>_price;
  String get title=>_title;

}