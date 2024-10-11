import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_mobile/features/home/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:todo_mobile/features/home/cubits/tasks_cubit/tasks_state.dart';
import 'package:todo_mobile/features/home/models/task_model.dart';
import 'package:todo_mobile/features/home/widgets/custom_bottom_navigation_bar.dart';
import 'package:todo_mobile/features/home/widgets/custom_icon.dart';
import 'package:todo_mobile/features/home/widgets/task_item_grid.dart';
import 'package:todo_mobile/features/home/widgets/task_item_list.dart';
import 'package:todo_mobile/features/language/configuration_lang.dart';
import 'package:todo_mobile/features/language/language_cubit/language_cubit.dart';
import 'package:todo_mobile/features/search/screens/search_screen.dart';
import 'package:todo_mobile/res/app_asset_paths.dart';
import 'package:todo_mobile/res/app_colors.dart';
import 'package:todo_mobile/utils/local/app_localization_keys.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksCubit(),
      child: const HomeScreenWithCubit(),
    );
  }
}

class HomeScreenWithCubit extends StatefulWidget {
  const HomeScreenWithCubit({super.key});

  @override
  State<HomeScreenWithCubit> createState() => _HomeScreenWithCubitState();
}

class _HomeScreenWithCubitState extends State<HomeScreenWithCubit> {
  bool isGrid = false;
  bool isDark = false;
  bool isEnglash = true;
  List<TaskModel> tasks = [];
  @override
  void initState() {
    _getAllTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TasksCubit, TasksState>(
      listener: (context, state) {
        if (state is ConvertUiState) {
          isGrid = state.isGrid;
        } else if (state is DeleteTaskSuccessfullyState) {
          _getAllTasks();
        } else if (state is AddTaskSuccessfullyState) {
          Navigator.of(context).pop();
          _getAllTasks();
        } else if (state is ConvertThemeState) {
          isDark = state.isDark;
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: isDark ? Colors.black : Colors.white,
          bottomNavigationBar: CustomBottomNavigationBar(
            // isDark: isDark,
            onSavePressed: (taskModel) {
              _addTask(taskModel);
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
              ConfagurationLanguage
                  .localization[AppLocalizationKeys.whatsOnYourMind],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : const Color(0xffF97D7D),
              ),
            ),
          ),
        ),
        BlocBuilder<TasksCubit, TasksState>(
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
                      onDeleteTap: (index) => _deleteTask(index),
                      onDonePressed: (task, indexOfTask) {
                        _doneTask(indexOfTask, task);
                      },
                    )
                  : TaskItemList(
                      task: tasks,
                      onDeleteTap: (index) => _deleteTask(index),
                      onDonePressed: (task, indexOfTask) {
                        _doneTask(indexOfTask, task);
                      },
                    );
            } else {
              return const SizedBox();
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
        //"My Tasks"
        ConfagurationLanguage.localization[AppLocalizationKeys.myTasks],
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
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return SearchScreen(isDark: isDark);
              }));
            },
            assetName: AppAssetPaths.searchIcon,
            color: AppColors.colorSearchIcon,
          ),
        ),
        IconButton(
            onPressed: () {
              isEnglash = !isEnglash;
              setState(() {});
              if (isEnglash) {
                BlocProvider.of<LanguageCubit>(context).changeLang("ar");
              } else {
                BlocProvider.of<LanguageCubit>(context).changeLang("en");
              }
            },
            icon: Icon(Icons.language))
      ],
    );
  }

  Widget appBarLeadingWidget() {
    return BlocBuilder<TasksCubit, TasksState>(
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
    currentCubit.changeUi();
  }

  void _getAllTasks() {
    currentCubit.getAllTasks();
  }

  void _addTask(TaskModel task) {
    currentCubit.addTasks(task);
  }

  _deleteTask(int index) => currentCubit.deleteTask(tasks[index]);

  TasksCubit get currentCubit => context.read<TasksCubit>();

  void _doneTask(int indexOfTask, TaskModel task) {
    currentCubit.updateTask(indexOfTask, task);
  }
}
