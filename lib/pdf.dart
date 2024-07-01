import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darya/services/datetime.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:http/http.dart' as http;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:printing/printing.dart';
// import 'package:intl/intl.dart';

class CV extends ConsumerStatefulWidget {
  final dynamic data;
  const CV({
    super.key,
    this.data,
  });
  @override
  ConsumerState<CV> createState() => _CVState();
}

class _CVState extends ConsumerState<CV> {
  List<Map<String, dynamic>> seaExperienceData = [];
  int seaExpLength = 0;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      // Fetch documents from the "seaExperiences" subcollection
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('/applications/${widget.data['id']}/seaExperiences')
          .get();

      // Extract the data from the query snapshot
      List<Map<String, dynamic>> seaExperienceData = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      // Print the fetched data
      print('seaExperience: $seaExperienceData');
      setState(() {
        seaExpLength = seaExperienceData.length;
        print('length: $seaExpLength');
      });
      // print('length: ${seaExperienceData.length}');
    } catch (e) {
      print('Failed to load data: $e');
    }
  }

  Future<Uint8List> generatePdf(
      PdfPageFormat format, WidgetRef ref, data) async {
    final pdf = pw.Document();
    // final ByteData imageData =
    //     await rootBundle.load('assets/images/profile_icon.jpeg');
    final response = await http.get(Uri.parse(data['photoUrl'] ?? ''));
    Uint8List? imagedynamic = response.bodyBytes;
    // final Uint8List imagedefault = imageData.buffer.asUint8List();
    List<pw.TableRow> tableRows = List.generate(1, (index) {
      final doc = seaExperienceData[index];
      print('doc ${doc}');
      print('sea experience table called');
      return pw.TableRow(
        children: [
          pw.Padding(
            padding: const pw.EdgeInsets.all(4),
            child: pw.Text(
              '${doc['rank'] ?? ''}',
              style: pw.TextStyle(
                fontSize: 10,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.all(4),
            child: pw.Text(
              'seaExperienceData[,',
              style: const pw.TextStyle(
                fontSize: 10,
              ),
            ),
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.all(4),
            child: pw.Text(
              'sf',
              style: const pw.TextStyle(
                fontSize: 10,
              ),
            ),
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.all(4),
            child: pw.Text(
              'grfgb',
              style: const pw.TextStyle(
                fontSize: 10,
              ),
            ),
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.all(4),
            child: pw.Text(
              'grfgb',
              style: const pw.TextStyle(
                fontSize: 10,
              ),
            ),
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.all(4),
            child: pw.Text(
              'grfgb',
              style: const pw.TextStyle(
                fontSize: 10,
              ),
            ),
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.all(4),
            child: pw.Text(
              'grfgb',
              style: const pw.TextStyle(
                fontSize: 10,
              ),
            ),
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.all(4),
            child: pw.Text(
              'grfgb',
              style: const pw.TextStyle(
                fontSize: 10,
              ),
            ),
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.all(4),
            child: pw.Text(
              'grfgb',
              style: const pw.TextStyle(
                fontSize: 10,
              ),
            ),
          ),
        ],
      );
    });

    pdf.addPage(
      pw.MultiPage(
        pageFormat: format,
        margin: const pw.EdgeInsets.all(24),
        build: (context) => [
          pw.Row(children: [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Padding(
                    padding: const pw.EdgeInsets.symmetric(horizontal: 8),
                    child: pw.Text(
                      '${data['firstName'] ?? ''} ${data['middleName'] ?? ''} ${data['lastName'] ?? ''}',
                      style: pw.TextStyle(
                        fontSize: 16,
                        fontWeight: pw.FontWeight.bold,
                        color: const PdfColor.fromInt(0xff0161a4),
                      ),
                    )),
                pw.SizedBox(height: 4.0),
                pw.Padding(
                    padding: const pw.EdgeInsets.symmetric(horizontal: 8),
                    child: pw.Text('${data['rank']}',
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold,
                        ))),
                pw.SizedBox(height: 4.0),
                pw.Padding(
                    padding: const pw.EdgeInsets.symmetric(horizontal: 8),
                    child: pw.Text(
                        '+91 ${data['primaryPhone'] ?? ''} | ${data['primaryEmail'] ?? ''}',
                        style: const pw.TextStyle(fontSize: 12))),
              ],
            ),
            pw.Expanded(child: pw.Container()),
            pw.Container(
              padding: const pw.EdgeInsets.all(4),
              width: 64,
              child: pw.Image(pw.MemoryImage(imagedynamic)),
            ),
          ]),

          pw.SizedBox(height: 20.0),
          pw.Padding(
              padding: const pw.EdgeInsets.symmetric(horizontal: 8),
              child: pw.Text(
                'Personal Details',
                style: const pw.TextStyle(
                  // fontWeight: pw.FontWeight.bold,
                  color: PdfColor.fromInt(0xff0161a4),
                ),
              )),
          pw.SizedBox(height: 4),
          pw.Padding(
              padding: const pw.EdgeInsets.all(4),
              child: pw.Table(
                border: const pw.TableBorder(
                  horizontalInside: pw.BorderSide(color: PdfColors.grey300),
                  bottom: pw.BorderSide(color: PdfColors.grey300),
                ),
                columnWidths: {
                  0: const pw.FlexColumnWidth(),
                  1: const pw.FlexColumnWidth(),
                  2: const pw.FlexColumnWidth(),
                  3: const pw.FlexColumnWidth(),
                },
                children: <pw.TableRow>[
                  pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'First Name',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                          // style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          '${data['firstName'] ?? ''}',
                          style: const pw.TextStyle(
                            fontSize: 10,
                          ),
                          // style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Middle Name',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                          // style: pw.TextStyle(
                          //     fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          '${data['middleName'] ?? ''}',
                          style: const pw.TextStyle(
                            fontSize: 10,
                          ),
                          // style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Last Name',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          '${data['lastName'] ?? ''}',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Birth Date',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          '${convertTimestamp(data['dob']) ?? ''}',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Place of Birth',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          '${data['pob'] ?? ''}',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Nationality',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          '${data['nationality'] ?? ''}',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Gender',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          '${data['gender'] ?? ''}',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Marital Status',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          '${data['maritalStatus'] ?? ''}',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          pw.SizedBox(height: 20.0),
          pw.Padding(
              padding: const pw.EdgeInsets.symmetric(horizontal: 8),
              child: pw.Text(
                'Crew Details',
                style: const pw.TextStyle(
                  color: PdfColor.fromInt(0xff0161a4),
                ),
              )),
          pw.SizedBox(height: 4),

          // pw.TableHelper.fromTextArray(
          //   context: context,
          //   headerCount: 0,
          //   border: pw.TableBorder.symmetric(
          //       inside: pw.BorderSide.none,
          //       outside: const pw.BorderSide(
          //           color: PdfColors.grey400, width: 0.5)),
          //   data: <List<String>>[
          //     ['Crew Id', '123456', 'Status', 'Active', 'Rank', 'Captain'],
          //     [
          //       'Ready to Join',
          //       'Yes',
          //       'Next Vessel',
          //       'Vessel Name',
          //       'Licence',
          //       'Licence Number'
          //     ],
          //     [
          //       'Manning Office',
          //       'Office',
          //       'Fleet',
          //       'Fleet Name',
          //       'Crew Type',
          //       'Type'
          //     ],
          //     [
          //       'Employment Time',
          //       '10 years',
          //       'Owner Pool',
          //       'Pool Name',
          //       'Company',
          //       'Company Name'
          //     ],
          //   ],
          // ),
          pw.Padding(
              padding: const pw.EdgeInsets.all(4),
              child: pw.Table(
                border: const pw.TableBorder(
                  horizontalInside: pw.BorderSide(color: PdfColors.grey300),
                  bottom: pw.BorderSide(color: PdfColors.grey300),
                ),
                columnWidths: {
                  0: const pw.FlexColumnWidth(),
                  1: const pw.FlexColumnWidth(),
                  2: const pw.FlexColumnWidth(),
                  3: const pw.FlexColumnWidth(),
                },
                children: [
                  pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Crew Id',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          '',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Status',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          '${data['status'] ?? ''}',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Ready to Join',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          '',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Next Vessel',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          '',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Manning Office',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          '',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Fleet',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          ' ',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Employment Time',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          '',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Owner Pool',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          '',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Rank',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          '${data['rank'] ?? ''}',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Licence',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          '',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Crew Type',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          '${data['type'] ?? ''}',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Company',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          '',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                  pw.TableRow(children: [
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(4),
                      child: pw.Text(
                        'Seaman Book',
                        style: pw.TextStyle(
                            fontSize: 10, fontWeight: pw.FontWeight.bold),
                      ),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(4),
                      child: pw.Text(
                        '',
                        style: const pw.TextStyle(fontSize: 10),
                      ),
                    ),
                  ])
                ],
              )),
          pw.SizedBox(height: 20.0),
          // // pw.TableHelper.fromTextArray(
          // //   context: context,
          // //   headerCount: 0,
          // //   border: pw.TableBorder.all(color: PdfColors.grey400, width: 0.5),
          // //   data: <List<String>>[
          // //     [
          // //       'Passport',
          // //       'Passport Number',
          // //       'Issued',
          // //       '01/01/2010',
          // //       'Expiry',
          // //       '01/01/2030'
          // //     ],
          // //     [
          // //       'Seaman Book',
          // //       'Book Number',
          // //       'Issued',
          // //       '01/01/2010',
          // //       'Expiry',
          // //       '01/01/2030'
          // //     ],
          // //   ],
          // // ),
          pw.Padding(
              padding: const pw.EdgeInsets.symmetric(horizontal: 8),
              child: pw.Text(
                'Address Details',
                style: const pw.TextStyle(color: PdfColor.fromInt(0xff0161a4)),
              )),
          pw.SizedBox(height: 4),

          // pw.TableHelper.fromTextArray(
          //   context: context,
          //   headerCount: 0,
          //   border: pw.TableBorder.all(color: PdfColors.grey400, width: 0.5),
          //   data: <List<String>>[
          //     [
          //       'Passport',
          //       'Passport Number',
          //       'Issued',
          //       '01/01/2010',
          //       'Expiry',
          //       '01/01/2030'
          //     ],
          //     [
          //       'Seaman Book',
          //       'Book Number',
          //       'Issued',
          //       '01/01/2010',
          //       'Expiry',
          //       '01/01/2030'
          //     ],
          //   ],
          // ),
          pw.Padding(
              padding: const pw.EdgeInsets.all(4),
              child: pw.Table(
                border: const pw.TableBorder(
                  horizontalInside: pw.BorderSide(color: PdfColors.grey300),
                  bottom: pw.BorderSide(color: PdfColors.grey300),
                ),
                columnWidths: {
                  0: const pw.FlexColumnWidth(),
                  1: const pw.FlexColumnWidth(),
                  2: const pw.FlexColumnWidth(),
                  3: const pw.FlexColumnWidth(),
                },
                children: [
                  pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Address Line',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          '${data['presentAddress']['addressLine'] ?? ''}',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'City',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          '${data['presentAddress']['city'] ?? ''}',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'State',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          '${data['presentAddress']['state'] ?? ''}',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Zip',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          '${data['presentAddress']['zip'] ?? ''}',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Country',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          '${data['presentAddress']['country'] ?? ''}',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ],
              )),

          pw.SizedBox(height: 20.0),
          pw.Padding(
              padding: const pw.EdgeInsets.symmetric(horizontal: 8),
              child: pw.Text(
                'Passport Details',
                style: const pw.TextStyle(color: PdfColor.fromInt(0xff0161a4)),
              )),
          pw.SizedBox(height: 4),

          // pw.TableHelper.fromTextArray(
          //   context: context,
          //   headerCount: 0,
          //   border: pw.TableBorder.all(color: PdfColors.grey400, width: 0.5),
          //   data: <List<String>>[
          //     [
          //       'Passport',
          //       'Passport Number',
          //       'Issued',
          //       '01/01/2010',
          //       'Expiry',
          //       '01/01/2030'
          //     ],
          //     [
          //       'Seaman Book',
          //       'Book Number',
          //       'Issued',
          //       '01/01/2010',
          //       'Expiry',
          //       '01/01/2030'
          //     ],
          //   ],
          // ),
          pw.Padding(
              padding: const pw.EdgeInsets.all(4),
              child: pw.Table(
                border: const pw.TableBorder(
                  horizontalInside: pw.BorderSide(color: PdfColors.grey300),
                  bottom: pw.BorderSide(color: PdfColors.grey300),
                ),
                columnWidths: {
                  0: const pw.FlexColumnWidth(),
                  1: const pw.FlexColumnWidth(),
                  2: const pw.FlexColumnWidth(),
                  3: const pw.FlexColumnWidth(),
                },
                children: [
                  pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Passport',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          '${data['passportNumber'] ?? ''}',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Issuing Authority',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          '${data['passportIssuingAuthority'] ?? ''}',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Issued',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          '${convertTimestamp(data['passportIssue'])}',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Expiry',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          '${convertTimestamp(data['passportExpiry'])}',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ],
              )),

          pw.SizedBox(height: 20.0),
          pw.Padding(
            padding: const pw.EdgeInsets.symmetric(horizontal: 8),
            child: pw.Text(
              'Experience',
              style: const pw.TextStyle(
                color: PdfColor.fromInt(0xff0161a4),
              ),
            ),
          ),

          pw.Padding(
              padding: const pw.EdgeInsets.all(4),
              child: pw.Table(
                border: const pw.TableBorder(
                  horizontalInside: pw.BorderSide(color: PdfColors.grey300),
                  bottom: pw.BorderSide(color: PdfColors.grey300),
                ),
                columnWidths: {
                  0: const pw.FlexColumnWidth(),
                  1: const pw.FlexColumnWidth(),
                  2: const pw.FlexColumnWidth(),
                  3: const pw.FlexColumnWidth(),
                  4: const pw.FlexColumnWidth(),
                  5: const pw.FlexColumnWidth(),
                  6: const pw.FlexColumnWidth(),
                  7: const pw.FlexColumnWidth(),
                  8: const pw.FlexColumnWidth(),
                },
                children: [
                  pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Employer',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Rank',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Vessel Name',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'IMO',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Vessel Type',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'GRT',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Year built',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Service From',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Service To',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              )),

          pw.Padding(
              padding: const pw.EdgeInsets.all(4),
              child: pw.Table(
                columnWidths: {
                  0: const pw.FlexColumnWidth(),
                  1: const pw.FlexColumnWidth(),
                  2: const pw.FlexColumnWidth(),
                  3: const pw.FlexColumnWidth(),
                  4: const pw.FlexColumnWidth(),
                  5: const pw.FlexColumnWidth(),
                  6: const pw.FlexColumnWidth(),
                  7: const pw.FlexColumnWidth(),
                  8: const pw.FlexColumnWidth(),
                },
                border: const pw.TableBorder(
                  horizontalInside: pw.BorderSide(color: PdfColors.grey300),
                  bottom: pw.BorderSide(color: PdfColors.grey300),
                ),
                children: tableRows,
              )),
          pw.SizedBox(height: 20.0),
          pw.Padding(
              padding: const pw.EdgeInsets.symmetric(horizontal: 8),
              child: pw.Text(
                'Family Details',
                style: const pw.TextStyle(color: PdfColor.fromInt(0xff0161a4)),
              )),
          pw.SizedBox(height: 4),

          pw.Padding(
              padding: const pw.EdgeInsets.all(4),
              child: pw.Table(
                border: const pw.TableBorder(
                  horizontalInside: pw.BorderSide(color: PdfColors.grey300),
                  bottom: pw.BorderSide(color: PdfColors.grey300),
                ),
                columnWidths: {
                  0: const pw.FlexColumnWidth(),
                  1: const pw.FlexColumnWidth(),
                  2: const pw.FlexColumnWidth(),
                  3: const pw.FlexColumnWidth(),
                  4: const pw.FixedColumnWidth(40),
                  5: const pw.FixedColumnWidth(40),
                  6: const pw.FlexColumnWidth(),
                  7: const pw.FixedColumnWidth(40),
                },
                children: [
                  pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Name',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Relation',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'DOB',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Nationality',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'BNF',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Sex',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Contact',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'NOK',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Priyanka Gautam',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Spouse',
                          style: const pw.TextStyle(
                              fontSize: 10, lineSpacing: 4.5),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Mar 3, 1988',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Indian',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Yes',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'F',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          '9876543210',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Yes',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Priyanka Gautam',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Spouse',
                          style: const pw.TextStyle(
                              fontSize: 10, lineSpacing: 4.5),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Mar 3, 1988',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Indian',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Yes',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'F',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          '9876543210',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Yes',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          pw.SizedBox(height: 20.0),
          pw.Padding(
              padding: const pw.EdgeInsets.symmetric(horizontal: 8),
              child: pw.Text(
                'Certificates',
                style: const pw.TextStyle(color: PdfColor.fromInt(0xff0161a4)),
              )),
          pw.SizedBox(height: 4),
          pw.Padding(
              padding: const pw.EdgeInsets.all(4),
              child: pw.Table(
                border: const pw.TableBorder(
                  horizontalInside: pw.BorderSide(color: PdfColors.grey300),
                  bottom: pw.BorderSide(color: PdfColors.grey300),
                ),
                columnWidths: {
                  0: const pw.FlexColumnWidth(),
                  1: const pw.FlexColumnWidth(),
                  2: const pw.FlexColumnWidth(),
                  3: const pw.FlexColumnWidth(),
                  4: const pw.FlexColumnWidth(),
                  5: const pw.FlexColumnWidth(),
                },
                children: [
                  pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Certificate',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Number',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Issuing Authority',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Issued',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Expiry',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Place Of Issue',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Provider',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'PSCRB (WITHIN LAST 4YRS)',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'NATCOM/RANSCO/044/2013',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          ' ',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Jun 8, 2022',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Jun 7, 2027',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'MUMBAI',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          ' ',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'DCE (CHEM) LEVEL 2',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'DCN02MUM21010604',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          ' ',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Nov 14, 2021',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Nov 13, 2026',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'MUMBAI',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          ' ',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ],
              )),

          // pw.Container(
          //     decoration: pw.BoxDecoration(
          //       border: pw.Border.all(color: PdfColors.grey400, width: 0.5),
          //       borderRadius:
          //           const pw.BorderRadius.all(pw.Radius.circular(5)),
          //     ),
          //     child: pw.TableHelper.fromTextArray(
          //       headerAlignment: pw.Alignment.centerLeft,
          //       cellAlignment: pw.Alignment.centerLeft,
          //       border: pw.TableBorder.symmetric(
          //         inside: pw.BorderSide.none,
          //       ),
          //       headerStyle: pw.TextStyle(
          //           fontSize: 10, fontWeight: pw.FontWeight.bold),
          //       context: context,
          //       cellStyle: pw.TextStyle(fontSize: 8, lineSpacing: 4.5),
          //       headers: <String>[
          //         'Column',
          //         'Vessel Particulars',
          //         // 'IMO Number',
          //         // 'Type',
          //         // 'Engine',
          //         // 'DWT',
          //         // 'GRT',
          //         // 'HP',
          //         'Area of Operation',
          //         'Scope of Operation',
          //         'Remarks'
          //       ],
          //       data: <List<String>>[
          //         [
          //           'Captain 2020-2022',
          //           'Prelude 9648714 OffShore Engine 499125(t) 403342(GT) 5000hp',
          //           'Global',
          //           'Scope',
          //           'Remarks'
          //         ],
          //       ],
          //     )),
          pw.SizedBox(height: 20),
          pw.Padding(
              padding: const pw.EdgeInsets.symmetric(horizontal: 8),
              child: pw.Text(
                'Additional Details',
                style: const pw.TextStyle(color: PdfColor.fromInt(0xff0161a4)),
              )),
          pw.SizedBox(height: 4),

          // pw.TableHelper.fromTextArray(
          //   context: context,
          //   headerCount: 0,
          //   border: pw.TableBorder.all(color: PdfColors.grey400, width: 0.5),
          //   data: <List<String>>[
          //     [
          //       'Cadet Type',
          //       'Type',
          //       'Remarks',
          //       'Remarks',
          //       'Source',
          //       'Source'
          //     ],
          //     [
          //       'Father\'s Surname',
          //       'Father Surname',
          //       'Father\'s Name',
          //       'Father Name',
          //       'Father\'s Middle Name',
          //       'Father Middle Name'
          //     ],
          //     [
          //       'Mother\'s Surname',
          //       'Mother Surname',
          //       'Mother\'s Name',
          //       'Mother Name',
          //       'Mother\'s Middle Name',
          //       'Mother Middle Name'
          //     ],
          //     [
          //       'Original Surname',
          //       'Original Surname',
          //       'Original Name',
          //       'Original Name',
          //       'Original Middle Name',
          //       'Original Middle Name'
          //     ],
          //     ['Race', 'Race', 'Religion', 'Religion', 'Gender', 'Gender'],
          //     [
          //       'Marital Status',
          //       'Status',
          //       'Marriage Date',
          //       '01/01/2000',
          //       'Date of Hire/Rehire',
          //       '01/01/2010'
          //     ],
          //   ],
          // ),
          pw.Padding(
              padding: const pw.EdgeInsets.all(4),
              child: pw.Table(
                border: const pw.TableBorder(
                  horizontalInside: pw.BorderSide(color: PdfColors.grey300),
                  bottom: pw.BorderSide(color: PdfColors.grey300),
                ),
                columnWidths: {
                  0: const pw.FlexColumnWidth(),
                  1: const pw.FlexColumnWidth(),
                  2: const pw.FlexColumnWidth(),
                  3: const pw.FlexColumnWidth(),
                },
                children: [
                  pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Cadet Type',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Type',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Date of Hire/Rehire',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Jan 1, 2010',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Source',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Source',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Race',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Race',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Religion',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Religion',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Marriage Date',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Jan 1, 2000',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: PdfPreview(
            build: (format) => generatePdf(format, ref, widget.data)));
  }
}
