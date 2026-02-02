enum GameStatus {
  none("None"),
  owned("Owned"),
  playing("In Progress"),
  completed("Completed");

  const GameStatus(this.value);

  final String value;
}