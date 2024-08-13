class CustomeModel{
  int? id;
  String? custmername;
  String? contactnumber;
  CustomeModel({
    this.id,
    this.custmername,
    this.contactnumber,
  });
  Map<String,dynamic>toMap(){
    return{
      "id":id,
      "custmername":custmername,
      "contacnumber":contactnumber,
    };
  }factory CustomeModel.fromJson(Map<String,dynamic>json){
    return CustomeModel(
      id:json["id"],
      custmername: json["costmername"],
      contactnumber: json["contacnumber"],
    );
  }
}