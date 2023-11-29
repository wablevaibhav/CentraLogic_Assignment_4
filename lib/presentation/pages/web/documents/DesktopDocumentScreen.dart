import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../data/entities/document.dart';
import '../../../bloc/documents/document_event.dart';
import '../../../bloc/documents/document_state.dart';
import '../../../bloc/documents/document_bloc.dart';
import '../../../widgets/BodyTableCell.dart';
import '../../../widgets/BuildOtherTab.dart';
import '../../../widgets/HeadTableCell.dart';
import '../../../widgets/SubtitleText.dart';
import '../../../widgets/TitleText.dart';

class DesktopDocumentScreen extends StatefulWidget {
  const DesktopDocumentScreen({super.key});

  @override
  State<DesktopDocumentScreen> createState() => _DesktopDocumentScreenState();
}

class _DesktopDocumentScreenState extends State<DesktopDocumentScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DocumentBloc>(context).add(DocumentsInitialFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          getActionButton(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 34,
          horizontal: 30,
        ),
        child: DefaultTabController(
          length: 04,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                child: Text(
                  "Documents",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              buildTabBar(),
              const SizedBox(
                height: 30,
              ),
              buildTabBarView(),
            ],
          ),
        ),
      ),
    );
  }

  buildTabBar() =>
      Container(
        width: 728,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromRGBO(
            242,
            242,
            242,
            1,
          ),
        ),
        child: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Colors.white,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromRGBO(
              21,
              58,
              131,
              1,
            ),
          ),
          dividerColor: Colors.transparent,
          tabs: const [
            Tab(
              text: "Joining Documents",
            ),
            Tab(
              text: "Transaction Documents",
            ),
            Tab(
              text: "Team Documents",
            ),
            Tab(
              text: "Tax Documents",
            ),
          ],
        ),
      );

  buildTabBarView() {
    debugPrint("Joining: ${DocumentsData.joining.length}");
    debugPrint("Transactions: ${DocumentsData.transactions.length}");
    debugPrint("Team: ${DocumentsData.team.length}");
    debugPrint("Tax: ${DocumentsData.tax.length}");
    return Expanded(
      //width: 728,
      child: TabBarView(
        children: [

          /// Bloc builder to build the joining tab
          BlocBuilder<DocumentBloc, DocumentState>(
            builder: (context, state) {
              if (state is DocumentsFetchedState) {
                return buildOtherTabs(
                  documents: DocumentsData.joining,
                );
              }
              return buildOtherTabs(
                documents: DocumentsData.joining,
              );
            },
          ),

          BlocBuilder<DocumentBloc, DocumentState>(
            builder: (context, state) {
              if (state is DocumentsFetchedState) {
                return buildTransactionsTab(
                  transactions: DocumentsData.transactions,
                );
              }
              return buildTransactionsTab(
                transactions: DocumentsData.transactions,
              );
            },
          ),

          /// Bloc builder to build the team tab
          BlocBuilder<DocumentBloc, DocumentState>(
            builder: (context, state) {
              if (state is DocumentsFetchedState) {
                return buildOtherTabs(
                  documents: DocumentsData.team,
                );
              }
              return buildOtherTabs(
                documents: DocumentsData.team,
              );
            },
          ),

          /// Bloc builder to build the tax tab
          BlocBuilder<DocumentBloc, DocumentState>(
            builder: (context, state) {
              if (state is DocumentsFetchedState) {
                return buildOtherTabs(
                  documents: DocumentsData.tax,
                );
              }
              return buildOtherTabs(
                documents: DocumentsData.tax,
              );
            },
          ),
        ],
      ),
    );
  }

  buildTransactionsTab({required List<Transaction> transactions}) =>
      SizedBox(
        width: 728,
        child: ListView.separated(
          itemBuilder: (context, index) {
            final DocumentsBloc = DocumentBloc();

            return BlocProvider.value(
              value: DocumentsBloc,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  /// ListTile to display the Transaction document address and transaction ID
                  ListTile(
                    titleAlignment: ListTileTitleAlignment.center,
                    shape: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(
                          48,
                          48,
                          48,
                          0.05,
                        ),
                        width: 1,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),

                    /// Document Title
                    title: getTitleText(transactions[index].address),

                    /// Document Transaction ID
                    subtitle: getSubtitleText(
                      "Transaction ID #${transactions[index].transactionId}",
                    ),

                    /// Trailing icon to preview the document
                    trailing: BlocBuilder<DocumentBloc, DocumentState>(
                      builder: (context, state) {
                        if (state is ShowTransactionDocumentsState) {
                          return IconButton(
                            onPressed: () {
                              /// Dispatching the event to Hide the transaction documents
                              BlocProvider.of<DocumentBloc>(context).add(
                                HideTransactionDocumentsEvent(
                                  transactionId:
                                  transactions[index].transactionId,
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.keyboard_arrow_up,
                              color: Colors.grey,
                            ),
                          );
                        }
                        return IconButton(
                          onPressed: () {
                            BlocProvider.of<DocumentBloc>(context).add(
                              LoadTransactionDocumentsEvent(
                                transactionId:
                                transactions[index].transactionId,
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.chevron_right,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  BlocBuilder<DocumentBloc, DocumentState>(
                    builder: (context, state) =>
                    state is ShowTransactionDocumentsState &&
                        state.transactionId ==
                            transactions[index].transactionId
                        ? buildDocumentsTable(
                      documents: transactions[index].documents,
                    )
                        : state is HideTransactionDocumentsState
                        ? const SizedBox()
                        : const SizedBox(),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) =>
          const SizedBox(
            height: 10,
          ),
          itemCount: transactions.length,
        ),
      );

  getActionButton() =>
      Container(
        width: 142,
        height: 42,
        padding: const EdgeInsets.symmetric(
          horizontal: 08,
          vertical: 06,
        ),
        margin: const EdgeInsets.only(
          right: 30,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromRGBO(
              1,
              48,
              48,
              48,
            ),
            width: 1,
          ),
        ),
        child: DropdownButton(
          onChanged: (value) {},
          underline: Container(),
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: Color.fromRGBO(
              48,
              48,
              48,
              1,
            ),
          ),
          items: [
            DropdownMenuItem(
              child: Row(
                children: [
                  Image.asset("assets/avatars.png"),
                  const SizedBox(
                    width: 08,
                  ),
                  const Text(
                    "Charles",
                    style: TextStyle(
                      fontSize: 17.0,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(
                        48,
                        48,
                        48,
                        1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  buildDocumentsTable({required List<TransactionDocument> documents}) {
    debugPrint("Documents Length: ${documents.length}");
    debugPrint("Documents: $documents");
    return SizedBox(
      width: double.infinity,
      child: Table(
        border: TableBorder.all(
          color: const Color.fromRGBO(
            48,
            48,
            48,
            0.05,
          ),
          width: 1,
        ),
        children: [
          TableRow(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(
                48,
                48,
                48,
                0.05,
              ),
            ),
            children: [
              getHeadTableCell(
                text: "Document Name",
              ),
              getHeadTableCell(
                text: "Checklist Name",
              ),
              getHeadTableCell(
                text: "Date & Time",
              ),
              getHeadTableCell(
                text: "Status",
              ),
              getHeadTableCell(
                text: "Action",
              ),
            ],
          ),
          ...documents
              .map(
                (e) =>
                TableRow(
                  children: [
                    getBodyTableCell(
                      text: e.title,
                    ),
                    getBodyTableCell(
                      text: e.checkListName,
                    ),
                    getBodyTableCell(
                      text: e.date,
                    ),
                    TableCell(
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 15,
                        ),
                        child: Text(
                          e.status,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w400,
                            backgroundColor: e.status == "Unapproved"
                                ? const Color.fromRGBO(
                              255,
                              0,
                              0,
                              0.5,
                            )
                                : const Color.fromRGBO(
                              213,
                              244,
                              220,
                              1,
                            ),
                            color: e.status == "Unapproved"
                                ? const Color.fromRGBO(
                              255,
                              0,
                              0,
                              1,
                            )
                                : const Color.fromRGBO(
                              32,
                              135,
                              56,
                              1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: IconButton(
                        onPressed: () async {
                          try {
                            if (await canLaunchUrl(Uri.parse(e.url))) {
                              await launchUrl(
                                Uri.parse(e.url),
                                mode: LaunchMode.externalApplication,
                              );
                            }
                          } catch (e) {
                            debugPrint("Cannot launch url");
                          }
                        },
                        icon: const Icon(
                          Icons.remove_red_eye_outlined,
                          color: Color.fromRGBO(
                            35,
                            97,
                            219,
                            1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
          )
              .toList(),
        ],
      ),
    );
  }

  openPdf(String url, BuildContext context) async {
    if (MediaQuery
        .of(context)
        .size
        .width < 400) {
      final res = await http.get(Uri.parse(url));
      final bytes = res.bodyBytes;

      final dir = await getApplicationDocumentsDirectory();

      final file = File("${dir.path}dummyPdf.pdf");
      await file.writeAsBytes(bytes, flush: true);

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>
              Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: true,
                ),
                body: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(
                        48,
                        48,
                        48,
                        0.05,
                      ),
                      width: 1,
                    ),
                  ),
                  child: Text('url'),
                ),
              ),
        ),
      );
    }

    try {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(
          Uri.parse(url),
          mode: LaunchMode.externalApplication,
        );
      }
    } catch (e) {
      debugPrint("Cannot launch url");
    }
  }
}
