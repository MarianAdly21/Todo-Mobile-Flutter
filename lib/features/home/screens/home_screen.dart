import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_mobile/features/home/bloc/home_screen_bloc.dart';
import 'package:todo_mobile/features/home/models/task_model.dart';
import 'package:todo_mobile/features/home/widgets/custom_bottom_navigation_bar.dart';
import 'package:todo_mobile/features/home/widgets/custom_icon.dart';
import 'package:todo_mobile/features/home/widgets/task_item_grid.dart';
import 'package:todo_mobile/features/home/widgets/task_item_list.dart';
import 'package:todo_mobile/features/search/screens/search_screen.dart';
import 'package:todo_mobile/generated/l10n.dart';
import 'package:todo_mobile/localization/bloc/localization_bloc.dart';
import 'package:todo_mobile/res/app_asset_paths.dart';
import 'package:todo_mobile/res/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenBloc(),
      child: const HomeScreenWithbloc(),
    );
  }
}

class HomeScreenWithbloc extends StatefulWidget {
  const HomeScreenWithbloc({super.key});

  @override
  State<HomeScreenWithbloc> createState() => _HomeScreenWithblocState();
}

class _HomeScreenWithblocState extends State<HomeScreenWithbloc> {
  bool isGrid = false;
  bool isDark = false;
  bool isEnglash = true;
  List<TaskModel> tasks = [];
  @override
  void initState() {
    _getAllTasksEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenBloc, HomeScreenState>(
      listener: (context, state) {
        if (state is ConvertUiState) {
          isGrid = state.isGrid;
        } else if (state is DeleteTaskSuccessfullyState) {
          _getAllTasksEvent();
        } else if (state is AddTaskSuccessfullyState) {
          Navigator.of(context).pop();
          _getAllTasksEvent();
        } else if (state is ConvertThemeState) {
          isDark = state.isDark;
        } else if (state is OpenSearchScreenState) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return SearchScreen(isDark: isDark);
              },
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: isDark ? Colors.black : Colors.white,
          bottomNavigationBar: CustomBottomNavigationBar(
            onSavePressed: (taskModel) {
              _addTaskEvent(taskModel);
            },
          ),
          appBar: _homeAppBarWidget(),
          body: _pageContent(),
        );
      },
    );
  }

///////////////////////////////////////////////////////////
//////////////////// Widget methods ///////////////////////
///////////////////////////////////////////////////////////

  Widget _pageContent() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 20, end: 39, top: 49, bottom: 27),
            child: Text(
             S.of(context).whats_on_your_mind,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : const Color(0xffF97D7D),
              ),
            ),
          ),
        ),
        BlocBuilder<HomeScreenBloc, HomeScreenState>(
          buildWhen: (previous, current) =>
              current is LoadedTasksSuccessState ||
              current is ConvertUiState ||
              current is ConvertThemeState,
          builder: (context, state) {
            if (state is LoadedTasksSuccessState) {
              tasks = state.tasks;
            }
            if (state is LoadedTasksSuccessState ||
                state is ConvertUiState ||
                state is ConvertThemeState) {
              return isGrid
                  ? TaskItemGrid(
                      tasks: tasks,
                      onDeleteTap: (index) => _deleteTaskEvent(index),
                      onDonePressed: (task, indexOfTask) {
                        _doneTaskEvent(indexOfTask, task);
                      },
                    )
                  : TaskItemList(
                      task: tasks,
                      onDeleteTap: (index) => _deleteTaskEvent(index),
                      onDonePressed: (task, indexOfTask) {
                        _doneTaskEvent(indexOfTask, task);
                      },
                    );
            } else {
              return const SliverToBoxAdapter(child: SizedBox());
            }
          },
        )
      ],
    );
  }

  AppBar _homeAppBarWidget() {
    return AppBar(
      backgroundColor: isDark ? Colors.black : Colors.white,
      leadingWidth: 90,
      leading: appBarLeadingWidget(),
      title: Text(
        S.of(context).my_tasks,
        style: TextStyle(
          color: isDark ? Colors.white : const Color(0xffFF0000),
          fontSize: 32,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 14, end: 27),
          child: CustomIcon(
            onTap: () {
              currentbloc.add(
                OpenSearchScreenEvent(isDark: isDark),
              );
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              //   return SearchScreen(isDark: isDark);
              // }));
            },
            assetName: AppAssetPaths.searchIcon,
            color: AppColors.colorSearchIcon,
          ),
        ),
        IconButton(
            onPressed: () {
              context.read<LocalizationBloc>().add(TapToChangeLanguageEvent());
              // isEnglash = !isEnglash;
              // setState(() {});
              // if (isEnglash) {
              //   BlocProvider.of<LanguageCubit>(context).changeLang("ar");
              // } else {
              //   BlocProvider.of<LanguageCubit>(context).changeLang("en");
              // }
            },
            icon: Icon(Icons.language))
      ],
    );
  }

  Widget appBarLeadingWidget() {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      buildWhen: (previous, current) => current is ConvertUiState,
      builder: (context, state) {
        return Padding(
            padding: const EdgeInsetsDirectional.only(start: 24, end: 35),
            child: CustomIcon(
              color: isDark ? Colors.white : AppColors.gridAndListIcon,
              onTap: _onLeadingIconTap,
              assetName:
                  isGrid ? AppAssetPaths.menuIcon : AppAssetPaths.gridViewIcon,
            ));
      },
    );
  }

///////////////////////////////////////////////////////////
//////////////////// Helper methods ///////////////////////
///////////////////////////////////////////////////////////

  void _onLeadingIconTap() {
    currentbloc.add(ConvertUIEvent());
  }

  void _getAllTasksEvent() {
    currentbloc.add(LoadedTasksEvent());
  }

  void _addTaskEvent(TaskModel task) {
    currentbloc.add(AddTaskEvent(task: task));
  }

  _deleteTaskEvent(int index) =>
      currentbloc.add(DeleteTaskEvent(task: tasks[index]));

  HomeScreenBloc get currentbloc => context.read<HomeScreenBloc>();

  void _doneTaskEvent(int indexOfTask, TaskModel task) {
    currentbloc.add(DoneTaskEvent(index: indexOfTask, task: task));
  }
}
