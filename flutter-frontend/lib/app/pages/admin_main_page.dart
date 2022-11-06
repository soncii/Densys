import 'package:csci_project/app/blocs/patient_search_bloc/patient_search_bloc.dart';
import 'package:csci_project/app/pages/listview_page.dart';
import 'package:csci_project/domain/repositories/patient_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AdminMainPage extends StatefulWidget {
  const AdminMainPage({super.key});

  @override
  State<AdminMainPage> createState() => _AdminMainPageState();
}

class _AdminMainPageState extends State<AdminMainPage> {
  final patientRepo = PatientRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PatientSearchBloc(),
      child: Scaffold(
        appBar: AppBar(title: Text('admin login page')),
        body: Row(
          children: [
            Container(
              width: 200,
              child: ColoredBox(
                color: Colors.red,
                child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                  ElevatedButton(
                      onPressed: () {
                        context.go('/doctor');
                      },
                      child: Text('register doctor')),
                  ElevatedButton(
                      onPressed: () {
                        context.go('/patient');
                      },
                      child: Text('register patient')),
                ]),
              ),
            ),
            Expanded(child: Builder(builder: (context) {
              return Builder(builder: (context) {
                return PaginatedList(searchBloc: context.read<PatientSearchBloc>());
              });
            }))
          ],
        ),
      ),
    );
  }
}
