class CartLDBModel
{
  String _itemId;
  String _idProduct;
   int _quantity;
  double _price;
  double _oldprice;
  double _total;
  String _title;
  String _description;
  String _img;
  String _note;
    int _isSelected;// 0 selected background to delete, 1 normal background
  CartLDBModel(dynamic obj){
    _itemId=obj['itemId'];
    _idProduct=obj['idProduct'];
     _quantity=obj['quantity'];
    _price=obj['price'];
    _oldprice=obj['oldprice'];
    _total=obj['total'];
    _title=obj['title'];
    _description=obj['description'];
    _img=obj['img'];
    _note=obj['note'];//
    _isSelected=obj['isSelected'];
  }
  CartLDBModel.fromMap(Map<String,dynamic>data)
  {
    _itemId=data['itemId'];
    _idProduct=data['idProduct'];
     _quantity=data['quantity'];
    _price=data['price'];
    _oldprice=data['oldprice'];
    _total=data['total'];
    _title=data['title'];
    _description=data['description'];
    _img=data['img'];
    _note=data['note'];
    _isSelected=data['isSelected'];
  }
  Map<String,dynamic>toMap()=>
      {
        'itemId':_itemId,
        'idProduct':_idProduct,
         'quantity':_quantity,
        'price':_price,
        'oldprice':_oldprice,
        'total':_total,
        'title':_title,
        'description':_description,
        'img':_img,
        'note':_note,
        'isSelected':_isSelected
      };
  //IdProduct
  String get itemId=>_itemId;
  String get idProduct=>_idProduct;

  int get quantity=>_quantity;
  double get price=>_price;
  double get oldPrice=>_oldprice;
  double get total=>_total;
  String get title=>_title;
  String get description=>_description;
  String get img=>_img;
  String get note=>_note;
  int get isSelected=>_isSelected;
}