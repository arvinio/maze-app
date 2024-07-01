part of 'knowledge_cubit.dart';

sealed class KnowledgeState extends Equatable {
  const KnowledgeState();

  @override
  List<Object> get props => [];
}

final class KnowledgeInitial extends KnowledgeState {}

final class LoadingState extends KnowledgeState {}

final class LoadedState extends KnowledgeState {
  final List<Article> articles;

  const LoadedState({required this.articles});
}

final class ErrorState extends KnowledgeState {
  final ApiError error;

  const ErrorState({required this.error});
}
