var country_arr =new Array("ANDHRAPRADESH","KARNATAKA","TAMILNADU","DELHI","GOA","W-BENGAL","GUJARAT","MADHYAPRADESH","MAHARASHTRA","RAJASTHAN");

var s_a = new Array();
s_a[0]="";
		s_a[1]="HYDERABAD";
        s_a[2]="BANGLORE";
        s_a[3]="CHENNAI";
        s_a[4]="DELHI";
        s_a[5]="GOA";
        s_a[6]="KOLKATA";
        s_a[7]="AHMEDABAD1|AHMEDABAD2|AHMEDABAD3|BARODA|BHAVNAGAR|MEHSANA|RAJKOT|SURAT|UNA";
        s_a[8]="INDORE";
        s_a[9]="MUMBAI|PUNE";
        s_a[10]="ABU";
        
        
        function populateStates(countryElementId, stateElementId) {

            var selectedCountryIndex = document.getElementById(countryElementId).selectedIndex;

            var stateElement = document.getElementById(stateElementId);

            stateElement.length = 0; // Fixed by Julian Woods
            stateElement.options[0] = new Option('Select CITY', '');
            stateElement.selectedIndex = 0;

            var state_arr = s_a[selectedCountryIndex].split("|");

            for (var i = 0; i < state_arr.length; i++) {
                stateElement.options[stateElement.length] = new Option(state_arr[i], state_arr[i]);
            }
        }

        function populateCountries(countryElementId, stateElementId) {
            // given the id of the <select> tag as function argument, it inserts <option> tags
            var countryElement = document.getElementById(countryElementId);
            countryElement.length = 0;
            countryElement.options[0] = new Option('Select STATE', '-1');
            countryElement.selectedIndex = 0;
            for (var i = 0; i < country_arr.length; i++) {
                countryElement.options[countryElement.length] = new Option(country_arr[i], country_arr[i]);
            }

            // Assigned all countries. Now assign event listener for the states.

            if (stateElementId) {
                countryElement.onchange = function () {
                    populateStates(countryElementId, stateElementId);
                };
            }
        }        