import 'package:danny_zoom/resources/auth_methods.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:ji';

class JitsiMeetMethods {
  final AuthMethods _authMethods = AuthMethods();
  void createNewMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
  }) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p

      var options = JitsiMeetingOptions(
        roomNameOrUrl: roomName,
        userDisplayName: _authMethods.user.displayName,
        userEmail: _authMethods.user.email,
        userAvatarUrl: _authMethods.user.photoURL,
        isAudioMuted: isAudioMuted,
        isVideoMuted: isVideoMuted,
      );

      await JitsiMeetWrapper.joinMeeting(options);
    } catch (error) {
      print("error: $error");
    }
  }
}
