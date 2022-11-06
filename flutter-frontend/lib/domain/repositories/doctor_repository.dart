import 'package:csci_project/data/api_endpoints.dart';
import 'package:csci_project/data/network_client.dart';
import 'package:csci_project/domain/models/doctor.dart';

import 'package:intl/intl.dart';

class DoctorRepository {
  final _client = NetworkClient();

  Future<void> registerDoctor({required Doctor doctor}) async {
    try {
      await _client.post(path: ApiEndpoints.addDoctor, parser: (json) => json, body: {
        // 'id': int.parse(doctor.id),
        'iIN': int.parse(doctor.iin),
        'doB': DateFormat('yyyy-MM-dd').format(doctor.dateOfBirth),
        'firstName': doctor.name,
        'surname': doctor.surname,
        'middleName': doctor.middlename,
        'contactNumber': doctor.contactNumber,
        //TODO: pomeniat po backend
        'departmentId': doctor.departmentId,
        'specializationId': doctor.specializationDetailsId,
        'experience': int.tryParse(doctor.experienceInYears),
        'category': doctor.doctorCategory,
        'price': int.tryParse(doctor.priceOfAppointment),
        'degree': doctor.degree,
        'rating': 5.5, //double.tryParse(doctor.rating),
        'address': doctor.address,
        'url': doctor.homepageUrl
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Doctor>> getDoctors({required int page, required int perPage}) async {
    List<Doctor> doctors = [];
    try {
      await _client.get(
          path: ApiEndpoints.getPatients,
          parser: (dynamic jsonList) {
            print('asdf');
            for (final doc in jsonList) {
              doctors.add(Doctor.fromJson(doc));
            }
          },
          parameters: {'page': page.toString(), 'perPage': perPage.toString()});
      print(doctors);
      return doctors;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateDoctor({required Doctor updatedDoctor}) async {}
}
