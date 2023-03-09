module.exports = class UserDto {
    id;
    email;
    phoneNumber;
    isEmailActivated;
    isPhoneNumberActivated;
    groups;

    constructor(model, model2) {
        this.id = model.id;
        this.email = model.email;
        this.phoneNumber = model.phoneNumber
        this.isEmailActivated = model.emailActivation?.isEmailActivated
        this.isPhoneNumberActivated = model.phoneNumberActivation?.isPhoneNumberActivated
        this.groups = model2
    }
}