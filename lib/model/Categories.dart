class Categories {
  Categories({
     required this.idCategory,
     required this.strCategory,
     required this.strCategoryThumb,
     required this.strCategoryDescription,});

 factory Categories.fromJson(dynamic json) {
   return Categories(
       idCategory : json['idCategory'],
       strCategory : json['strCategory'],
       strCategoryThumb : json['strCategoryThumb'],
       strCategoryDescription : json['strCategoryDescription'],
       );
  }
  String idCategory;
  String strCategory;
  String strCategoryThumb;
  String strCategoryDescription;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['idCategory'] = idCategory;
    map['strCategory'] = strCategory;
    map['strCategoryThumb'] = strCategoryThumb;
    map['strCategoryDescription'] = strCategoryDescription;
    return map;
  }

}