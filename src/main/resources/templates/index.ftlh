<!DOCTYPE html>  
<html lang="en">  
    <head>
        <meta charset="UTF-8">
        <title>Goldeneye</title>
	    <script type="text/javascript">
	    	var officeLocation;
	    	var department;
			var officeLocations = [
				<#list officeLocationList as officeLocation>{
					'name': '${officeLocation}', 
					'description': '${officeLocation.getDescription()}', 
					'departments': [ <#list officeLocation.getDepartments() as department>{
						'name': '${department}', 
						'description': '${department.getDescription()}'
					}, </#list>]
				}, </#list>];
				
			function onFormReset(){
				document.getElementById('email').innerHTML = '';
				document.getElementById('errorMessage').style.display = 'none';
				refreshOfficeLocations();
			}
			
			function onOfficeLocationChange(){
				officeLocation = officeLocations[officeLocations.findIndex(obj => obj.name == document.getElementById("officeLocation").value)];
				refreshDeparments();
			}
			
			function onDepartmentChange(){
				department = officeLocation.departments[officeLocation.departments.findIndex(obj => obj.name == document.getElementById("deparment").value)];
			}
			
			function refreshOfficeLocations(){
				var ele = document.getElementById('officeLocation');
				ele.innerHTML = '';
		        for (var i = 0; i < officeLocations.length; i++) {
		            ele.innerHTML = ele.innerHTML + '<option value="' + officeLocations[i].name + '">' + officeLocations[i].description + '</option>';
		        }
				officeLocation = officeLocations[0];
				ele.value = officeLocation.name;
				refreshDeparments();
			}
			
			function refreshDeparments(){
				var ele = document.getElementById('deparment');
				ele.innerHTML = '';
		        for (var i = 0; i < officeLocation.departments.length; i++) {
		            ele.innerHTML = ele.innerHTML + '<option value="' + officeLocation.departments[i].name + '">' + officeLocation.departments[i].description + '</option>';
		        }
				department = officeLocation.departments[0];
				ele.value = department.name;
			}
			
			function validateForm(){
				var bool = true;
				var nameInitial = document.getElementById('nameInitial').value;
				var surname = document.getElementById('surname').value;
				
				if(nameInitial == null || nameInitial == ''){
					bool = false;
				}
				if(surname == null || surname == ''){
					bool = false;
				}
				
				if(!bool){
					document.getElementById('errorMessage').style.display = null;
				}
				
				return bool;
			}
			
			function init() {
				refreshOfficeLocations();
			}
		</script>
    </head>
    <body>
        <h1>Goldeneye</h1>
        <form action="/email_form" method="post" onsubmit="return validateForm()" onreset="onFormReset()" method="post">
	        <span>Build your email: </span>
	        <br/><br/>
	        <input type="text" id="nameInitial" name="nameInitial" placeholder="First letter of the name" title="First letter of the name"/>
	        <input type="text" id="surname" name="surname" placeholder="Surname" title="Surname"/>
	        <span>.</span>
			<select id="officeLocation" name="officeLocation" title="Office location" onchange="onOfficeLocationChange()"></select>
	        <span>@</span>
			<select id="deparment" name="deparment" title="Deparment" onchange="onDepartmentChange()"></select>
	        <span>.goldeneye.com</span>
	        <br/><br/>
	    	<#if email?? >
	            <div id="email"> 
		            Your email: <b>${email} </b>
		        	<br/><br/>
	        	</div>
	        <#else>
	        </#if>
	        <div id="errorMessage" style="display: none"> 
		        <b style="color: red"> Fill all fields to be able to build your email </b>
		        <br/><br/>
	        </div>
	        <input type="submit" value="Generate Email"/>
	        <input type="reset" value="Clean"/>
        </form>
    </body>
    
	<script type="text/javascript">
		init();
	</script>
</html>