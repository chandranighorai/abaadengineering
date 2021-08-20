import 'dart:io';
import 'dart:typed_data';

import 'package:abaadengineering/consts/app_consts.dart';
import 'package:abaadengineering/styles/my_icons.dart';
import 'package:abaadengineering/util/alertdialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'MonthReportModel.dart';

class ItemMonthlyReport extends StatefulWidget {
  final MonthlyReportModel itemMonthlyReport;

  const ItemMonthlyReport({
    Key key,
    this.itemMonthlyReport,
  }) : super(key: key);
  @override
  _ItemMonthlyReportState createState() => _ItemMonthlyReportState();
}

class _ItemMonthlyReportState extends State<ItemMonthlyReport> {
  bool _showProgress = false;
  int _progress = 0;

  Directory _downloadsDirectory;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MonthlyReportModel itemMonthReport = widget.itemMonthlyReport;
    var mExt = itemMonthReport.reportFiles
        .split(".")[itemMonthReport.reportFiles.split(".").length - 1];
    return InkWell(
      onTap: () {
        showAlertWithOkCancel(
          context,
          "Download File?",
          () {
            Navigator.pop(context);
            downloadFile(context, itemMonthReport.reportFiles);
          },
          () {
            Navigator.pop(context);
          },
        );
      },
      child: Column(
        children: [
          Container(
            child: mExt != null && mExt == 'pdf'
                ? Container(
                    child: SvgPicture.asset(iconPdf,
                        matchTextDirection: false, height: 80.0, width: 80.0),
                  )
                : mExt != null && (mExt == 'jpg' || mExt == 'jpg')
                    ? Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                          image: DecorationImage(
                            image:
                                NetworkImage("${itemMonthReport.reportFiles}"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Container(
                        child: SvgPicture.asset(iconJpg,
                            matchTextDirection: false,
                            height: 150.0,
                            width: 150.0)),
          ),
          _showProgress
              ? Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: _progress > 0
                      ? Text("Downloading $_progress")
                      : Text("Downloading..."),
                )
              : Container(),
        ],
      ),
    );
  }

  void downloadFile(BuildContext context, String drawingsImage) async {
    if (await Permission.storage.request().isGranted) {
      print("Permission granted");
      createDir();
    } else {
      showCustomToast("Please grant permission");
      return;
    }
    Directory baseDir =
        await getApplicationDocumentsDirectory(); //works for both iOS and Android
    String mDir = Consts.directoryName;
    String finalDir;
    if (Platform.isIOS) {
      finalDir = join(baseDir.path, mDir);
    } else {
      finalDir = '/storage/emulated/0/Aec';
    }
    print(finalDir);
    var httpClient = http.Client();
    var request = new http.Request('GET', Uri.parse(drawingsImage));
    var response = httpClient.send(request);
    // Directory tempDir = await getApplicationDocumentsDirectory();
    // String dir = tempDir.path;
    var imageName =
        drawingsImage.split("/")[drawingsImage.split("/").length - 1];
    List<List<int>> chunks = new List();
    int downloaded = 0;

    debugPrint("Path = $_downloadsDirectory");

    setState(() {
      _showProgress = true;
    });

    response.asStream().listen((http.StreamedResponse r) {
      r.stream.listen((List<int> chunk) {
        // Display percentage of completion
        debugPrint('downloadPercentage: ${downloaded / r.contentLength * 100}');

        chunks.add(chunk);
        downloaded += chunk.length;
      }, onDone: () async {
        // Display percentage of completion
        if (downloaded / r.contentLength * 100 == 100) {
          showCustomToast("File saved in... " + finalDir);
          setState(() {
            _showProgress = false;
          });
        } else {
          // debugPrint(
          //     'downloadPercentage: ${downloaded / r.contentLength * 100}');
          setState(() {
            _progress = (downloaded / r.contentLength * 100) as int;
          });
        }

        // Save the file
        File file = new File('$finalDir/$imageName');
        final Uint8List bytes = Uint8List(r.contentLength);
        int offset = 0;
        for (List<int> chunk in chunks) {
          bytes.setRange(offset, offset + chunk.length, chunk);
          offset += chunk.length;
        }
        await file.writeAsBytes(bytes);
        return;
      });
    });
  }

  createDir() async {
    // Directory baseDir = await getApplicationDocumentsDirectory(); //only for Android

    Directory baseDir =
        await getApplicationDocumentsDirectory(); //works for both iOS and Android
    String dirToBeCreated = Consts.directoryName;
    String finalDir;
    if (Platform.isIOS) {
      finalDir = join(baseDir.path, dirToBeCreated);
    } else {
      finalDir = '/storage/emulated/0/Aec/';
    }
    print(finalDir);
    var dir = Directory(finalDir);
    bool dirExists = await dir.exists();
    if (!dirExists) {
      dir.create(); //pass recursive as true if directory is recursive
    }
    //Now you can use this directory for saving file, etc.
    //In case you are using external storage, make sure you have storage permissions.
  }
}
