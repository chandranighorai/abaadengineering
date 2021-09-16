import 'package:abaadengineering/models/projects_model.dart';
import 'package:abaadengineering/ui/mainActivity.dart';
import 'package:flutter/material.dart';

class ItemProjects extends StatefulWidget {
  final Projects projects;

  const ItemProjects({Key key, this.projects}) : super(key: key);
  @override
  _ItemProjectsState createState() => _ItemProjectsState();
}

class _ItemProjectsState extends State<ItemProjects> {
  @override
  Widget build(BuildContext context) {
    Projects project = widget.projects;
    // print("Project..." + project.toString());
    // print("Project..." + project.featuredImage.toString());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
      child: InkWell(
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MainActivity(
                projects: project,
              ),
            ),
          )
        },
        child: Container(
          decoration: BoxDecoration(
              color: Color(0XCCF5F5F5),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              border: Border.all(color: Color(0XCCF5F5F5))),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 4.0,
              bottom: 4.0,
              left: 5.0,
              right: 5.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 70.0,
                  height: 70.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                    image: DecorationImage(
                      image: NetworkImage("${project.featuredImage}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, top: 4.0, right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "${project.propertyTitle}",
                          style: TextStyle(
                            color: Color(0XCC000000),
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          "${project.city}",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          project.description.length > 50
                              ? "${project.description[10]}..."
                              : "${project.description}",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: 70.0,
                    child: Center(
                      child: Icon(
                        Icons.arrow_right,
                        size: 40,
                        color: Color(0xFFFFC107),
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
