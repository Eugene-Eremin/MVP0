module.exports = class UserDto {
    id;
    email;
    phoneNumber;
    isEmailActivated;
    isPhoneNumberActivated;

    constructor(model) {
        this.id = model.id;
        this.email = model.email;
        this.phoneNumber = model.phoneNumber
        this.isEmailActivated = model.emailActivation?.isEmailActivated
        this.isPhoneNumberActivated = model.phoneNumberActivation?.isPhoneNumberActivated
    }
}