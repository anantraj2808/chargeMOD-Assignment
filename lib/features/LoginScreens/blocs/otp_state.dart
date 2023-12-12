class OTPState{}

class OTPActionState extends OTPState{}

class OTPInitialState extends OTPState{}

class VerifyingOTPState extends OTPState{}

class OTPVerifiedSuccessfullyState extends OTPActionState{}

class OTPVerificationFailedState extends OTPActionState{}

class NavigateToHomeState extends OTPActionState{}

class NavigateToProfileDetailsState extends OTPActionState{}



class ResendingOTPState extends OTPState{}

class OTPResentSuccessfullyState extends OTPActionState{}

class OTPResendingFailedState extends OTPActionState{}

