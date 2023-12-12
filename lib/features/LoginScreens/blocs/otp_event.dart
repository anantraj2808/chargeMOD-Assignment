class OTPEvent{}

class VerifyOTPEvent extends OTPEvent{
  String otp;
  String phoneNumber;
  VerifyOTPEvent({required this.otp, required this.phoneNumber});
}

class ResendOTPEvent extends OTPEvent{
  String phoneNumber;
  ResendOTPEvent({required this.phoneNumber});
}