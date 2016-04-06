var ListOfEmployees = (function() {
	var $employedFrom;
	var $employedTo;
	var $gender;
	var employedFrom;
	var employedTo;
	var genderIdSelect;
	var $displayBtn;
	var employeeUrl = "/api/v1/employees/employee_list";
	var $employeeListSection;
	var $employeeListTemplate;
	var $printBtn;

	var _cacheDom = function() {
		$employedFrom = $("#employed-from");
		$employedTo = $("#employed-to");
		$genderIdSelect = $("#gender-id-select");
		$displayBtn = $("#display-btn");
		$printBtn = $("#print-btn");
		$employeeListSection = $("#employee-list-section");
		$employeeListTemplate = $("#employee-list-template").html();
	}

	var _bindEvents = function() {
		$displayBtn.on('click', function(){
			employedFrom = $employedFrom.val();
			employedTo = $employedTo.val();
			genderIdSelect = $genderIdSelect.val();



			var params = {
				gender_id: genderIdSelect,
				employed_from: employedFrom,
				employed_to: employedTo

			}

			$.ajax({
				url: employeeUrl,
				method: "GET",
				dataType: "json",
				data: params,
				success: function(responseContent){
					$displayBtn.removeClass("loading");
					console.log(responseContent);
					$employeeListSection.html(Mustache.render($employeeListTemplate, responseContent));
				},
				error:function(responseContent) {
					$displayBtn.removeClass("loading");
				}
			});
		});


		$printBtn.on('click', function(){
			$printBtn.addClass('loading');
			employedFrom = $employedFrom.val();
			employedTo = $employedTo.val();
			genderIdSelect = $genderIdSelect.val();



			var params = {
				gender_id: genderIdSelect,
				employed_from: employedFrom,
				employed_to: employedTo

			}

			$.ajax({
				url: '/reports/build_list_of_employees_url',
				method: "GET",
				dataType: "json",
				data: params,
				success: function(responseContent){
					window.location.replace(responseContent.url)
				},
				error:function(responseContent) {
				}
			});
		});
	}

	var init = function() {
		_cacheDom();
		_bindEvents();
	}

	return {
		init: init
	};
})();

$(document).ready(function() {
	ListOfEmployees.init();
});