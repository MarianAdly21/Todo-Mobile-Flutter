import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_mobile/features/home/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:todo_mobile/features/home/cubits/tasks_cubit/tasks_state.dart';
import 'package:todo_mobile/features/home/widgets/custom_task_item.dart';
import 'package:todo_mobile/res/app_colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.isDark});
  final bool isDark;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.isDark ? Colors.black : Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _searchTextFormFieldWidget(),
            _searchedListWidget(),
          ],
        ),
      ),
    );
  }

  Widget _searchedListWidget() {
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        if (state is SearchLoadedState) {
          if (state.tasksFounded.isNotEmpty) {
            return Expanded(
              child: ListView.builder(
                  itemCount: state.tasksFounded.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 21, vertical: 10),
                        child: TaskItem(
                            task: state.tasksFounded[index], index: index));
                  }),
            );
          } else {
            return Center(
              child: Text(
                "No Tasks",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: widget.isDark ? Colors.white : Colors.black,
                ),
              ),
            );
          }
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _searchTextFormFieldWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
      child: TextFormField(
        cursorColor: widget.isDark ? Colors.white : Colors.black,
        onChanged: (value) {
          _getTaskSearch(value);
        },
        controller: _controller,
        decoration: InputDecoration(
          focusedBorder:
              _buildBorderTextFormField(color: AppColors.colorTaskItem),
          border: _buildBorderTextFormField(),
          enabledBorder: _buildBorderTextFormField(),
          hintText: "Saerch",
          hintStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: const Icon(Icons.search),
          prefixIconColor: AppColors.colorSearchIcon,
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.cancel_outlined,
              color: AppColors.colorSearchIcon,
            ),
            onPressed: () {
              _controller.clear();
              _getTaskSearch(_controller.text);
              setState(() {});
            },
          ),
        ),
      ),
    );
  }

///////////////////////////////////////////////////////////
//////////////////// Helper methods ///////////////////////
///////////////////////////////////////////////////////////
  OutlineInputBorder _buildBorderTextFormField({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(2),
      borderSide: BorderSide(color: color ?? AppColors.colorTextField),
    );
  }

  void _getTaskSearch(value) {
    BlocProvider.of<TasksCubit>(context).getTaskSearch(value);
  }
}
