
function toggleCheckCrop() {

    let NurseryGrownNumberField = document.getElementById("Nursery_Grown_Number");
    let NurseryGrownMeasurement = document.getElementById("Nursery_Grown_Measurement");
    // let PlantedDate = document.getElementById("Planted_Date");
    let CropPhoto = document.getElementById("Crop_Photo");
    let SelectedCropPhoto = document.getElementById("Selected_Crop_Photo");

    if(document.getElementById("myCheckbox").checked === true){
        // console.log('true');
        NurseryGrownNumberField.style.display = "block";
        NurseryGrownMeasurement.style.display = "block";
        // PlantedDate.style.display = "block";
        CropPhoto.style.display = "block";
        SelectedCropPhoto.style.display = "block";
    } else {
        // console.log('false');
        NurseryGrownNumberField.style.display = "none";
        NurseryGrownMeasurement.style.display = "none";
        // PlantedDate.style.display = "none";
        CropPhoto.style.display = "none";
        SelectedCropPhoto.style.display = "none";
    }
}

function toggleCheckLand() {

    let LandAddress = document.getElementById("Land_Address");
    let LandType = document.getElementById("Land_Type");
    let OwnershipState = document.getElementById("Ownership_State");
    let Province = document.getElementById("Province");
    let District = document.getElementById("District");
    let GnDivision = document.getElementById("Gn_Division");
    let LandPhoto = document.getElementById("Land_Photo");
    let SelectedLandPhoto = document.getElementById("Selected_Land_Photo");

    if(document.getElementById("myCheckbox").checked === true){
        // console.log('true');
        LandAddress.style.display = "block";
        LandType.style.display = "block";
        OwnershipState.style.display = "block";
        Province.style.display = "block";
        District.style.display = "block";
        GnDivision.style.display = "block";
        LandPhoto.style.display = "block";
        SelectedLandPhoto.style.display = "block";
    } else {
        // console.log('false');
        LandAddress.style.display = "none";
        LandType.style.display = "none";
        OwnershipState.style.display = "none";
        Province.style.display = "none";
        District.style.display = "none";
        GnDivision.style.display = "none";
        LandPhoto.style.display = "none";
        SelectedLandPhoto.style.display = "none";
    }
}

//--show and hide crop-add, crop-update > nursery-time fields
function Show(value) {
    console.log(value);

    var NurseryGrownNumberField = document.getElementById("Nursery_Grown_Number");
    var NurseryGrownMeasurement = document.getElementById("Nursery_Grown_Measurement");

    if (value == "Yes") {

        NurseryGrownNumberField.style.display = "block";
        NurseryGrownMeasurement.style.display = "block";

    } else if (value == "No") {

        NurseryGrownNumberField.style.display = "none";
        NurseryGrownMeasurement.style.display = "none";

    }
}

//--show and hide password
function ShowPassword_Click() {
    document.getElementById('showEye').style.display = "";
    document.getElementById('hiddenEye').style.display = "none";

    let PasswordBox = document.getElementById("loginPassWord");

    if (PasswordBox.type === "password")
        PasswordBox.type = "text";
    else {
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

//--show and hide 'back-to-top' element on page scroll
window.onscroll = function () {
    if(document.getElementById('backToTop') == null){

    }
    else {
        let btt = document.getElementById('backToTop');
        if (pageYOffset >= 1000) {
            btt.style.visibility = 'visible';
        } else {
            btt.style.visibility = 'hidden';
        }
    }
};

//--refine url
function refineUrl(url) {
    let refUrl = url.split('?')[0];
    return refUrl;
}

//image preview
function ReadUrl(input) {
    if (input.files && input.files[0]) {
        let reader = new FileReader();
        reader.onload = function (e) {
            document.getElementById('photo_preview').src = e.target.result;
        };
        reader.readAsDataURL(input.files[0]);
    }
}


