function ShowPassword_Click()
{
    document.getElementById('showEye').style.display = "";
    document.getElementById('hiddenEye').style.display = "none";
    let PasswordBox = document.getElementById("lblAllPassword");

    if (PasswordBox.type === "password")
        PasswordBox.type = "text";
    else
    {
        PasswordBox.type = "password";
        document.getElementById('hiddenEye').style.display = "";
        document.getElementById('showEye').style.display = "none";
    }
}

function ShowConfirmPassword_Click()
{
    document.getElementById('showEyeConfirm').style.display = "";
    document.getElementById('hiddenEyeConfirm').style.display = "none";
    let PasswordBox = document.getElementById("lblAllConfirmPassword");

    if (PasswordBox.type === "password")
        PasswordBox.type = "text";
    else
    {
        PasswordBox.type = "password";
        document.getElementById('hiddenEyeConfirm').style.display = "";
        document.getElementById('showEyeConfirm').style.display = "none";
    }
}

