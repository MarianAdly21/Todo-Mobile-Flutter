import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_mobile/features/home/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:todo_mobile/features/home/cubits/tasks_cubit/tasks_state.dart';
import 'package:todo_mobile/features/home/models/task_model.dart';
import 'package:todo_mobile/features/home/widgets/custom_bottom_navigation_bar.dart';
import 'package:todo_mobile/features/home/widgets/custom_icon.dart';
import 'package:todo_mobile/features/home/widgets/task_item_grid.dart';
import 'package:todo_mobile/features/home/widgets/task_item_list.dart';
import 'package:todo_mobile/features/search/screens/search_screen.dart';
import 'package:todo_mobile/res/app_asset_paths.dart';
import 'package:todo_mobile/res/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isGrid = false;
  List<TaskModel> tasks = [];
  @override
  void initState() {
    _getAllTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(),
      appBar: _homeAppBarWidget(),
      body: BlocListener<TasksCubit, TasksState>(
        listener: (context, state) {
          if (state is ConvertUiState) {
            isGrid = state.isGrid;
          }
        },
        child: _pageContent(),
      ),
    );
  }

///////////////////////////////////////////////////////////
//////////////////// Widget methods ///////////////////////
///////////////////////////////////////////////////////////

  Widget _pageContent() {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsetsDirectional.only(
                start: 20, end: 39, top: 49, bottom: 27),
            child: Text(
              'Whats on your mind?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xffF97D7D),
              ),
            ),
          ),
        ),
        BlocBuilder<TasksCubit, TasksState>(
          builder: (context, state) {
            if (state is LoadedTasksSuccessState) {
              tasks = state.tasks;
            }
            if (state is LoadedTasksSuccessState || state is ConvertUiState) {
              return isGrid
                  ? TaskItemGrid(
                      tasks: tasks,
                    )
                  : TaskItemList(task: tasks);
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
      leadingWidth: 90,
      leading: appBarLeadingWidget(),
      title: const Text(
        "My Tasks",
        style: TextStyle(
          color: Color(0xffFF0000),
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
                return SearchScreen();
              }));
            },
            assetName: AppAssetPaths.searchIcon,
            color: AppColors.colorSearchIcon,
          ),
        ),
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
              color: AppColors.gridAndListIcon,
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
    currentTasksCubit(context).changeUi();
  }

  void _getAllTasks() {
    currentTasksCubit(context).getAllTasks();
  }
}

TasksCubit currentTasksCubit(BuildContext context) =>
    context.read<TasksCubit>();
