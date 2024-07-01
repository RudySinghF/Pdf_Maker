import 'package:flutter/services.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class MyPdf {
  final pdf = pw.Document();

  Future<Uint8List> generatePdf(PdfPageFormat format) async {
    final pdf = pw.Document();
    final ByteData imageData =
        await rootBundle.load('assets/male-passport-size-2.jpg');
    final Uint8List imageUint8List = imageData.buffer.asUint8List();

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
                      'John Doe',
                      style: pw.TextStyle(
                        fontSize: 16,
                        fontWeight: pw.FontWeight.bold,
                        color: const PdfColor.fromInt(0xff0161a4),
                      ),
                    )),
                pw.SizedBox(height: 4.0),
                pw.Padding(
                    padding: const pw.EdgeInsets.symmetric(horizontal: 8),
                    child: pw.Text('Electro-Technical Officer',
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold,
                        ))),
                pw.SizedBox(height: 4.0),
                pw.Padding(
                    padding: const pw.EdgeInsets.symmetric(horizontal: 8),
                    child: pw.Text('+91 1234567890 | johndoe@gmail.com',
                        style: const pw.TextStyle(fontSize: 12))),
              ],
            ),
            pw.Expanded(child: pw.Container()),
            pw.Container(
              padding: const pw.EdgeInsets.all(4),
              width: 64,
              child: pw.Image(pw.MemoryImage(imageUint8List)),
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
                children: [
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
                          'John',
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
                          'M.',
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
                          'Surname',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Doe',
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
                          'Jan 1, 1980',
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
                          'City',
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
                          'Indian',
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
                          'Male',
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
                          'Single',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          pw.SizedBox(height: 20.0),
          pw.Padding(
              padding:  const pw.EdgeInsets.symmetric(horizontal: 8),
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
                          '123456',
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
                          'Applied',
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
                          'Yes',
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
                          'Vessel Name',
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
                          'Office',
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
                          'Fleet Name',
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
                          '10 years',
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
                          'Pool Name',
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
                          'Captain',
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
                          'Licence Number',
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
                          'Type',
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
                          'Company Name',
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
                        'Book Number',
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
              padding:  const pw.EdgeInsets.symmetric(horizontal: 8),
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
                          'Vathiaparambathu House, North Mazhuvannoor P.O',
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
                          'Ernakulam',
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
                          'Kerala',
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
                          '686669',
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
                          'India',
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
                          'Z7394884',
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
                          'Govt Of India',
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
                          'Jan 1, 2010',
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
                          'Jan 1, 2030',
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ],
              )),

          pw.SizedBox(height: 20.0),

          pw.Padding(
              padding: const pw.EdgeInsets.all(4),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Padding(padding: const pw.EdgeInsets.symmetric(horizontal: 4),child:pw.Text(
                    'Experience',
                    style: const pw.TextStyle(
                      color: PdfColor.fromInt(0xff0161a4),
                    ),
                  )),
                  pw.SizedBox(height: 8.0),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 4),
                    child: pw.Text(
                      'Chief Engineer',
                      style: pw.TextStyle(
                        fontSize: 10,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                  pw.SizedBox(height: 1.5),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 4),
                    child: pw.Text(
                      'MV Ocean Explorer (IMO123456)',
                      style: const pw.TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),
                  pw.SizedBox(height: 1.5),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 4),
                    child: pw.Text(
                      'January 2018 - December 2020 (15 months)',
                      style: const pw.TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),
                  pw.SizedBox(height: 1.5),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 4),
                    child: pw.Text(
                      'Oceanic Shipping Ltd. - New Delhi, India',
                      style: const pw.TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),
                  pw.SizedBox(height: 16.0),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 4),
                    child: pw.Text(
                      'Oversaw the operation and maintenance of the MV Ocean Explorer, a vessel with DWT of 10,000 tons, GT of 15,000 tons, and an engine output of 5,000 HP. Managed compliance, crew, and preventative maintenance, enhancing operational efficiency.',
                      style: const pw.TextStyle(
                        fontSize: 10,
                        lineSpacing: 1.5, // Adjust line height here
                      ),
                    ),
                  ),
                ],
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
}
