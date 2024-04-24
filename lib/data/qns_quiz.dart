class Question{
  const Question(this.que,this.ans);

  final String que;
  final List<String> ans;
  List<String> shuffledAns(){
    final shuffledList = List.of(ans);
    shuffledList.shuffle();
    return shuffledList;
  }
}