import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const VoiceLines());

class VoiceLines extends StatefulWidget {
  const VoiceLines({super.key});

  @override
  _VoiceLinesState createState() => _VoiceLinesState();
}

class _VoiceLinesState extends State<VoiceLines> {
  bool isEnglish = true;

  Widget _buildAvatarButton(String imagePath, String audioFileEn, String audioFileJp) {
    return TextButton(
      onPressed: () {
        final player = AudioPlayer();
        player.play(AssetSource(isEnglish ? audioFileEn : audioFileJp));
      },
      child: CircleAvatar(
        backgroundImage: AssetImage(imagePath),
        radius: 60.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF14213D),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildAvatarButton('assets/avatar1.jpg', 'audio1_en.wav', 'audio1_jp.wav'),
                  const SizedBox(width: 20),
                  _buildAvatarButton('assets/avatar2.jpg', 'audio2_en.wav', 'audio2_jp.wav'),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildAvatarButton('assets/avatar3.jpg', 'audio3_en.wav', 'audio3_jp.wav'),
                  const SizedBox(width: 20),
                  _buildAvatarButton('assets/avatar4.jpg', 'audio4_en.wav', 'audio4_jp.wav'),
                ],
              ),
              const SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isEnglish = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isEnglish ? Colors.blue : Colors.grey,
                    ),
                    child: const Text('EN'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isEnglish = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isEnglish ? Colors.grey : Colors.blue,
                    ),
                    child: const Text('JP'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
