class SectionModel {
  late int id;
  late int day;
  late String link;

  SectionModel.fromList(int xid, int xday, String xlink) {
    id = xid;
    day = xday;
    link = xlink;
  }
}
