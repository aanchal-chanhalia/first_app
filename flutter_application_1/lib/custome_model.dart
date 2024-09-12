class CustomeModel{
  int? id;
  String? customerName;
  String? contacNumber;
  CustomeModel({
    this.id,
    this.customerName,
    this.contacNumber,
  });
  Map<String,dynamic>toMap(){
    return{
      "id":id,
      "customerName":customerName,
      "contacNumber":contacNumber,
    };
  }factory CustomeModel.fromJson(Map<String,dynamic>json){
    return CustomeModel(
      id:json["id"],
      customerName: json["customerName"],
      contacNumber: json["contacNumber"],
    );
  }
}