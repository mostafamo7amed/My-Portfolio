import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'contact_state.dart';


class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactInitial());


  Future<void> sendMessageToEmail({
    required String name,
    required String email,
    required String message,
  }) async {
    emit(ContactLoading());
    const serviceId = 'service_3xho43p';
    const templateId = 'template_hua9fe7';
    const userId = '7F0fyVqMDHM2uR2Xu';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'name': name,
          'email': email,
          'message': message,
          'title': 'Portfolio Visitor',
        }
      }),
    );

    if (response.statusCode == 200) {
      emit(ContactSuccess());
    } else {
      emit(ContactError());
      throw Exception('Email sending failed');
    }
  }
}
