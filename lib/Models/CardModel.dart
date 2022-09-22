class CardModel {
  bool isFavorite;
  // Color backgroundColor;

  CardModel({required this.isFavorite});

  liked() {
    isFavorite = !isFavorite;
  }
}
