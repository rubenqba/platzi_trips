
class ReviewModel {
  final String avatar;
  final String name;
  final int stars;
  final int reviews;
  final String comment;
  final List<String> photos;

  ReviewModel(this.avatar, this.name, this.reviews, this.stars, this.comment, this.photos);
}

class ModelUtils {

  static List<String> landscapes() {
    return [
      "assets/img/paisaje1.jpg",
      "assets/img/paisaje2.jpg",
      "assets/img/paisaje3.jpg",
      "assets/img/paisaje4.jpg",
      "assets/img/paisaje5.jpg",
    ];
  }

  static List<ReviewModel> reviews() {
    return [
      ReviewModel("assets/img/avatar.png", "Varuna Yasas", 1, 4, "There is an amazing place in Sri lanka", []),
      ReviewModel("assets/img/avatar2.png", "Digital Traveler", 6, 5, "Great place, I'll come back soon", []),
      ReviewModel("assets/img/avatar3.png", "World Criticizer", 56, 2, "The food is awful and my entire bed was full of bugs. I don't recommend this place", []),
      ReviewModel("assets/img/avatar.png", "Varuna Yasas", 1, 4, "There is an amazing place in Sri lanka", []),
      ReviewModel("assets/img/avatar2.png", "Digital Traveler", 6, 5, "Great place, I'll come back soon", []),
      ReviewModel("assets/img/avatar3.png", "World Criticizer", 56, 2, "The food is awful and my entire bed was full of bugs. I don't recommend this place", []),
      ReviewModel("assets/img/avatar.png", "Varuna Yasas", 1, 4, "There is an amazing place in Sri lanka", []),
      ReviewModel("assets/img/avatar2.png", "Digital Traveler", 6, 5, "Great place, I'll come back soon", []),
      ReviewModel("assets/img/avatar3.png", "World Criticizer", 56, 2, "The food is awful and my entire bed was full of bugs. I don't recommend this place", []),
    ];
  }

  static String locationDescription() {
    return "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet sem at ex sollicitudin finibus sit amet vitae orci. Fusce in enim tortor. Aliquam tempor ultricies erat non convallis. Praesent mattis facilisis nulla, eget vulputate sapien tempus quis. Sed a metus quis odio rhoncus imperdiet et sit amet augue. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec nec posuere nisl, ut posuere mauris. Phasellus ultrices, velit ut vehicula vehicula, velit nibh accumsan diam, eget aliquet ipsum quam vitae mauris. Sed tempus nulla eget lorem feugiat ultricies.";
  }
}