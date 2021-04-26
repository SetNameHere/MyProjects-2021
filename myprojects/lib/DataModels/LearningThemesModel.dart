class LearningThemesModel {
  final String imageB64;
  final String longDescription;
  final String shortDescription;
  final List<dynamic> tags;
  final String theme;
  final String backendId;

  LearningThemesModel(this.imageB64, this.longDescription,
      this.shortDescription, this.tags, this.theme, this.backendId);
}
