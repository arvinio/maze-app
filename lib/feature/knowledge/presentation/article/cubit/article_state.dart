part of 'article_cubit.dart';

sealed class ArticleState extends Equatable {
  const ArticleState();

  @override
  List<Object> get props => [];
}

final class ArticleInitial extends ArticleState {}

final class LoadingArticle extends ArticleState {}

final class ArticleLoaded extends ArticleState {
  final Article article;

  const ArticleLoaded({required this.article});
}

final class LoadingFailed extends ArticleState {
  final ApiError error;

  const LoadingFailed({required this.error});
}
