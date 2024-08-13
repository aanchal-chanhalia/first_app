class FoodModel{
  int? id;
  String? FoodName;
  double? FoodPrice;


  FoodModel({
    this.id,
    this.FoodName,
    this.FoodPrice,
    
  });
  Map<String,dynamic>toMap(){
    return{
      "id":id,
      "FoodName":FoodName,
      "FoodPrice":FoodPrice,
    };
  }factory FoodModel.fromJson(Map<String,dynamic>json){
    return FoodModel(
      id:json["id"],
      FoodName:json["FoodName"],
      FoodPrice:json["FoodPrice"],
    );
  }
}