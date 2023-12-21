function setLanguage(lan){
    if(lan=="Sinhala"){
        localStorage.setItem('language', "Sinhala")
        console.log(localStorage.getItem('language'));
    }else if(lan=="English"){
        localStorage.setItem('language', "English")
        console.log(localStorage.getItem('language'));
    }else if(lan=="Tamil"){
        localStorage.setItem('language', "Tamil")
        console.log(localStorage.getItem('language'));
    }
}

function getLanguage(){

    return localStorage.getItem('language')
}



function ToggleLanguageSinhala()
{
console.log("kkkkhhhhhhhh")
    setLanguage("Sinhala");
        switchToSinhala();
}

function ToggleLanguageEnglish()
{
    setLanguage("English");
    window.location.reload(true)
  /*  switchToEnglish();*/
}


function ToggleLanguageTamil()
{
    setLanguage("Tamil");
    switchToTamil();
}

function switchToSinhala()
{


    convertContentIntoSinhalaAndEnglish(ForgotPasswordMobileNumberRegisterForm, "Sinhala");
    convertContentIntoSinhalaAndEnglish(signInForm, "Sinhala");
    convertContentIntoSinhalaAndEnglish(ForgotPasswordNewPasswordRegisterForm, "Sinhala");
    convertContentIntoSinhalaAndEnglish(SignUpMobileNumberRegisterForm, "Sinhala");
    convertContentIntoSinhalaAndEnglish(SignUpOtpRegisterForm, "Sinhala");
    convertContentIntoSinhalaAndEnglish(ProfileAddForm, "Sinhala");
    convertContentIntoSinhalaAndEnglish(ForgotPasswordOtpRegisterForm, "Sinhala");
    convertContentIntoSinhalaAndEnglish(Profile, "Sinhala");
    convertContentIntoSinhalaAndEnglish(ProfileUpdateForm, "Sinhala");
    convertContentIntoSinhalaAndEnglish(LandAddForm, "Sinhala");
    convertContentIntoSinhalaAndEnglish(LandDetails, "Sinhala");
    convertContentIntoSinhalaAndEnglish(LandUpdateForm, "Sinhala");
    convertContentIntoSinhalaAndEnglish(CropAddForm, "Sinhala");
    convertContentIntoSinhalaAndEnglish(CropDetails, "Sinhala");
    convertContentIntoSinhalaAndEnglish(CropUpdateForm, "Sinhala");
    convertContentIntoSinhalaAndEnglish(StatusAddForm, "Sinhala");
    convertContentIntoSinhalaAndEnglish(Header, "Sinhala");
    convertContentIntoSinhalaAndEnglish(LandAll, "Sinhala");
    convertContentIntoSinhalaAndEnglish(CropAll, "Sinhala");
}

function switchToEnglish()
{

    convertContentIntoSinhalaAndEnglish(signInForm, "English");
    convertContentIntoSinhalaAndEnglish(ForgotPasswordMobileNumberRegisterForm, "English");
    convertContentIntoSinhalaAndEnglish(ForgotPasswordNewPasswordRegisterForm, "English");
    convertContentIntoSinhalaAndEnglish(SignUpMobileNumberRegisterForm, "English");
    convertContentIntoSinhalaAndEnglish(SignUpOtpRegisterForm, "English");
    convertContentIntoSinhalaAndEnglish(ProfileAddForm, "English");
    convertContentIntoSinhalaAndEnglish(ForgotPasswordOtpRegisterForm, "English");
    convertContentIntoSinhalaAndEnglish(Profile, "English");
    convertContentIntoSinhalaAndEnglish(ProfileUpdateForm, "English");
    convertContentIntoSinhalaAndEnglish(LandAddForm, "English");
    convertContentIntoSinhalaAndEnglish(LandDetails, "English");
    convertContentIntoSinhalaAndEnglish(LandUpdateForm, "English");
    convertContentIntoSinhalaAndEnglish(CropAddForm, "English");
    convertContentIntoSinhalaAndEnglish(CropDetails, "English");
    convertContentIntoSinhalaAndEnglish(CropUpdateForm, "English");
    convertContentIntoSinhalaAndEnglish(StatusAddForm, "English");
    convertContentIntoSinhalaAndEnglish(Header, "English");
    convertContentIntoSinhalaAndEnglish(LandAll, "English");
    convertContentIntoSinhalaAndEnglish(CropAll, "English");
}

function switchToTamil()
{

    convertContentIntoSinhalaAndEnglish(signInForm, "Tamil");
    convertContentIntoSinhalaAndEnglish(ForgotPasswordMobileNumberRegisterForm, "Tamil");
    convertContentIntoSinhalaAndEnglish(ForgotPasswordNewPasswordRegisterForm, "Tamil");
    convertContentIntoSinhalaAndEnglish(SignUpMobileNumberRegisterForm, "Tamil");
    convertContentIntoSinhalaAndEnglish(SignUpOtpRegisterForm, "Tamil");
    convertContentIntoSinhalaAndEnglish(ProfileAddForm, "Tamil");
    convertContentIntoSinhalaAndEnglish(ForgotPasswordOtpRegisterForm, "Tamil");
    convertContentIntoSinhalaAndEnglish(Profile, "Tamil");
    convertContentIntoSinhalaAndEnglish(ProfileUpdateForm, "Tamil");
    convertContentIntoSinhalaAndEnglish(LandAddForm, "Tamil");
    convertContentIntoSinhalaAndEnglish(LandDetails, "Tamil");
    convertContentIntoSinhalaAndEnglish(LandUpdateForm, "Tamil");
    convertContentIntoSinhalaAndEnglish(CropAddForm, "Tamil");
    convertContentIntoSinhalaAndEnglish(CropDetails, "Tamil");
    convertContentIntoSinhalaAndEnglish(CropUpdateForm, "Tamil");
    convertContentIntoSinhalaAndEnglish(StatusAddForm, "Tamil");
    convertContentIntoSinhalaAndEnglish(Header, "Tamil");
    convertContentIntoSinhalaAndEnglish(LandAll, "Tamil");
    convertContentIntoSinhalaAndEnglish(CropAll, "Tamil");

}


function convertContentIntoSinhalaAndEnglish(contentArray, language)
{
    var languageIndex = 0;
    //languageIndex = (language === "English" ? "1" : "2");

    switch(language) {
        case "English":
            languageIndex = 1;
            break;
        case "Sinhala":
            languageIndex = 2;
            break;
        case "Tamil":
            languageIndex = 3;
            break;
        default:
        // code block
    }
    for (var i = 0; i < contentArray.length; i++)
    {
        if(  document.getElementById(contentArray[i][0]) == null ){

        }else {
            document.getElementById(contentArray[i][0]).innerHTML = contentArray[i][languageIndex];
            document.getElementById(contentArray[i][0]).placeholder = contentArray[i][languageIndex];
           // document.getElementsByName(contentArray[i][0])[0].innerHTML = contentArray[i][languageIndex];

        }

    }
}

var signInForm = [
    ["checkSignInRememberMe", " Remember Me ", "  මතක තබා ගන්න", "நினைவில் வை"],
    ["lblSputum", "Sign In", "පුරන්න" , "உள்நுழை"],
    ["lblAllPassword", "Password", "මුරපදය", "கடவுச்சொல்"],
    ["lblSignInMobileNumber", "Mobile Number", "ජංගම දූරකථන අංකය", "கைபேசி எண்"],
    ["btnSignInSignIn", "Sign In ", "පුරන්න", "உள்நுழை"],
    ["btnSignIpSignUp", "Sign Up ", "ලියාපදිංචි වන්න" , "பதிவுபெறு"],
    ["lblSignInForgotPassword", "Forgot Password? ", "මුරපදය අමතක වුණා ද?" , "கடவுச்சொல்லை மறந்துவிட்டீர்களா"],
    ["lblSputumAddress", "View As A Guest ", "අමුත්තෙකු ලෙස බලන්න","விருந்தினராகக் காண்க"],
];

var ForgotPasswordMobileNumberRegisterForm = [
    //headings
    ["lblForgotPasswordForgotPassword", "Forgot Password", "මුරපදය අමතක වුණා ද",  "கடவுச்சொல்லை மறந்துவிட்டீர்களா" ],

    //labels
    ["lblForgotPasswordMobileNumber", "Mobile Number", "ජංගම දූරකථන අංකය", "கைபேசி எண்"],
    ["txtForgotPasswordMobileNumber", "Mobile Number", "ජංගම දූරකථන අංකය", "கைபேசி எண்"],

    //buttons
    ["btnForgotPasswordNext", "Next", "ඊළඟ", "அடுத்து"],
    ["btnForgotPasswordSignIn", "Sign In", "පුරන්න", "உள்நுழை"],
];

var ForgotPasswordNewPasswordRegisterForm = [
    //headings
    ["lblForgotPasswordNewPasswordForgotPassword", "Forgot Password", "මුරපදය අමතක වුණා ද","கடவுச்சொல்லை மறந்துவிட்டீர்களா" ],

    //labels , inputfields
    ["lblForgotPasswordNewPassword", "New Password", "නව මුරපදය", "புதிய கடவுச்சொல்"],
    ["txtForgotPasswordNewPassword", "New Password", "නව මුරපදය", "புதிய கடவுச்சொல்"],
    ["lblForgotPasswordNewPasswordConfirm", "New Password Confirm", "නව මුරපදය තහවුරු කරන්න", "புதிய கடவுச்சொல் உறுதிப்படுத்தவும்"],
    ["txtForgotPasswordNewPasswordConfirm", "New Password Confirm", "නව මුරපදය තහවුරු කරන්න","புதிய கடவுச்சொல் உறுதிப்படுத்தவும்"],

    //buttons
    ["btnForgotPasswordNewPasswordUpdate", "Update New Password", "නව මුරපදය යාවත්කාලීන කරන්න","புதிய கடவுச்சொல்லைப் புதுப்பிக்கவும்"],
    ["btnForgotPasswordNewPasswordSignIn", "Sign In", "පුරන්න",  "உள்நுழை"],
];

var ForgotPasswordOtpRegisterForm = [
    //headings
    ["lblForgotPasswordOneTimePasswordForgotPassword", "Forgot Password", "මුරපදය අමතක වුණා ද","கடவுச்சொல்லை மறந்துவிட்டீர்களா"],

    //labels , inputfields
    ["lblForgotPasswordOneTimePassword", "One Time Password", "එක් වරක් මුරපදය", "ஒரு முறை கடவுச்சொல்"],
    ["txtForgotPasswordOneTimePassword", "One Time Password", "එක් වරක් මුරපදය",  "ஒரு முறை கடவுச்சொல்"],

    //buttons
    ["btnForgotPasswordOneTimePasswordNext", "Next", "ඊළඟ", "அடுத்து"],
    ["btnForgotPasswordOneTimePasswordSignIn", "Sign In", "පුරන්න", "உள்நுழை"],
];

var SignUpMobileNumberRegisterForm = [
    //headings
    ["lblSignUpMobileNumberSignUp", "Sign Up ", "ලියාපදිංචි වන්න",  "பதிவுபெறு"],

    //labels , inputfields
    ["lblSignUpMobileNumber", "Mobile Number", "ජංගම දූරකථන අංකය",  "கைபேசி எண்"],
    ["txtSignUpMobileNumber", "Mobile Number", "ජංගම දූරකථන අංකය",  "கைபேசி எண்"],

    //buttons
    ["btnSignUpNext", "Next", "ඊළඟ", "அடுத்து"],
    ["btnSignUpSignIn", "Sign In", "පුරන්න",  "உள்நுழை"],
];

var SignUpOtpRegisterForm = [
    //headings
    ["lblSignUpOTPRegisterSignUp", "Sign Up", "ලියාපදිංචි වන්න", "பதிவுபெறு"],

    //labels , inputfields
    ["lblSignUpOneTimePassword", "One Time Password", "එක් වරක් මුරපදය",  "ஒரு முறை கடவுச்சொல்"],
    ["txtSignUpOneTimePassword", "One Time Password", "එක් වරක් මුරපදය",  "ஒரு முறை கடவுச்சொல்"],
    ["txtSignUpMobileNumber", "Mobile Number", "ජංගම දූරකථන අංකය", "கைபேசி எண்"],

    //buttons
    ["btnSignUpOTPNext", "Next", "ඊළඟ", "அடுத்து"],
    ["btnSignUpOTPSignIn", "Sign In", "පුරන්න", "உள்நுழை"]
];

var ProfileAddForm = [
    //headings
    ["lblSignUp", "Sign Up ", "ලියාපදිංචි වන්න",  "பதிவுபெறு"],

    //labels , input-fields
    ["txtSignUpFirstName", "First Name", "මුල් නම", "முதல் பெயர்"],
    ["txtSignUpLastName", "Last Name", "අවසන් නම", "கடைசி பெயர்"],
    ["txtSignUpNic", "NIC", "ජාතික හැඳුනුම්පත", "என்.ஐ.சி."],
    ["txtSignUpPassword", "Password", "මුරපදය","கடவுச்சொல்"],
    ["txtSignUpPasswordConfirm", "Password Confirm", "මුරපදය තහවුරු කරන්න" , "புதிய கடவுச்சொல் உறுதிப்படுத்தவும்"],
    ["checkAgreeToTerms", "I Agree To Terms And Conditions", " මම කොන්දේසි වලට එකඟ වෙමි", "நான் விதிமுறைகளையும் நிபந்தனைகளையும் ஒப்புக்கொள்கிறேன்"],

    //buttons
    ["btnSignUpSignUp", "Sign Up ", "ලියාපදිංචි වන්න",  "பதிவுபெறு"],
    ["btnSignUpSignIn", "Sign In", "පුරන්න",  "உள்நுழை"]
];

var Profile = [
    ["pProfileLands", "Lands", "ඉඩම්", "நிலங்களும்"],
    ["pProfileCrops", "Crops", "බෝග", "பயிர்கள்"],
    ["pProfileDays", "Days", "දින", "நாட்களில்"],

    //headings
    ["lblProfileAllLands", "All Lands", "සියලුම ඉඩම්", "அனைத்து நிலங்களும்"],
    ["lblProfileProfile", "Profile", "පැතිකඩ", "சுயவிவரம்"],

    //Links
    ["lblProfileAddANewLand", "Add A New Land", "නව ඉඩමක් එක් කරන්න", "புதிய நிலத்தைச் சேர்க்கவும்"],
    ["lblProfileUpdateProfile", "Update profile", "පැතිකඩ යාවත්කාලීන කරන්න", "சுயவிவரத்தைப் புதுப்பிக்கவும்"],
    ["lblProfileAddANewLand2", "Add A New Land", "නව ඉඩමක් එක් කරන්න", "புதிய நிலத்தைச் சேர்க்கவும்"],
    ["lblProfileNoLandsToShow", "No Lands To Show", "පෙන්වීමට ඉඩම් නොමැත", "காட்ட நிலங்கள் இல்லை"]
];

var ProfileUpdateForm = [
    //headings
    ["lblProfileUpdateProfileUpdate", "Profile Update", "පැතිකඩ යාවත්කාලීන කිරීම", "சுயவிவர புதுப்பிப்பு"],

    //links
    ["lblProfileUpdateBreadCrumbsProfile", "Profile", "පැතිකඩ", "சுயவிவரம்"],
    ["lblProfileUpdateBreadCrumbsProfileUpdate", "Profile Update", "පැතිකඩ යාවත්කාලීන කිරීම", " சுயவிவர புதுப்பிப்பு"],
    ["lblProfileUpdateFirstName", "First Name", "මුල් නම", "முதல் பெயர்"],
    ["lblProfileUpdateLastName", "Last Name", "අවසන් නම",  "கடைசி பெயர்"],
    ["lblProfileUpdateMobileNumber", "Mobile Number", "ජංගම දූරකථන අංකය", "கைபேசி எண்"],
    ["lblProfileUpdateAddress", "Address", "ලිපිනය", "முகவரி"],
    ["lblProfileUpdateNIC", "NIC", "ජාතික හැඳුනුම්පත",  "என்.ஐ.சி."],
    ["lblProfileUpdateDateOfBirth", "Date Of Birth", "උපන්දිනය", "பிறந்த தேதி"],
    ["lblProfileUpdateGender", "Gender", "ස්ත්රී පුරුෂ භාවය", "பாலினம்"],
    ["lblProfileUpdatePassword", "Password", "මුරපදය", "கடவுச்சொல்"],
    ["lblProfileUpdatePasswordConfirm", "Password Confirm", "මුරපදය තහවුරු කරන්න","புதிய கடவுச்சொல் உறுதிப்படுத்தவும்"],
    ["lblProfileUpdateProvince", "Province", "පළාත", "மாகாணம்"],
    ["lblProfileUpdateDistrict", "District", "දිස්ත්‍රික්කය", "மாவட்டம்"],
    ["lblProfileUpdateGNDivision", "GN Division", "ග්‍රාම නිලධාරී කොට්ඨාශය", "ஜி.என் பிரிவு"],
    ["lblProfileUpdateFarmerPhoto", "Farmer's Photo", "ගොවියාගේ ඡායාරූපය", "விவசாயியின் புகைப்படம்"],
    ["lblProfileUpdateFarmerPhotoSaved", "Saved Farmer's Photo", "ගොවියාගේ ඡායාරූපය සුරකින ලදි", "விவசாயியின் புகைப்படம் சேமிக்கப்பட்டது"],
    ["lblProfileUpdateProfileChoosePhoto", "Choose Photo", "ඡායාරූපය තෝරන්න", "புகைப்படத்தைத் தேர்வுசெய்க"],

    ["btnProfileUpdateUpdateProfile", "Update Profile", "පැතිකඩ යාවත්කාලීන කරන්න", "சுயவிவரத்தைப் புதுப்பிக்கவும்"]
];

var LandAddForm = [
    //headings
    ["lblLandAddLandAdd", "Land Add", "ඉඩම් එක් කිරීම", "நிலம் சேர்"],

    //labels
    ["lblLandAddLandName", "Land Name", "ඉඩමේ නම", "நிலத்தின் பெயர்"],
    ["lblLandAddLandAddress", "Land Address", "ඉඩමේ ලිපිනය", "நிலத்தின் முகவரி"],
    ["lblLandAddProvince", "Province", "පළාත", "மாகாணம்"],
    ["lblLandAddDistrict", "District", "දිස්ත්‍රික්කය",  "மாவட்டம்"],
    ["lblLandAddGNDivision", "GN Division", "ග්‍රාම නිලධාරී කොට්ඨාශය", "கிராம நிலாதாரி பிரிவு"],
    ["lblLandAddLandType", "Land Type", "ඉඞම් වර්ගය", "நிலத்தின் வகை"],
    ["lblLandAddOwnershipState", "Ownership State", "හිමිකාරීත්වය", "உரிமையாளர்"],
    ["lblLandAddCultivationStatus", "Cultivated Status", "වගා කළ තත්වය", "பயிரிடப்பட்ட நிலை"],
    ["lblLandAddLandExtentAmount", "Land Extent Amount", "ඉඩම් ප්‍රමාණය", "நில விரிவாக்க தொகை"],
    ["lblLandAddLandExtentMeasurement", "Land Extent Measurement", "ඉඩම් ප්‍රමාණය මැනීම", "நில விரிவாக்க அளவீட்டு"],
    ["lblLandAddLandPhoto", "Land's Photo", "ඉඩමේ ඡායාරූපය", "நிலத்தின் புகைப்படம்"],
    ["lblLandAddLandPhotoSelected", "Selected Land's Photo", "තෝරාගත් ඉඩමේ ඡායාරූපය", "தேர்ந்தெடுக்கப்பட்ட நிலத்தின் புகைப்படம்"],

    //Input
    ["txtLandAddLandName", "Land Name", "ඉඩමේ නම", "நிலத்தின் பெயர்"],
    ["txtLandAddLandAddress", "Land Address", "ඉඩමේ ලිපිනය", "நிலத்தின் முகவரி"],
    ["txtLandAddLandExtentAmount", "Land Extent Amount", "ඉඩම් ප්‍රමාණය", "நில விரிவாக்க தொகை"],
    ["lblLandAddLandExtentMeasurement", "Land Extent Measurement", "ඉඩම් ප්‍රමාණය මැනීම", "நில விரிவாக்க அளவீட்டு"],
    ["lblLandAddLandPhoto", "Land's Photo", "ඉඩමේ ඡායාරූපය", "நிலத்தின் புகைப்படம்"],
    ["lblLandAddLandPhotoSelected", "Selected Land's Photo", "තෝරාගත් ඉඩමේ ඡායාරූපය", "தேர்ந்தெடுக்கப்பட்ட நிலத்தின் புகைப்படம்"],
    ["lblLandAddLandChoosePhoto", "Choose Photo", "ඡායාරූපය තෝරන්න", "புகைப்படத்தைத் தேர்வுசெய்க"],

    //buttons
    ["btnLandAddAddNewLand", "Add A New land", "නව ඉඩමක් එක් කරන්න", "புதிய நிலத்தைச் சேர்க்கவும்"],

    //links
    ["lblLandAddBreadCrumbsProfile", "Profile", "පැතිකඩ", "சுயவிவரம்"],
    ["lblLandAddBreadCrumbsAllLands", "All Lands", "සියලුම ඉඩම්", "அனைத்து நிலமும்"],
    ["lblLandAddBreadCrumbsAddLands", "Land Add", "ඉඩම් එක් කිරීම", "நிலங்களை சேர்த்தல்"],
];

var LandDetails = [
    //links
    ["lblLandDetailsBreadCrumbsProfile", "Profile", "පැතිකඩ", "சுயவிவரம்"],
    ["lblLandDetailsBreadCrumbsLands", "Lands", "ඉඩම්", "நிலமும்"],
    ["lblLandDetailsBreadCrumbsLandDetails", "Land Details", "ඉඩම් විස්තර", "நில விவரங்கள்"],
    ["lblLandDetailsUpdateLandDetails", "Update Land Details", "ඉඩම් විස්තර යාවත්කාලීන කරන්න", "நில விவரங்களை புதுப்பிக்கவும்"],
    ["lblLandDetailsAddNewCrop", "Add A New Crop", "නව බෝගයක් එක් කරන්න", "புதிய பயிர் சேர்க்கவும்"],
    ["lblLandDetailsAddNewCrop2", "Add A New Crop", "නව බෝගයක් එක් කරන්න", "புதிய பயிர் சேர்க்கவும்"],
    ["lblLandDetailsAllCrops", "All Crops", "සියලුම බෝග", "அனைத்து பயிர்களும்"],
    ["lblLandDetailsNoCropsToShow", "No Crops To Show", "පෙන්වීමට බෝග නැත", "காட்ட பயிர்கள் இல்லை"],
    //headings
    ["lblLandDetailsBreadCrumbsLandDetailsHeading", "Land Details", "ඉඩම් විස්තර", "நில விவரங்கள்"],
    ["lblLandAddMoreDetails", "More Details", "වැඩිපුර විස්තර", "கூடுதல் தகவல்கள்"],

    ["pLandDetailsCultivation", "Cultivation", "වගාව", "சாகுபடி"],
    ["pLandDetailsActivities", "Activities", "කටයුතු", "செயல்பாடுகள்"],
];

var LandUpdateForm = [
    //labels
    ["lblLandUpdateLandName", "Land Name", "ඉඩම් නම", "நிலத்தின் பெயர்"],
    ["lblLandUpdateLandAddress", "Land Address", "ඉඩම් ලිපිනය", "நிலத்தின் முகவரி"],
    ["lblLandUpdateProvince", "Province", "පළාත", "மாகாணம்"],
    ["lblLandUpdateDistrict", "District", "දිස්ත්‍රික්කය",  "மாவட்டம்" ],
    ["lblLandUpdateGNDivision", "GN Division", "ග්‍රාම නිලධාරී කොට්ඨාශය", "கிராம நிலாதாரி பிரிவு"],
    ["lblLandUpdateLandType", "Land Type", "ඉඞම් වර්ගය", "நிலத்தின் வகை"],
    ["lblLandUpdateOwnershipState", "Ownership State", "හිමිකාරීත්වය", "உரிமையாளர்"],
    ["lblLandUpdateCultivationStatus", "Cultivated Status", "වගා කළ තත්වය", "பயிரிடப்பட்ட நிலை"],
    ["lblLandUpdateLandExtentAmount", "Land Extent Amount", "ඉඩම් ප්‍රමාණය", "நில விரிவாக்க தொகை"],
    ["lblLandUpdateLandExtentMeasurement", "Land Extent Measurement", "ඉඩම් ප්‍රමාණය මැනීම", "நில விரிவாக்க அளவீட்டு"],
    ["lblLandUpdateLandPhoto", "Land's Photo", "ඉඩම් ඡායාරූපය", "நிலத்தின் புகைப்படம்"],
    ["lblLandUpdateLandPhotoSaved", "Land's Photo", "තෝරාගත් ඉඩම් ඡායාරූපය", "தேர்ந்தெடுக்கப்பட்ட நிலத்தின் புகைப்படம்"],
    ["lblLandUpdateLandChoosePhoto", "Choose Photo", "ඡායාරූපය තෝරන්න", "புகைப்படத்தைத் தேர்வுசெய்க"],

    //Input
    ["txtLandUpdateLandAddress", "Land Address", "ඉඩම් ලිපිනය", "நிலத்தின் முகவரி"],

    //button
    ["btnLandUpdateUpdateLand", "Update Land", "ඉඩම යාවත්කාලීන කරන්න", "நிலத்தைப் புதுப்பிக்கவும்"],

    //links
    ["lblLandUpdateBreadCrumbsProfile", "Profile", "පැතිකඩ", "சுயவிவரம்"],
    ["lblLandUpdateBreadCrumbsLands", "Lands", "ඉඩම්", "நிலமும்"],
    ["lblLandUpdateBreadCrumbsLandDetails", "Land Details", "ඉඩම් විස්තර","நில விவரங்கள்" ],
    ["lblLandUpdateBreadCrumbsLandUpdate", "Land Update", "ඉඩම යාවත්කාලීන කිරීම", "நில புதுப்பிப்பு" ],

    //headings
    ["lblLandUpdateBreadCrumbsLandUpdateHeading", "Land Update", "ඉඩම යාවත්කාලීන කිරීම", "நில புதுப்பிப்பு" ]
];

var CropAddForm = [
    //links
    ["lblCropAddBreadCrumbsProfile", "Profile", "පැතිකඩ", "சுயவிவரம்"],
    ["lblCropAddBreadCrumbsLands", "Lands", "ඉඩම්", "நிலமும்"],
    ["lblCropAddBreadCrumbsLandDetails", "Land Details", "ඉඩම් විස්තර","நில விவரங்கள்"],
    ["lblCropAddBreadCrumbsCropAdd", "Crop Add", "බෝගය එක් කිරීම", "பயிர் சேர்த்தல்"],

    //headings
    ["lblCropAddBreadCrumbsCropAddHeading", "Crop Add", "බෝගය එක් කිරීම", "நில புதுப்பிப்பு" ],

    //labels
    ["lblCropAddCropType", "Crop Type", "බෝග වර්ගය", "பயிர் வகை" ],
    ["lblCropAddCropExtentAmount", "Cultivated Land Area - Number", "වගා බිම් ප්‍රමාණය - අංකය", "பயிரிடப்பட்ட நிலப்பரப்பு - எண்"],
    ["lblCropAddCropExtentMeasurement", "Cultivated Land Area - Unit", "වගා බිම් ප්‍රමාණය - ඒකකය", "பயிரிடப்பட்ட நிலப்பரப்பு - அலகு"],
    ["lblCropAddNurseryGrown", "Nursery Grown", "තවාන් වැඩී", "நர்சரி வளர்ந்தது"],
    ["lblCropAddNurseryGrownNumber", "Nursery Grown - Number", "තවාන් වැඩුණු - අංකය", "நர்சரி வளர்ந்தது - எண்"],
    ["lblCropAddNurseryGrownMeasurement", "Nursery Grown - Measurement", "තවාන් වැඩීම - මැනීම", "நர்சரி வளர்ந்தது - அளவீட்டு"],
    ["lblCropAddCropPlantedDate", "Planted Date", "රෝපණය කළ දිනය", "நடவு தேதி"],
    ["lblCropAddCropPhoto", "Crop's Photo", "බෝගයේ  ඡායාරූපය", "பயிரின் புகைப்படம்"],
    ["lblCropAddCropPhotoSelected", "Selected Crop's Photo", "තෝරාගත් බෝගයේ ඡායාරූපය", "தேர்ந்தெடுக்கப்பட்ட பயிரின் புகைப்படம்"],
    ["lblCropAddChoosePhoto", "Choose Photo", "ඡායාරූපය තෝරන්න", "புகைப்படத்தைத் தேர்வுசெய்க"],
    ["lblCropAddMoreDetails", "More Details", "වැඩිපුර විස්තර", "கூடுதல் தகவல்கள்"],

    //Input
    ["txtCropAddCropExtentNumber", "Cultivated Land Area - Number", "වගා බිම් ප්‍රමාණය - අංකය", "பயிரிடப்பட்ட நிலப்பரப்பு - எண்"],
    ["txtCropAddNurseryGrownNumber", "Cultivated Land Area - Unit", "වගා බිම් ප්‍රමාණය - ඒකකය", "பயிரிடப்பட்ட நிலப்பரப்பு - அலகு"],

    //button
    ["btnCropAddAddNewCrop", "Add New Crop", "නව බෝගය එක් කරන්න", "புதிய பயிர் சேர்க்கவும்"],
];

var CropDetails = [
    //links
    ["lblCropDetailsBreadCrumbsProfile", "Profile", "පැතිකඩ", "சுயவிவரம்"],
    ["lbCropDetailsBreadCrumbsLands", "Lands", "ඉඩම්", "நிலமும்"],
    ["lblCropDetailsBreadCrumbsLandDetails", "Land Details", "ඉඩම් විස්තර", "நில விவரங்கள்"],
    ["lblCropDetailsCropDetails", "Crop Details", "බෝග විස්තර", "பயிர் விவரங்கள்"],

    ["lblCropDetailsUpdateCropDetails", "Update Crop Details", "බෝග විස්තර යාවත්කාලීන කරන්න", "பயிர் விவரங்களை புதுப்பிக்கவும்"],
    ["lblCropDetailsAddNewStatus", "Add A New Status", "නව තත්වයක් එක් කරන්න", "புதிய சூழ்நிலையைச் சேர்க்கவும்"],

    //headings
    ["lblCropDetailsBreadCrumbsCropDetailsHeading", "Crop Details", "බෝග විස්තර", "பயிர் விவரங்கள்"],
    ["lblCropDetailsAllStatusHeading", "All Status", "සියලුම තත්වයන්", "அனைத்து நிலை"],

    ["pCropDetailsActivities", "Activities", "කටයුතු", "செயல்பாடுகள்"],

    ["lblCropDetailsAddNewStatus2", "Add A New Status", "නව තත්වයක් එක් කරන්න", "புதிய சூழ்நிலையைச் சேர்க்கவும்"],
    ["lblCropDetailsNoStatusesToShow", "No Statuses To Show", "පෙන්වීමට තත්වයන් නොමැත", "காண்பிக்க நிலைகள் இல்லை"]
];

var CropUpdateForm = [
    //links
    ["lblCropUpdateBreadCrumbsProfile", "Profile", "පැතිකඩ", "சுயவிவரம்"],
    ["lblCropUpdateBreadCrumbsLands", "Lands", "ඉඩම්", "நிலமும்"],
    ["lblCropUpdateBreadCrumbsLandDetails", "Land Details", "ඉඩම් විස්තර", "நில விவரங்கள்"],
    ["lblCropUpdateBreadCrumbsCropDetails", "Crop Details", "බෝග විස්තර", "பயிர் விவரங்கள்"],
    ["lblCropUpdateBreadCrumbsUpdate", "Crop Update", "යාවත්කාලීන කිරීම", "பயிர் புதுப்பிப்பு"],

    //headings
    ["lblCropUpdateBreadCrumbsCropUpdateHeading", "Crop Update", "යාවත්කාලීන කිරීම", "பயிர் புதுப்பிப்பு"],

    //labels
    ["lblCropUpdateCropType", "Crop Type", "බෝග වර්ගය", "பயிர் வகை"],
    ["lblCropUpdateCultivationExtentAmount", "Cultivated Land Area - Number", "වගා බිම් ප්‍රමාණය - අංකය", "பயிரிடப்பட்ட நிலப்பரப்பு - எண்"],
    ["lblCropUpdateCultivationExtentMeasurement", "Cultivated Land Area - Unit", "වගා බිම් ප්‍රමාණය - ඒකකය", "பயிரிடப்பட்ட நிலப்பரப்பு - அலகு"],
    ["lblCropUpdateNurseryGrown", "Nursery Grown", "තවාන් වැඩී", "நர்சரி வளர்ந்தது"],
    ["lblCropUpdateNurseryGrownNumber", "Nursery Grown - Number", "තවාන් වැඩුණු - අංකය", "நர்சரி வளர்ந்தது - எண்"],
    ["lblCropUpdateNurseryGrownMeasurement", "Nursery Grown - Measurement", "තවාන් වැඩීම - මැනීම", "நர்சரி வளர்ந்தது - அளவீட்டு"],
    ["lblCropUpdateCropPlantedDate", "Planted Date", "රෝපණය කළ දිනය", "நடவு தேதி"],
    ["lblCropUpdateCropPhoto", "Crop's Photo", "බෝගයේ  ඡායාරූපය", "பயிரின் புகைப்படம்"],
    ["lblCropUpdateCropPhotoSelected", "Selected Crop's Photo", "තෝරාගත් බෝගයේ ඡායාරූපය", "தேர்ந்தெடுக்கப்பட்ட பயிரின் புகைப்படம்"],
    ["lblCropUpdateChoosePhoto", "Choose Photo", "ඡායාරූපය තෝරන්න", "புகைப்படத்தைத் தேர்வுசெய்க"],

    //Input
    ["txtCropUpdateCultivationExtentAmount", "Cultivated Land Area - Number", "වගා බිම් ප්‍රමාණය - අංකය", "பயிரிடப்பட்ட நிலப்பரப்பு - எண்"],
    ["txtCropUpdateNurseryGrownNumber", "Cultivated Land Area - Unit", "වගා බිම් ප්‍රමාණය - ඒකකය", "பயிரிடப்பட்ட நிலப்பரப்பு - அலகு"],

    //buttons
    ["btnCropUpdateUpdateCrop", "Update Crop", "බෝගය යාවත්කාලීන කරන්න" , "பயிர் புதுப்பிக்கவும்"],
];

var StatusAddForm = [
    //links
    ["lblStatusAddBreadCrumbsProfile", "Profile", "පැතිකඩ", "சுயவிவரம்"],
    ["lblStatusAddBreadCrumbsLands", "Lands", "ඉඩම්", "நிலமும்"],
    ["lblStatusAddBreadCrumbsLandDetails", "Land Details", "ඉඩම් විස්තර", "நில விவரங்கள்"],
    ["lblStatusAddBreadCrumbsCropDetails", "Crop Details",  "බෝග විස්තර", "பயிர் விவரங்கள்"],
    ["lblStatusAddBreadCrumbsStatusAdd", "Status Add", "තත්වය එකතු කරන්න", "நிலை சேர்"],

    //headings
    ["lblStatusAddBreadCrumbsStatusAddHeading", "Status Add", "තත්වය එකතු කරන්න", "நிலை சேர்"],

    //labels
    ["lblStatusAddStatusType", "Status", "තත්ත්වය", "நிலை"],
    ["lblStatusAddAddedNumber", "Amount", "ප්රමාණය", "தொகை"],
    ["lblStatusAddAddedMeasurement", "Measurement", "මිනුම්", "அளவீட்டு"],

    //Input
    ["txtStatusAddAddedNumber", "Amount", "ප්රමාණය", "தொகை"],

    //buttons
    ["btnStatusAddAddNewStatus", "Add New Status", "නව තත්වය එක් කරන්න" , "புதிய நிலையைச் சேர்க்கவும்"],
];

var Header = [
    ["lblHeaderLands", "Lands", "ඉඩම්", "நிலமும்"],
    ["lblHeaderCrops", "Crops", "බෝග", "பயிர்கள்"],
    ["lblHeaderHistory", "History", "ඉතිහාසය", "வரலாறு"],
    ["lblHeaderAccountDetails", "Details", "විස්තර", "விவரங்கள்"],
    ["lblHeaderSignOut", "Sign Out", "වරන්න", "வெளியேறு"]
];

var LandAll = [
    //links
    ["lblLandAllBreadCrumbsProfile", "Profile", "පැතිකඩ", "சுயவிவரம்"],
    ["lblLandAllBreadCrumbsLands", "Lands", "ඉඩම්", "நிலமும்"],

    //headings
    ["lblLandAllBreadCrumbsLandsHeading", "Lands", "ඉඩම්", "நிலமும்"],
    ["lblLandAllAllLandsHeading", "All Lands", "සියලුම ඉඩම්", "அனைத்து நிலமும்"],

    //buttons
    ["btnLandAllAddNewLand", "Add A New Land", "නව ඉඩමක් එක් කරන්න", "புதிய நிலத்தைச் சேர்க்கவும்"],
    ["btnLandAllAddNewLand2", "Add A New Land", "නව ඉඩමක් එක් කරන්න", "புதிய நிலத்தைச் சேர்க்கவும்"],
    ["lblLandAllNoLandsToShow", "No Lands To Show", "පෙන්වීමට ඉඩම් නොමැත", "காட்ட நிலங்கள் இல்லை"]
];

var CropAll = [
    //links
    ["lblCropAllBreadCrumbsProfile", "Profile", "පැතිකඩ", "சுயவிவரம்"],
    ["lblCropAllBreadCrumbsCrops", "Crops", "බෝග", "பயிர்கள்"],

    //headings
    ["lblCropAllBreadCrumbsCropsHeading", "Crops", "බෝග", "பயிர்கள்"],
    ["lblCropAllAllCropsHeading", "All Crops", "සියලුම බෝග", "அனைத்து பயிர்களும்"],

    //buttons
    ["btnCropAllAddNewCrop", "Add A New Crop", "නව බෝගයක් එක් කරන්න", "புதிய பயிர் சேர்க்கவும்"],
    ["btnCropAllAddNewCrop2", "Add A New Crop", "නව බෝගයක් එක් කරන්න", "புதிய பயிர் சேர்க்கவும்"],
    ["lblProfileNoLandsToShow", "No Crops To Show", "පෙන්වීමට බෝග නැත", "காட்ட பயிர்கள் இல்லை"],
];
