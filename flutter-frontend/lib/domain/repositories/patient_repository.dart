import 'package:csci_project/data/api_endpoints.dart';
import 'package:csci_project/data/network_client.dart';
import 'package:csci_project/domain/models/patient.dart';

import 'package:intl/intl.dart';

class PatientRepository {
  final _client = NetworkClient();

  Future<void> registerPatient({required Patient patient}) async {
    try {
      await _client.post(path: ApiEndpoints.addPatient, parser: (json) => json, body: {
        // 'id': int.parse(patient.id.value),
        'iIN': patient.iin,
        'doB': patient.dateOfBirth != null ? DateFormat('yyyy-MM-dd').format(patient.dateOfBirth!) : null,
        'firstName': patient.name,
        'surname': patient.surname,
        'middleName': patient.middlename,
        'bloodGroup': patient.bloodGroup,
        'emergencyContactNumber': patient.emergencyContactNumber,
        'contactNumber': patient.contactNumber,
        'email': patient.email.toString(),
        'address': patient.address,
        'maritalStatus': false,
        'registrationDate': DateFormat('yyyy-MM-dd').format(DateTime.now()),
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Patient>> getPatients({required int page, required int perPage}) async {
    List<Patient> patients = [];
    try {
      await _client.get(
          path: ApiEndpoints.getPatients,
          parser: (dynamic jsonList) {
            print('asdf');
            for (final patient in jsonList) {
              patients.add(Patient.fromJson(patient));
            }
          },
          parameters: {'page': page.toString(), 'perPage': perPage.toString()});
      return patients;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updatePatient({required Patient patient}) async {
    try {
      await _client.put(path: '${ApiEndpoints.updatePatient}/${patient.id}', parser: (json) => json, body: {
        // 'id': int.parse(patient.id.value),
        'iIN': patient.iin,
        'doB': patient.dateOfBirth != null ? DateFormat('yyyy-MM-dd').format(patient.dateOfBirth!) : null,
        'firstName': patient.name,
        'surname': patient.surname,
        'middleName': patient.middlename,
        'bloodGroup': patient.bloodGroup,
        'emergencyContactNumber': patient.emergencyContactNumber,
        'contactNumber': patient.contactNumber,
        'email': patient.email.toString(),
        'address': patient.address,
        'maritalStatus': false,
        'registrationDate': DateFormat('yyyy-MM-dd').format(DateTime.now()),
      });
    } catch (e) {
      rethrow;
    }
  }
}
