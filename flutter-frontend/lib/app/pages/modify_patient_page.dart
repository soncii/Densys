import 'package:csci_project/app/blocs/modify_patient_bloc/modify_patient_bloc.dart';
import 'package:csci_project/domain/models/patient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ModifyPatientPage extends StatefulWidget {
  const ModifyPatientPage({super.key, required this.oldData});

  final Patient oldData;

  @override
  State<ModifyPatientPage> createState() => _ModifyPatientPageState();
}

class _ModifyPatientPageState extends State<ModifyPatientPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final asdf = ModifyPatientBloc(oldPatient: widget.oldData);

        return asdf;
      },
      child: Scaffold(
        appBar: AppBar(title: Text('admin patient page')),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Text('old DATA ID : ${widget.oldData.id}'),
            _DateOfBirthInput(),
            _IinInput(),
            Row(
              children: [
                Expanded(child: _NameInput()),
                Expanded(child: _MiddlenameInput()),
                Expanded(child: _SurnameInput()),
              ],
            ),
            // _IdInput(),
            _BloodGroupInput(),
            _EmergencyContactNumberInput(),
            _ContactNumberInput(),
            _EmailInput(),
            _AddressInput(),
            _MaritalStatusInput(),
            _SubmitButton()
          ],
        )),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          context.read<ModifyPatientBloc>().add(ModifyPatientEvent.submit());
        },
        child: Text('register this mf'));
  }
}

class _DateOfBirthInput extends StatefulWidget {
  @override
  State<_DateOfBirthInput> createState() => _DateOfBirthInputState();
}

class _DateOfBirthInputState extends State<_DateOfBirthInput> {
  TextEditingController dateinput = TextEditingController();

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModifyPatientBloc, ModifyPatientState>(
      buildWhen: (previous, current) => previous.dateOfBirth != current.dateOfBirth,
      builder: (context, state) {
        return TextField(
          controller: dateinput,
          decoration: InputDecoration(icon: Icon(Icons.calendar_today), labelText: "Enter Date"),
          readOnly: true,
          onTap: () async {
            DateTime? pickedDate =
                await showDatePicker(context: context, initialDate: DateTime(2002, 05, 27), firstDate: DateTime(1920), lastDate: DateTime.now());

            if (pickedDate != null) {
              String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
              context.read<ModifyPatientBloc>().add(ModifyPatientEvent.dateOfBirthChanged(dateOfBirth: pickedDate));
              setState(() {
                dateinput.text = formattedDate;
              });
            }
          },
        );
      },
    );
  }
}

class _IinInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModifyPatientBloc, ModifyPatientState>(
      buildWhen: (previous, current) => previous.iin != current.iin || previous.showValidationError != current.showValidationError,
      builder: (context, state) {
        return TextField(
          onChanged: (iin) => context.read<ModifyPatientBloc>().add(ModifyPatientEvent.iinChanged(iin: iin)),
          decoration: InputDecoration(
            labelText: 'IIN',
            errorText: (state.iin.invalid && state.showValidationError) ? state.iin.error.toString() : null,
          ),
        );
      },
    );
  }
}

class _SurnameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModifyPatientBloc, ModifyPatientState>(
      buildWhen: (previous, current) => previous.surname != current.surname || previous.showValidationError != current.showValidationError,
      builder: (context, state) {
        return TextField(
          onChanged: (surname) => context.read<ModifyPatientBloc>().add(ModifyPatientEvent.surnameChanged(surname: surname)),
          decoration: InputDecoration(
            labelText: 'surname',
            errorText: (state.surname.invalid && state.showValidationError) ? 'invalid surname' : null,
          ),
        );
      },
    );
  }
}

class _MiddlenameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModifyPatientBloc, ModifyPatientState>(
      buildWhen: (previous, current) => previous.middlename != current.middlename || previous.showValidationError != current.showValidationError,
      builder: (context, state) {
        return TextField(
          onChanged: (middlename) => context.read<ModifyPatientBloc>().add(ModifyPatientEvent.middlenameChanged(middlename: middlename)),
          decoration: InputDecoration(
            labelText: 'middlename',
            errorText: (state.middlename.invalid && state.showValidationError) ? 'invalid middlename' : null,
          ),
        );
      },
    );
  }
}

class _NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModifyPatientBloc, ModifyPatientState>(
      buildWhen: (previous, current) => previous.name != current.name || previous.showValidationError != current.showValidationError,
      builder: (context, state) {
        return TextField(
          onChanged: (name) => context.read<ModifyPatientBloc>().add(ModifyPatientEvent.nameChanged(name: name)),
          decoration: InputDecoration(
            labelText: 'Name',
            errorText: (state.name.invalid && state.showValidationError) ? 'invalid name' : null,
          ),
        );
      },
    );
  }
}

class _BloodGroupInput extends StatefulWidget {
  @override
  State<_BloodGroupInput> createState() => _BloodGroupInputState();
}

class _BloodGroupInputState extends State<_BloodGroupInput> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModifyPatientBloc, ModifyPatientState>(
      buildWhen: (previous, current) => previous.bloodGroup != current.bloodGroup || previous.showValidationError != current.showValidationError,
      builder: (context, state) {
        return DropdownButton<String>(
            hint: Text('Blood group'),
            value: dropdownValue,
            items: [
              DropdownMenuItem<String>(child: Text('1+'), value: '1+'),
              DropdownMenuItem<String>(child: Text('1-'), value: '1-'),
              DropdownMenuItem<String>(child: Text('2+'), value: '2+'),
              DropdownMenuItem<String>(child: Text('2-'), value: '2-'),
              DropdownMenuItem<String>(child: Text('3+'), value: '3+'),
              DropdownMenuItem<String>(child: Text('3-'), value: '3-'),
              DropdownMenuItem<String>(child: Text('4+'), value: '4+'),
              DropdownMenuItem<String>(child: Text('4-'), value: '4-'),
            ],
            onChanged: (bloodGroup) {
              setState(() {
                dropdownValue = bloodGroup;
              });
              context.read<ModifyPatientBloc>().add(ModifyPatientEvent.bloodGroupChanged(bloodGroup: bloodGroup ?? '1'));
            });
      },
    );
  }
}

class _EmergencyContactNumberInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModifyPatientBloc, ModifyPatientState>(
      buildWhen: (previous, current) =>
          previous.emergencyContactNumber != current.emergencyContactNumber || previous.showValidationError != current.showValidationError,
      builder: (context, state) {
        return TextField(
          onChanged: (emergencyContactNumber) => context
              .read<ModifyPatientBloc>()
              .add(ModifyPatientEvent.emergencyContactNumberChanged(emergencyContactNumber: emergencyContactNumber.replaceAll(' ', ''))),
          decoration: InputDecoration(
            hintText: '+7 777 777 7777 or 8 777 777 7777',
            labelText: 'emergencyContactNumber',
            errorText: (state.emergencyContactNumber.invalid && state.showValidationError) ? 'invalid ${state.emergencyContactNumber.error}' : null,
          ),
        );
      },
    );
  }
}

class _ContactNumberInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModifyPatientBloc, ModifyPatientState>(
      buildWhen: (previous, current) =>
          previous.contactNumber != current.contactNumber || previous.showValidationError != current.showValidationError,
      builder: (context, state) {
        return TextField(
          onChanged: (contactNumber) =>
              context.read<ModifyPatientBloc>().add(ModifyPatientEvent.contactNumberChanged(contactNumber: contactNumber.replaceAll(' ', ''))),
          decoration: InputDecoration(
            hintText: '+7 777 777 7777 or 8 777 777 7777',
            labelText: 'contactNumber',
            errorText: (state.contactNumber.invalid && state.showValidationError) ? 'invalid contactNumber' : null,
          ),
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModifyPatientBloc, ModifyPatientState>(
      buildWhen: (previous, current) => previous.email != current.email || previous.showValidationError != current.showValidationError,
      builder: (context, state) {
        bool isEmailInvalid = state.email != null ? state.email!.invalid : false;

        return TextField(
          onChanged: (email) => context.read<ModifyPatientBloc>().add(ModifyPatientEvent.emailChanged(email: email)),
          decoration: InputDecoration(
            labelText: 'email (optional)',
            errorText: (isEmailInvalid && state.showValidationError) ? 'invalid email' : null,
          ),
        );
      },
    );
  }
}

class _AddressInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModifyPatientBloc, ModifyPatientState>(
      buildWhen: (previous, current) => previous.address != current.address || previous.showValidationError != current.showValidationError,
      builder: (context, state) {
        return TextField(
          onChanged: (address) => context.read<ModifyPatientBloc>().add(ModifyPatientEvent.addressChanged(address: address)),
          decoration: InputDecoration(
            labelText: 'address',
            errorText: (state.address.invalid && state.showValidationError) ? 'invalid address' : null,
          ),
        );
      },
    );
  }
}

class _MaritalStatusInput extends StatefulWidget {
  @override
  State<_MaritalStatusInput> createState() => _MaritalStatusInputState();
}

class _MaritalStatusInputState extends State<_MaritalStatusInput> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModifyPatientBloc, ModifyPatientState>(
      buildWhen: (previous, current) =>
          previous.maritalStatus != current.maritalStatus || previous.showValidationError != current.showValidationError,
      builder: (context, state) {
        return DropdownButton<String>(
            hint: Text('Marital Status'),
            value: dropdownValue,
            items: [
              DropdownMenuItem<String>(child: Text('single'), value: 'single'),
              DropdownMenuItem<String>(child: Text('married'), value: 'married'),
              DropdownMenuItem<String>(child: Text('divorced'), value: 'divorced'),
              DropdownMenuItem<String>(child: Text('widowed'), value: 'widowed'),
            ],
            onChanged: (maritalStatus) {
              setState(() {
                dropdownValue = maritalStatus;
              });
              context.read<ModifyPatientBloc>().add(ModifyPatientEvent.maritalStatusChanged(maritalStatus: maritalStatus ?? ''));
            });
      },
    );
  }
}
