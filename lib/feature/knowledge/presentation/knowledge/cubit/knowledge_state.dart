part of 'knowledge_cubit.dart';

sealed class KnowledgeState extends Equatable {
  const KnowledgeState();

  @override
  List<Object> get props => [];
}

final class KnowledgeInitial extends KnowledgeState {}

final class LoadingArticles extends KnowledgeState {}

final class ArticlesLoaded extends KnowledgeState {
  final List<Article> articles;
  final List<AppCategory> categories;

  const ArticlesLoaded({
    required this.articles,
    required this.categories,
  });
}

final class ErrorLoadingArticles extends KnowledgeState {
  final ApiError error;

  const ErrorLoadingArticles({required this.error});
}

final class SearchResultsLoaded extends KnowledgeState {
  final List<Article> articles;

  const SearchResultsLoaded({required this.articles});
}
