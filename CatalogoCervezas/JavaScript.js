function validateFormOnSubmit(Form_validate) {
    var error_message = "";
    // Different Functions for validation of different input
    error_message = validUsername(Form_validate.username);
    error_message = validPassword(Form_validate.psd);
    error_message = validEmail(Form_validate.email);
    error_message = validPhone(Form_validate.phone);
    error_message = validEmpty(Form_validate.from);
    if (error_message != "") {
        alert("Some fields have invalid entry :\n" + error_message);
        return false;
    }
    return true;
}

function validEmpty(fd) {
    var error = "";
    if (fd.value.length == 0) // Condition is checked if field is left blank
    {
        fd.style.background = 'Red';
        error = "The required field is empty.\n" //error message is displayed if field is blank
    }
    else {
        fd.style.background = 'White';
    }
    return error;
}

function validUsername(fd) {
    var error = "";
    var illegalChars = /\W/; // No special Characters allowed
    if (fd.value == "") {
        fd.style.background = 'Red';
        error = "Field is left Blank.\n";
    }
    else if ((fd.value.length < 5) || (fd.value.length > 15)) // Number of Character entered is checked
    {
        fd.style.background = 'Red';
        error = "Username is should be in a range of 5 and 15..\n";
    }
    else if (illegalChars.test(fd.value)) // check for illegal characters
    {
        fd.style.background = 'Red';
        error = "Illegal Characters not allowed\n";
    }
    else {
        fd.style.background = 'White';
    }
    return error;
}

function validPassword(fd) {
    var error = "";
    var illegalChars = /[\W_]/; // Numbers and letter only
    if (fd.value == "") {
        fd.style.background = 'Red';
        error = "Field Cannot be blank.\n";
    }
    else if ((fd.value.length < 7) || (fd.value.length > 15)) // Checks length of the password
    {
        error = "Length should be in Range of 7 to 15. \n";
        fd.style.background = 'Red';
    }
    else if (illegalChars.test(fd.value)) {
        error = "Illegal characters not allowed.\n";
        fd.style.background = 'Red';
    }
    else if (!((fd.value.search(/(a-z)+/)) && (fd.value.search(/(0-9)+/)))) // Checks for numeric value  in entered password
    {
        error = "Atleast one Numeric value Required ";
        fd.style.background = 'Red';
    }
    else {
        fd.style.background = 'White';
    }
    return error;
}

function trim(s) // Trims spaces
{
    return s.replace(/^\s+|\s+$/, '');
}
function validEmail(fd) {
    var error = "";
    var tfd = trim(fd.value);                        // Calling the trim Function
    var email_filter = /^[^@]+@[^@.]+\.[^@]*\w\w$/; // Valid Email address Regular Expression
    var illegalChars = /[\(\)\<\>\,\;\:\\\"\[\]]/; // Invalid input for the email address
    if (fd.value == "") {
        fd.style.background = 'Red';
        error = "Field Cannot be Blank.\n";
    }
    else if (!email_Filter.test(tfd)) //Illegal Characters check
    {
        fd.style.background = 'Red';
        error = "Enter valid Email \n";
    }
    else if (fd.value.match(illegalChars)) // Checks for illegal characters
    {
        fd.style.background = 'Red';
        error = "Illegal Characters Present.\n";
    }
    else {
        fd.style.background = 'White';
    }
    return error;
}

function validPhone(fd) {
    var error_message = "";
    var strip = fd.value.replace(/[\(\)\.\-\ ]/g, '');   //Regular expression for illegal character check
    if (fd.value == "") {
        error_message = "Field cannot be Blank.Enter a phone number.\n";
        fd.style.background = 'Red';
    }
    else if (isNaN(parseInt(strip))) {
        error_message = " Illegal characters cannot be Present.\n";
        fd.style.background = 'Red';
    }
    else if (!(strip.length == 10)) {
        error = "Enter the valid Phone Number.\n";
        fd.style.background = 'Red';
    }
    return error;
}