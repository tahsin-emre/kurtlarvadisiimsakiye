class DayModel {
  late int day;
  late List<int> sections;
  DayModel.fromList(int xday, [List<int>? xsections]) {
    day = xday;
    sections = xsections ?? [];
  }
}
