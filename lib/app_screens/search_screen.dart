import 'package:ajk_tour/utils/config.dart';
import 'package:ajk_tour/widgets/dynamic_sizes.dart';
import 'package:ajk_tour/widgets/essential_widgets.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myGrey,
      floatingActionButton: sosFloatingButton(),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: dynamicWidth(context, 0.94),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: dynamicHeight(context, .02),
                  ),
                  child: Hero(
                    tag: "SearchBar",
                    child: Material(
                      color: noColor,
                      child: searchbar(
                        context,
                        controller: searchText,
                        setStateFunction: () {
                          setState(
                            () {},
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget searchbar(context, {enabled = true, controller, setStateFunction}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 5),
    decoration: BoxDecoration(
        color: myWhite,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
              color: myGrey,
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(2, 2))
        ]),
    child: Row(
      children: [
        (enabled == true)
            ? InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(Icons.arrow_back),
                ),
              )
            : Container(),
        Expanded(
          child: TextField(
            controller: controller,
            enabled: enabled,
            autofocus: enabled,
            decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 20),
                hintText: "Search Your Product"),
            onSubmitted: (value) {
              controller.text = value;
              setStateFunction();
            },
          ),
        ),
        InkWell(
          onTap: () {
            setStateFunction();
          },
          child: const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.search_sharp),
          ),
        ),
      ],
    ),
  );
}
