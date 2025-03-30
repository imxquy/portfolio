//check if Name is not empty, Phone Number is exactly 10 digits, Address is at least 10 characters long.
function validateOrder() {
    let name = document.getElementById("name").value;
    let phone = document.getElementById("phone").value;
    let address = document.getElementById("address").value;
    let nameError = document.getElementById("nameError");
    let phoneError = document.getElementById("phoneError");
    let addressError = document.getElementById("addressError");
    let isValid = true;

    // Reset error messages
    nameError.innerText = "";
    phoneError.innerText = "";
    addressError.innerText = "";

    // Name validation
    if (name.trim() === "") {
        nameError.innerText = "Name cannot be empty!";
        isValid = false;
    }

    // Phone number validation (must be 10 digits)
    let phonePattern = /^[0-9]{10}$/;
    if (!phonePattern.test(phone)) {
        phoneError.innerText = "Phone number must be 10 digits!";
        isValid = false;
    }

    // Address validation (minimum 10 characters)
    if (address.length < 10) {
        addressError.innerText = "Address must be at least 10 characters!";
        isValid = false;
    }

    return isValid; // Prevent form submission if validation fails
}
