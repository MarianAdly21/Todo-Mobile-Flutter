import 'package:flutter/material.dart';
import 'package:todo_mobile/res/app_colors.dart';

class AddTaskForm extends StatelessWidget {
  const AddTaskForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _customText(title: 'Todo Title'),
          _customTextFormField(hintText: "Todo title....."),
          _customText(title: 'Write anything in your mind'),
          _customTextFormField(hintText: "Write anything in your mind "),
          _customButton(context),
          const SizedBox(
            height: 31,
          )
        ],
      ),
    );
  }

///////////////////////////////////////////////////////////
//////////////////// Widget methods ///////////////////////
///////////////////////////////////////////////////////////

  Widget _customButton(BuildContext context) {
    return Container(
      height: 57,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.colorButtom,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(
        child: Text(
          "Save",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _customTextFormField(
      {required String hintText, void Function(String?)? onSaved}) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 10,
        bottom: 23,
      ),
      child: TextFormField(
        onSaved: onSaved,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          border: _outLineInputBorder(),
          enabledBorder: _outLineInputBorder(),
          focusedBorder: _outLineInputBorder(color: AppColors.colorTaskItem),
        ),
      ),
    );
  }

  Widget _customText({required String title}) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: Color(0xff52525C),
      ),
    );
  }

  OutlineInputBorder _outLineInputBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: color ?? AppColors.colorTextField,
      ),
    );
  }
}
