class HomeMockBean {
  String name;

  String path;

  HomeMockBean(this.name, this.path);
}

class HomeMockUtils {
  static List<HomeMockBean> homeLists = [
    HomeMockBean('自定义 Sheet ', 'app://customBottomSheet'),
    HomeMockBean('Login Screen ', 'app://login'),
    HomeMockBean('Detail Screen ', 'app://detail'),
    HomeMockBean('StaggeredGridView Screen ', 'app://staggeredGridView'),
  ];
}
