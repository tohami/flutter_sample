class NewsItem {
  String newsTitle;
  String nid;
  String postDate;
  String imageUrl;
  String newsType;
  String numOfViews;
  String likes;

  NewsItem(
      {this.newsTitle,
        this.nid,
        this.postDate,
        this.imageUrl,
        this.newsType,
        this.numOfViews,
        this.likes});

  NewsItem.fromJson(Map<String, dynamic> json) {
    newsTitle = json['NewsTitle'];
    nid = json['Nid'];
    postDate = json['PostDate'];
    imageUrl = json['ImageUrl'];
    newsType = json['NewsType'];
    numOfViews = json['NumofViews'];
    likes = json['Likes'];
  }
}