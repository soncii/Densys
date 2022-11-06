import 'package:csci_project/app/blocs/modify_patient_bloc/modify_patient_bloc.dart';
import 'package:csci_project/app/blocs/patient_search_bloc/patient_search_bloc.dart';
import 'package:csci_project/domain/models/patient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'dart:math' as math;

class PaginatedList extends StatefulWidget {
  const PaginatedList({Key? key, required this.searchBloc}) : super(key: key);

  final PatientSearchBloc searchBloc;

  @override
  _PaginatedListState createState() => _PaginatedListState();
}

class _PaginatedListState extends State<PaginatedList> {
  List<Patient> patientsNewBatch = [];

  final PagingController<int, Patient> _pagingController = PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();

    _pagingController.addPageRequestListener(
      (pageKey) => widget.searchBloc.add(PatientSearchEvent.fetch()),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.searchBloc.close();
    _pagingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PatientSearchBloc>.value(
      value: widget.searchBloc, // BlocProvider.of<BlocA>(context),
      // create: (context) => widget.searchBloc,
      child: BlocListener<PatientSearchBloc, PatientSearchState>(
        listener: (context, state) {
          if (state.status == PatientSearchStatus.success) {
            print('state page = ${state.page}');
            print('LIST ${state.patientsList}');
            patientsNewBatch = state.patientsList.sublist((state.page - 1) * 2);
            print(patientsNewBatch);

            if (state.hasReachedMax) {
              _pagingController.appendLastPage(patientsNewBatch);
            } else {
              _pagingController.appendPage(patientsNewBatch, state.page * 2);
            }
          }
          if (state.status == PatientSearchStatus.initial) {
            widget.searchBloc.add(PatientSearchEvent.fetch());
          }
          if (state.status == PatientSearchStatus.failure) {
            _pagingController.error = 'Error asdf;lj';
          }
        },
        child: BlocBuilder<PatientSearchBloc, PatientSearchState>(
          builder: (context, state) => CustomScrollView(slivers: [
            PagedSliverList<int, Patient>(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<Patient>(
                  itemBuilder: (context, patient, index) => Container(
                        height: 300,
                        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
                        child: Column(
                          children: [
                            Text('name: ${patient.name.toString()}'),
                            Text('id: ${patient.id.toString()}'),
                            Text('iin: ${patient.iin.toString()}'),
                            Text('name: ${patient.name.toString()}'),
                            Text('surname: ${patient.surname.toString()}'),
                            Text('middlename: ${patient.middlename.toString()}'),
                            Text('bloodGroup: ${patient.bloodGroup.toString()}'),
                            Text('emergencyContactNumber: ${patient.emergencyContactNumber.toString()}'),
                            Text('contactNumber: ${patient.contactNumber.toString()}'),
                            Text('email: ${patient.email.toString()}'),
                            Text('address: ${patient.address.toString()}'),
                            Text('maritalStatus: ${patient.maritalStatus.toString()}'),
                            ElevatedButton(
                                onPressed: () {
                                  context.go('/modify', extra: patient);
                                },
                                child: Text('modify'))
                          ],
                        ),
                      )),
            ),
          ]),
        ),
      ),
    );
  }
}
