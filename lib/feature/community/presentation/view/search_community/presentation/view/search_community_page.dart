import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/presentation/widget/clip_r_rect_transitions_builder.dart';
import 'package:maze_app/core/presentation/widget/custom_text_field.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/community/presentation/view/search_community/presentation/bloc/search_community_bloc.dart';
import 'package:maze_app/feature/community/presentation/view/search_community/presentation/widgets/search_app_bar.dart';
import 'package:maze_app/feature/community/presentation/view/search_community/presentation/widgets/search_result_multiple_tabs.dart';
import 'package:maze_app/feature/community/presentation/view/search_community/presentation/widgets/search_result_single_tab.dart';


@RoutePage()
class SearchCommunityPage extends StatefulWidget {
  const SearchCommunityPage({
    super.key,
    required this.buttonOffset,
    required this.buttonSize,
    required this.buttonRadius,
  });

  final Offset buttonOffset;

  final Size buttonSize;

  final Radius buttonRadius;

  @override
  State<SearchCommunityPage> createState() => _SearchCommunityPageState();
}

class _SearchCommunityPageState extends State<SearchCommunityPage> {
  late TextEditingController _searchController;
  late SearchCommunityBloc _searchCommunityBloc;

  Timer? _debounce;

  String _previousText = "";

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(_onSearchChanged);
    _searchCommunityBloc = inject<SearchCommunityBloc>();
  }

  void _onSearchChanged() {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      _debouncedSearch();
      _previousText = _searchController.text;
      _debounce = null;
    });
  }

  void _debouncedSearch() {
    if (_previousText != _searchController.text) {
      _searchCommunityBloc.add(SearchCommunityEvent.queryEvent(
          query: _searchController.text.trim()));
    }
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _searchCommunityBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return BlocConsumer<SearchCommunityBloc, SearchCommunityState>(
      bloc: _searchCommunityBloc,
      listener: (context, state) {
        if (state.searchStatus == SearchCommunityStatus.failure) {}
      },
      builder: (context, state) {
        return DefaultTabController(
          length: state.searchStatus == SearchCommunityStatus.success
              ? state.searchResults!.keys.length
              : 0,
          child: ClipRectTransitionsBuilderWidget(
            buttonOffset: widget.buttonOffset,
            buttonSize: widget.buttonSize,
            buttonRadius: widget.buttonRadius,
            builder: (context, child, animationValue) {
              // Background color animation with the formula to act like Interval(0.5, 1.0, curve: Curves.linear)
              final backgroundColor = Color.lerp(
                context.scheme().neutralsFieldsTags,
                Theme.of(context).scaffoldBackgroundColor,
                clampDouble((animationValue * 2) - 1.0, 0.0, 1.0),
              );
              final List<String> tabs =
                  state.searchStatus == SearchCommunityStatus.success
                      ? state.searchResults!.keys.toList()
                      : [];
              final hasTabs = tabs.length > 1;
              return BlocProvider.value(
                value: _searchCommunityBloc,
                child: BasePageWidget(
                  backgroundColor: backgroundColor,
                  appBarHeight: (hasTabs ? 117.0 : 69.0),
                  appBar: SearchAppBar(
                    tabs: tabs,
                    searchTextField: CustomTextField.slim(
                      textEditingController: _searchController,
                      autoFocus: true,
                      onSubmitted: (text) {
                        _debounce?.cancel();
                        _debounce = null;
                        _debouncedSearch();
                      },
                      borderRadius: 18.0,
                      label: appStrings.search,
                      labelTextColor: context.scheme().secondaryText,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 10),
                        child: appAssets.searchNormalIcon.svg(
                          /*width: 20,height: 20,*/
                          color: context.scheme().secondaryText,
                        ),
                      ),
                    ),
                  ),
                  bodyPadding: EdgeInsets.zero,
                  child: child!,
                ),
              );
            },
            child: Builder(
              builder: (context) {
                if (state.searchStatus == SearchCommunityStatus.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.searchStatus ==
                    SearchCommunityStatus.success) {
                  if (state.isEmpty) {
                    return Center(
                      child: Text(appStrings.noResultsFound),
                    );
                  } else if (state.searchResults!.keys.length == 1) {
                    return SearchResultSingleTab(
                      title: state.searchResults!.keys.first,
                      resultCommunities: state.searchResults!.values.first,
                    );
                  } else if (state.searchResults!.keys.length > 1) {
                    return SearchResultMultipleTabs(
                      searchResults: state.searchResults!,
                    );
                  }
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        );
      },
    );
  }
}
