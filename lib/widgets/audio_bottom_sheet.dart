import 'package:einstien_academy_flutter/widgets/audio_player_bottom_modal_sheet.dart';
import 'package:flutter/material.dart';

void settingModalBottomSheet(context,String url) {
  showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext bc) {
        return AudioPlayerBottomModalSheet(url: url,);
      });
}