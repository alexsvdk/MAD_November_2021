class TestPageModel {
  final int total;
  final int current;

  final String? question;
  final List<String>? answers;

  final int? correct;

  TestPageModel(this.total, this.current,
      {this.question, this.answers, this.correct});
}
