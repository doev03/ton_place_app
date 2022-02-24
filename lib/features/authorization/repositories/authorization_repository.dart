import 'package:dio/dio.dart';

class AuthorizationRepository {
  final _dio = Dio();

  static const baseUrl = 'https://api.ton.place';

  /*void getAuthData (options, callback) {
    var bot_id = int.parse(options.bot_id);
    if (bot_id == null) {
      throw Exception('Bot id required');
    }
    var xhr = getXHR();
    var url = Telegram.Login.widgetsOrigin + '/auth/get';
    xhr.open('POST', url);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
    xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
    xhr.onreadystatechange = function() {
      if (xhr.readyState == 4) {
        if (typeof xhr.responseBody == 'undefined' && xhr.responseText) {
          try {
            var result = JSON.parse(xhr.responseText);
          } catch(e) {
            var result = {};
          }
          if (result.user) {
            callback(result.origin, result.user);
          } else {
            callback(result.origin, false);
          }
        } else {
          callback('*', false);
        }
      }
    };
    xhr.onerror = function() {
      callback('*', false);
    };
    xhr.withCredentials = true;
    xhr.send('bot_id=' + encodeURIComponent(options.bot_id) + (options.lang ? '&lang=' + encodeURIComponent(options.lang) : ''));
  }*/

  Future<void> get() async {
    const url = 'https://oauth.telegram.org/auth/get';

    try {
      const headers = {
        'origin': 'https://ton.place',
        'referer': 'https://ton.place/',
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'X-Requested-With': 'XMLHttpRequest',
        'cookie': 'stel_ssid=0b98dcce620b5e31fb_2352548248015084180; stel_token=4fcecda4c5267d5b2ddee291112721ec4fcecdb24fcfc0613a817179ee8ef5d4a132d'
      };

      const body = {
        'bot_id': 2141264283,
      };

      final response = await _dio.post(url, data: FormData.fromMap(body), options: Options(headers: headers));

      print(response);
    } catch (e) {
      print(e);
    }
  }

  static const body = {
    'auth_date': 1645230272,
    'first_name': 'Олег',
    'hash': '9d1d9c9d92b40a11ecf1db729174dfb001727a7880b3810fde71ab1c7c12c873',
    'id': 431778623,
    'photo_url': 'https://t.me/i/userpic/320/rbDthYBEulpy-vG6e3ooFzqH6MvDm1aIjn_ncXUI7io.jpg',
    'username': 'doev03',
  };

  Future<void> auth() async {
    try {
      const url = '$baseUrl/main/init';
      const device = 'chrome_1645219502561';
      print(url);
      final phone = '9604069765'.replaceAll(r'/[^0-9]/g', '').trim();

      const headers = {
        'Authorization': 'chyw8DmuoTOdA3sIyR0v6wJxZc3zStpltTdIYy1C4aWkcPaNbZtZ3DPrR7SsxYl7',
      };

      final body = {
        'phoneCode': '+7',
        'phone': phone,
      };

      final response = await _dio.get(url, options: Options(headers: headers));

      print(response);
    } catch (e) {
      print(e);
    }
  }
}
