import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_document/presentation/bloc/document/document_bloc.dart';
import 'package:my_document/presentation/bloc/document/document_event.dart';
import 'package:my_document/presentation/bloc/document/document_state.dart';
import 'package:my_document/presentation/widgets/tabs.dart';
import 'package:my_document/presentation/widgets/transaction_tab.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../data/models/document.dart';

// DOCUMENT SCREEN -> DESKTOP
class DesktopDocumentScreen extends StatefulWidget {
  const DesktopDocumentScreen({super.key});

  @override
  State<DesktopDocumentScreen> createState() => _DesktopDocumentScreenState();
}

class _DesktopDocumentScreenState extends State<DesktopDocumentScreen> {
  @override
  void initState() {
    BlocProvider.of<DocumentBloc>(context).add(DocumentsInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Documents'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(6, 8, 6, 8),
            child: Container(
              height: 42,
              margin: const EdgeInsets.fromLTRB(2, 2, 20, 2),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.underline),
                borderRadius: BorderRadius.circular(6),
                color: AppColors.white,
              ),
              child: Row(
                children: [
                  Image.asset('assets/profile.png'),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Charlies',
                    style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Image.asset('assets/arrow_down.png'),
                ],
              ),
            ),
          )
        ],
        automaticallyImplyLeading: false,
        toolbarHeight: MediaQuery.of(context).size.width <= 400
            ? MediaQuery.of(context).size.height * 0.06
            : MediaQuery.of(context).size.height * 0.1,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 34, horizontal: 30),
        child: DefaultTabController(
          length: 04,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Text(
                  "Documents",
                  style: GoogleFonts.roboto(
                    fontSize: 24,
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              /// Padding
              const SizedBox(
                height: 30,
              ),

              /// Building the tab bar
              Container(
                width: 750,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.tabBackground,
                ),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.white,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.tab,
                  ),
                  dividerColor: AppColors.transparent,
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
              ),

              /// Padding
              const SizedBox(
                height: 30,
              ),

              /// Building the tab bar view
              Expanded(
                //width: 728,
                child: TabBarView(
                  children: [
                    /// JOINING DOCUMENTS
                    BlocBuilder<DocumentBloc, DocumentState>(
                      builder: (context, state) {
                        if (state is DocumentsFetchedState) {
                          return buildTabs(documents: DocumentsData.joining);
                        }
                        return buildTabs(documents: DocumentsData.joining);
                      },
                    ),

                    /// TRANSACTION DOCUMENTS
                    BlocBuilder<DocumentBloc, DocumentState>(
                      builder: (context, state) {
                        if (state is DocumentsFetchedState) {
                          return BuildTransactionTab(
                            transactions: DocumentsData.transactions,
                          );
                        }
                        return BuildTransactionTab(
                            transactions: DocumentsData.transactions);
                      },
                    ),

                    /// TEAM DOCUMENTS
                    BlocBuilder<DocumentBloc, DocumentState>(
                      builder: (context, state) {
                        if (state is DocumentsFetchedState) {
                          return buildTabs(documents: DocumentsData.team);
                        }
                        return buildTabs(documents: DocumentsData.team);
                      },
                    ),

                    /// TAX DOCUMENTS
                    BlocBuilder<DocumentBloc, DocumentState>(
                      builder: (context, state) {
                        if (state is DocumentsFetchedState) {
                          return buildTabs(documents: DocumentsData.tax);
                        }
                        return buildTabs(documents: DocumentsData.tax);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
