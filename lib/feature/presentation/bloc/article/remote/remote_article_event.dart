abstract class RemoteArticlesEvent {
  const RemoteArticlesEvent();
}

class GetArticles extends RemoteArticlesEvent {
  const GetArticles();
}

class FindArticles extends RemoteArticlesEvent {
  final String _query;
  const FindArticles(this._query);
  String get query => _query;
}
