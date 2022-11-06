import 'package:csci_project/app/blocs/register_doctor_bloc/doctor_register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class RegisterDoctorPage extends StatefulWidget {
  const RegisterDoctorPage({super.key});

  @override
  State<RegisterDoctorPage> createState() => _RegisterDoctorPageState();
}

class _RegisterDoctorPageState extends State<RegisterDoctorPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorRegisterBloc(),
      child: Scaffold(
        appBar: AppBar(title: Text('doctor registration page')),
        body: SingleChildScrollView(
            child: Column(
          children: [
            _DateOfBirthInput(),
            _IinInput(),
            Row(
              children: [
                Expanded(child: _NameInput()),
                Expanded(child: _MiddlenameInput()),
                Expanded(child: _SurnameInput()),
              ],
            ),
            _ContactNumberInput(),
            _DepartmentIdInput(),
            _SpecializationDetailsIdInput(),
            _ExperienceInput(),
            _DoctorCategoryInput(),
            _PriceOfAppointmentInput(),
            _DegreeInput(),
            _RatingInput(),
            _HomepageUrlInput(),
            _AddressInput(),
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
          context.read<DoctorRegisterBloc>().add(DoctorRegisterEvent.submit());
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
    return BlocBuilder<DoctorRegisterBloc, DoctorRegisterState>(
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
              context.read<DoctorRegisterBloc>().add(DoctorRegisterEvent.dateOfBirthChanged(dateOfBirth: pickedDate));
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
    return BlocBuilder<DoctorRegisterBloc, DoctorRegisterState>(
      buildWhen: (previous, current) => previous.iin != current.iin || previous.showValidationError != current.showValidationError,
      builder: (context, state) {
        return TextField(
          onChanged: (iin) => context.read<DoctorRegisterBloc>().add(DoctorRegisterEvent.iinChanged(iin: iin)),
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
    return BlocBuilder<DoctorRegisterBloc, DoctorRegisterState>(
      buildWhen: (previous, current) => previous.surname != current.surname || previous.showValidationError != current.showValidationError,
      builder: (context, state) {
        return TextField(
          onChanged: (surname) => context.read<DoctorRegisterBloc>().add(DoctorRegisterEvent.surnameChanged(surname: surname)),
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
    return BlocBuilder<DoctorRegisterBloc, DoctorRegisterState>(
      buildWhen: (previous, current) => previous.middlename != current.middlename || previous.showValidationError != current.showValidationError,
      builder: (context, state) {
        return TextField(
          onChanged: (middlename) => context.read<DoctorRegisterBloc>().add(DoctorRegisterEvent.middlenameChanged(middlename: middlename)),
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
    return BlocBuilder<DoctorRegisterBloc, DoctorRegisterState>(
      buildWhen: (previous, current) => previous.name != current.name || previous.showValidationError != current.showValidationError,
      builder: (context, state) {
        return TextField(
          onChanged: (name) => context.read<DoctorRegisterBloc>().add(DoctorRegisterEvent.nameChanged(name: name)),
          decoration: InputDecoration(
            labelText: 'Name',
            errorText: (state.name.invalid && state.showValidationError) ? 'invalid name' : null,
          ),
        );
      },
    );
  }
}

class _DepartmentIdInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorRegisterBloc, DoctorRegisterState>(
      buildWhen: (previous, current) => previous.departmentId != current.departmentId || previous.showValidationError != current.showValidationError,
      builder: (context, state) {
        return TextField(
          onChanged: (departmentId) => context.read<DoctorRegisterBloc>().add(DoctorRegisterEvent.departmentIdChanged(departmentId: departmentId)),
          decoration: InputDecoration(
            labelText: 'departmentId',
            errorText: (state.departmentId.invalid && state.showValidationError) ? 'invalid departmentId' : null,
          ),
        );
      },
    );
  }
}

class _SpecializationDetailsIdInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorRegisterBloc, DoctorRegisterState>(
      buildWhen: (previous, current) =>
          previous.specializationDetailsId != current.specializationDetailsId || previous.showValidationError != current.showValidationError,
      builder: (context, state) {
        return TextField(
          onChanged: (specializationDetailsId) => context
              .read<DoctorRegisterBloc>()
              .add(DoctorRegisterEvent.specializationDetailsIdChanged(specializationDetailsId: specializationDetailsId)),
          decoration: InputDecoration(
            labelText: 'specializationDetailsId',
            errorText: (state.specializationDetailsId.invalid && state.showValidationError) ? 'invalid ${state.departmentId.error}' : null,
          ),
        );
      },
    );
  }
}

class _ExperienceInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorRegisterBloc, DoctorRegisterState>(
      buildWhen: (previous, current) =>
          previous.experienceInYears != current.experienceInYears || previous.showValidationError != current.showValidationError,
      builder: (context, state) {
        return TextField(
          onChanged: (experienceInYears) =>
              context.read<DoctorRegisterBloc>().add(DoctorRegisterEvent.experienceInYearChanged(experienceInYears: experienceInYears)),
          decoration: InputDecoration(
            labelText: 'experienceInYears',
            errorText: (state.experienceInYears.invalid && state.showValidationError) ? 'invalid experienceInYears' : null,
          ),
        );
      },
    );
  }
}

class _DoctorCategoryInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorRegisterBloc, DoctorRegisterState>(
      buildWhen: (previous, current) =>
          previous.doctorCategory != current.doctorCategory || previous.showValidationError != current.showValidationError,
      builder: (context, state) {
        return TextField(
          onChanged: (doctorCategory) =>
              context.read<DoctorRegisterBloc>().add(DoctorRegisterEvent.doctorCategoryChanged(doctorCategory: doctorCategory)),
          decoration: InputDecoration(
            labelText: 'doctorCategory',
            errorText: (state.doctorCategory.invalid && state.showValidationError) ? 'invalid doctorCategory' : null,
          ),
        );
      },
    );
  }
}

class _DegreeInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorRegisterBloc, DoctorRegisterState>(
      buildWhen: (previous, current) => previous.degree != current.degree || previous.showValidationError != current.showValidationError,
      builder: (context, state) {
        return TextField(
          onChanged: (degree) => context.read<DoctorRegisterBloc>().add(DoctorRegisterEvent.degreeChanged(degree: degree)),
          decoration: InputDecoration(
            labelText: 'degree',
            errorText: (state.degree.invalid && state.showValidationError) ? 'invalid degree' : null,
          ),
        );
      },
    );
  }
}

class _RatingInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorRegisterBloc, DoctorRegisterState>(
      buildWhen: (previous, current) => previous.rating != current.rating || previous.showValidationError != current.showValidationError,
      builder: (context, state) {
        return TextField(
          onChanged: (rating) => context.read<DoctorRegisterBloc>().add(DoctorRegisterEvent.ratingChanged(rating: rating)),
          decoration: InputDecoration(
            labelText: 'rating',
            errorText: (state.rating.invalid && state.showValidationError) ? 'invalid rating' : null,
          ),
        );
      },
    );
  }
}

class _PriceOfAppointmentInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorRegisterBloc, DoctorRegisterState>(
      buildWhen: (previous, current) =>
          previous.priceOfAppointment != current.priceOfAppointment || previous.showValidationError != current.showValidationError,
      builder: (context, state) {
        return TextField(
          onChanged: (priceOfAppointment) =>
              context.read<DoctorRegisterBloc>().add(DoctorRegisterEvent.priceOfAppointmentChanged(priceOfAppointment: priceOfAppointment)),
          decoration: InputDecoration(
            labelText: 'priceOfAppointment',
            errorText: (state.priceOfAppointment.invalid && state.showValidationError) ? 'invalid priceOfAppointment' : null,
          ),
        );
      },
    );
  }
}

class _HomepageUrlInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorRegisterBloc, DoctorRegisterState>(
      buildWhen: (previous, current) => previous.homepageUrl != current.homepageUrl || previous.showValidationError != current.showValidationError,
      builder: (context, state) {
        bool isHomepageUrlInvalid = state.homepageUrl != null ? state.homepageUrl!.invalid : false;
        return TextField(
          onChanged: (homepageUrl) => context.read<DoctorRegisterBloc>().add(DoctorRegisterEvent.homepageUrlChanged(homepageUrl: homepageUrl)),
          decoration: InputDecoration(
            labelText: 'homepageUrl',
            errorText: (isHomepageUrlInvalid && state.showValidationError) ? 'invalid ' : null,
          ),
        );
      },
    );
  }
}

class _ContactNumberInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorRegisterBloc, DoctorRegisterState>(
      buildWhen: (previous, current) =>
          previous.contactNumber != current.contactNumber || previous.showValidationError != current.showValidationError,
      builder: (context, state) {
        return TextField(
          onChanged: (contactNumber) =>
              context.read<DoctorRegisterBloc>().add(DoctorRegisterEvent.contactNumberChanged(contactNumber: contactNumber.replaceAll(' ', ''))),
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

class _AddressInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorRegisterBloc, DoctorRegisterState>(
      buildWhen: (previous, current) => previous.address != current.address || previous.showValidationError != current.showValidationError,
      builder: (context, state) {
        return TextField(
          onChanged: (address) => context.read<DoctorRegisterBloc>().add(DoctorRegisterEvent.addressChanged(address: address)),
          decoration: InputDecoration(
            labelText: 'address',
            errorText: (state.address.invalid && state.showValidationError) ? 'invalid address' : null,
          ),
        );
      },
    );
  }
}
