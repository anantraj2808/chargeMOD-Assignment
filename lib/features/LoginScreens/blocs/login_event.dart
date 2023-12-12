class LoginEvent{}

class SendOTPEvent extends LoginEvent{
  String phoneNumber;
  SendOTPEvent({required this.phoneNumber});
}

