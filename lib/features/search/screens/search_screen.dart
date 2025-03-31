import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_mobile/features/home/widgets/custom_task_item.dart';
import 'package:todo_mobile/features/search/bloc/search_screen_bloc.dart';
import 'package:todo_mobile/res/app_colors.dart';
import 'package:todo_mobile/utils/local/app_localization_keys.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key, required this.isDark});
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchScreenBloc(),
      child: SearchScreenWithBloc(isDark: isDark),
    );
  }
}

class SearchScreenWithBloc extends StatefulWidget {
  const SearchScreenWithBloc({super.key, required this.isDark});
  final bool isDark;
  @override
  State<SearchScreenWithBloc> createState() => _SearchScreenWithBlocState();
}

class _SearchScreenWithBlocState extends State<SearchScreenWithBloc> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.isDark ? Colors.black : Colors.white,
      body: SafeArea(
        child: Column(children: [
          _searchTextFormFieldWidget(),
          _searchedListWidget(),
        ]),
      ),
    );
  }

  Widget _searchedListWidget() {
    return BlocConsumer<SearchScreenBloc, SearchScreenState>(
      listener: (context, state) {
        if (state is DeleteFromSearchFormState) {
          _controller.clear();
          _getTaskEvent(_controller.text);
          setState(() {});
        }
      },
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
                            onDeleteTap: () {},
                            onDonePressed: () {},
                            task: state.tasksFounded[index],
                            index: index));
                  }),
            );
          } else {
            return Center(
              child: Text(
                "noTasks",
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
        style: TextStyle(color: widget.isDark ? Colors.white : Colors.black),
        cursorColor: widget.isDark ? Colors.white : Colors.black,
        onChanged: (titleSearch) {
          _getTaskEvent(titleSearch);
        },
        controller: _controller,
        decoration: InputDecoration(
          focusedBorder:
              _buildBorderTextFormField(color: AppColors.colorTaskItem),
          border: _buildBorderTextFormField(),
          enabledBorder: _buildBorderTextFormField(),
          hintText: "search",
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
              currentBloc().add(DeleteFromSearchFormEvent());
              // _controller.clear();
              // _getTaskEvent(_controller.text);
              // setState(() {});
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

  SearchScreenBloc currentBloc() => context.read<SearchScreenBloc>();

  void _getTaskEvent(titleSearch) {
    currentBloc().add(GetTasksEvent(titleSearch: titleSearch));
  }
}
