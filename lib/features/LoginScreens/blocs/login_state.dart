class LoginState{}

class LoginActionState extends LoginState{}

class LoginInitialState extends LoginState{}

class SendingOTPState extends LoginState{}

class OTPSentSuccessfullyState extends LoginActionState{}

class OTPSendingFailedState extends LoginActionState{}