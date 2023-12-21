function AddOption(selectbox, text, value) {
    if (value == "Select") {
        let optn = document.createElement("OPTION");
        optn.text = text;
        optn.value = value;
        optn.disabled = "disabled";
        optn.selected = "selected";
        optn.hidden = "hidden";
        selectbox.options.add(optn);
    } else {
        let optn = document.createElement("OPTION");
        optn.text = text;
        optn.value = value;
        selectbox.options.add(optn);
    }
}


function SetGNDivisions() {

    DeleteAllDivisions();
    let district_dropdown = document.getElementById("cmbLandAddDistrict");
    let selectedDistrict = district_dropdown.value;

    if (selectedDistrict == "Kurunagala") {
        ShowInDropDown(KURUNEGALA_DIVISIONS.sort());
    } else if (selectedDistrict == "Kaluthara") {

    } else if (selectedDistrict == "Gampaha") {

    }
}

function DeleteAllDivisions() {
    let listBox = document.getElementById("cmbLandAddGNDivision");
    listBox.options.length = 0;
    AddOption(listBox, "Select GN Division", "Select");
    return false;
}

function ShowInDropDown(divisions) {
    let divisions_dropdown = document.getElementById("cmbLandAddGNDivision");
    for (let i = 0; i < divisions.length; ++i) {
        console.log(divisions.length)
        AddOption(divisions_dropdown, divisions[i], divisions[i]);
    }
}

function SaveDivisions(data) {
    divisions = data.split('\n');
    console.log(divisions.length)
    ShowInDropDown(divisions);
}

function ReadDivisionFile(file) {
    const fileUrl = file // provide file location
    fetch(fileUrl)
        .then(r => r.text())
        .then(t => SaveDivisions(t))
}


const KURUNEGALA_DIVISIONS = new Array(
    "Hadirawalana Ihala",
    "Hadirawalana Pahala",
    "Thalatuwa",
    "Wellawa",
    "Dematagolla",
    "Rikillagamuwa",
    "Budanapitiya",
    "Waraddana",
    "Rangama",
    "Pahala Waraddana",
    "Thalwita",
    "Seruwawa",
    "Pubbowa",
    "Kalatuwapelassa",
    "Seeradunna",
    "Ginikarawa",
    "Mahakandegama",
    "Bamunugedara",
    "Wehera East",
    "Wehera West",
    "Henemulla",
    "Weherabanda",
    "Wilgoda",
    "Waduragala",
    "Akaragana North",
    "Akaragana South",
    "Bamunawala",
    "Malkaduwawa",
    "Heraliyawala",
    "Malkaduwawa South",
    "Malkaduwawa North",
    "Alakoladeniya",
    "Rathgalla",
    "Wilbawa",
    "Nailiya",
    "Pahalathalampitiya",
    "Aththanapitiya",
    "Kudumbuwa",
    "Thorawathura",
    "Mathawa",
    "Boyagane",
    "Madithiyawela",
    "Kurunegala Nagaraya North",
    "Gangoda",
    "Gattuwana",
    "Kurunegala Nagaraya Isana",
    "Kurunegala Nagaraya East",
    "Theliyagonna",
    "Kurunegala Nagaraya Batahira",
    "Illuppugedara",
    "Kurunegala Nagaraya Madyama",
    "Kadawidiya",
    "Kurunegala Nagaraya South",
    "Udawalpota"
);



