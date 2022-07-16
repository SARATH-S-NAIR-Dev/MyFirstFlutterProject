class MealsListData {
  MealsListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
    this.meals,
    this.kacl = 0,
  });

  String imagePath;
  String titleTxt;
  String startColor;
  String endColor;
  List<String>? meals;
  int kacl;

  static List<MealsListData> tabIconsList = <MealsListData>[
    MealsListData(
      imagePath: 'assets/todo.png',
      titleTxt: 'Sem Results',
      meals: <String>['View Sem', 'Results'],
      startColor: '#FA7D82',
      endColor: '#FFB295',
    ),
    MealsListData(
      imagePath: 'assets/calendar.png',
      titleTxt: 'Calendar',
      meals: <String>['View ', 'Calendar'],
      startColor: '#738AE6',
      endColor: '#5C5EDD',
    ),
    MealsListData(
      imagePath: 'assets/map.png',
      titleTxt: 'Ask & Learn',
      meals: <String>['Ask Your Questions'],
      startColor: '#FE95B6',
      endColor: '#FF5287',
    ),
    MealsListData(
      imagePath: 'assets/time.png',
      titleTxt: 'Timetable',
      meals: <String>['View Timetable'],
      startColor: '#6F72CA',
      endColor: '#1E1466',
    ),

  ];
}
