class OnboardModel {
  final String title;
  final String description;
  final String imageName;

  OnboardModel(
      {required this.title,
      required this.description,
      required this.imageName});
  String get imagePath => "assets/icons/ic_$imageName.jpg";
}

class OnBoardModels {
  static final List<OnboardModel> onboardItems = [
    OnboardModel(
        title: "Order Your Food",
        description: "Now you can order food any tim right from your mobile",
        imageName: "tour"),
    OnboardModel(
        title: "Order Your Food",
        description: "Now you can order food any tim right from your mobile",
        imageName: "greeting"),
    OnboardModel(
        title: "Order Your Food",
        description: "Now you can order food any tim right from your mobile",
        imageName: "communication"),
  ];
}
