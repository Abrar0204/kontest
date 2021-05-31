class Kontest {
  String title;
  String description;
  DateTime startTime;
  DateTime endTime;
  int participationCost;
  List<String> rewards;
  List<String> participants;
  String imageUrl;

  Kontest(
      {this.title,
      this.description,
      this.startTime,
      this.endTime,
      this.participants,
      this.participationCost,
      this.rewards,
      this.imageUrl});
}
