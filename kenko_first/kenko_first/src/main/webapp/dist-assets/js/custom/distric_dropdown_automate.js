
const KURUNEGALA_GN_DIVISION_LIST = 'src/main/webapp/dist-assets/js/custom/gn_divisions/kurunegala_gn_divisions.txt';

function include(file) {

    let script  = document.createElement('script');
    script.src  = file;
    script.type = 'text/javascript';
    script.defer = true;

    document.getElementsByTagName('head').item(0).appendChild(script);

}

function SetDistricts() {

    DeleteAllDistricts();
    let province_dropdown = document.getElementById("cmbLandAddProvince");
    let district_dropdown = document.getElementById("cmbLandAddDistrict");
    let selectedProvince = province_dropdown.value;
    console.log(selectedProvince);

    let districts = [];
    if (selectedProvince == "Western") {
        districts = new Array("Colombo", "Kaluthara", "Gampaha");
    }else if(selectedProvince == "Central"){
        districts = new Array("Kandy","Matale" ,"Nuwaraeliya");
    }else if(selectedProvince == "Southern"){
        districts = new Array("Galle","Hambantota" ,"Matara");
    }else if(selectedProvince == "Eastern"){
        districts = new Array("Ampara","Batticaloa" ,"Trincomalee");
    }else if(selectedProvince == "Northern"){
        districts = new Array("Jaffna","Kilinochchi" ,"Mannar","Mullativu","Vavuniya" ,"Alambil");
    }else if(selectedProvince == "North Central"){
        districts = new Array("Anuradhapura","Polonnaruwa");
    }else if(selectedProvince == "North Western "){
        districts = new Array("Kurunagala","Puttalam");
    }else if(selectedProvince == "Sabaragamuwa"){
        districts = new Array("Kegalle","Rathnapura");
    }else if(selectedProvince == "Uva"){
        districts = new Array("Badulla","Monaragala");
    }

    for (let i = 0; i < districts.length; ++i) {
        AddOption(district_dropdown, districts[i], districts[i]);
    }
}

function AddOption(selectbox,text,value )
{
    if(value == "Select"){
        let optn = document.createElement("OPTION");
        optn.text = text;
        optn.value = value;
        optn.disabled
        optn.selected
        optn.hidden
        selectbox.options.add(optn);
    }else {
        let optn = document.createElement("OPTION");
        optn.text = text;
        optn.value = value;
        selectbox.options.add(optn);
    }
}

function DeleteAllDistricts() {
    let listBox = document.getElementById("cmbLandAddDistrict");
    listBox.options.length = 0;
    AddOption(listBox,"Select District","Select");
    return false;
}
