//= require jquery
//= require jquery_ujs
//= require_tree .
//= require chartkick
//= require Chart.bundle
//= require rails-ujs
//= require builds/application.js

$(document).on('turbolinks:load', function() {
  $('input, select, textarea').on('input change', function() {
    $(this).siblings('.text-danger').remove();
  });
});

$(document).ready(function() {
  // Helper function to hide error message when the field has valid input
  function hideErrorOnInput($field, $errorMessage) {
    if ($field.length && $errorMessage.length) {
      $field.on('change keyup', function() {
        if ($field.is('select')) {
          // For select fields, hide error if an option is selected
          if ($field.val() !== "") {
            $errorMessage.hide();
          }
        } else {
          // For input fields, hide error if there's any input
          if ($.trim($field.val()) !== "") {
            $errorMessage.hide();
          }
        }
      });
    }
  }



  const $employeeSelectField = $('#employee_id');
  const $employeeErrorMessage = $('#employee_id_error');
  hideErrorOnInput($employeeSelectField, $employeeErrorMessage);

  // Opportunity Stage select field validation
  const $opportunityStageField = $('#opportunity_stage');
  const $opportunityStageErrorMessage = $('#opportunity_stage_error');
  hideErrorOnInput($opportunityStageField, $opportunityStageErrorMessage);

  // Opportunity Source select field validation
  const $opportunitySourceField = $('#opportunity_source');
  const $opportunitySourceErrorMessage = $('#opportunity_source_error');
  hideErrorOnInput($opportunitySourceField, $opportunitySourceErrorMessage);

  // Account Name field validation (if present in the form)
  const $accountNameField = $('#account_name');
  const $accountNameErrorMessage = $('#account_name_error');
  hideErrorOnInput($accountNameField, $accountNameErrorMessage);

  // Full Name field validation (if present in the form)
  const $fullNameField = $('#full_name');
  const $fullNameErrorMessage = $('#full_name_error');
  hideErrorOnInput($fullNameField, $fullNameErrorMessage);

  // Phone Number field validation (if present in the form)
  const $phoneNumberField = $('#phone_number');
  const $phoneNumberErrorMessage = $('#phone_number_error');
  hideErrorOnInput($phoneNumberField, $phoneNumberErrorMessage);

  // Project Name field validation (if present in the form)
  const $projectNameField = $('#project_name');
  const $projectNameErrorMessage = $('#project_name_error');
  hideErrorOnInput($projectNameField, $projectNameErrorMessage);


   // Opportunity ID select field validation
  const $opportunitySelectField = $('#opportunity_id');
  const $opportunityErrorMessage = $('#opportunity_id_error');
  hideErrorOnInput($opportunitySelectField, $opportunityErrorMessage);

  // Payment Medium field validation
  const $paymentMediumField = $('#payment_medium');
  const $paymentMediumErrorMessage = $('#payment_medium_error');
  hideErrorOnInput($paymentMediumField, $paymentMediumErrorMessage);

  // Amount field validation
  const $amountField = $('#amount');
  const $amountErrorMessage = $('#amount_error');
  hideErrorOnInput($amountField, $amountErrorMessage);

  // Payment Date and Time field validation
  const $paymentDateTimeField = $('#payment_date_and_time');
  const $paymentDateTimeErrorMessage = $('#payment_date_and_time_error');
  hideErrorOnInput($paymentDateTimeField, $paymentDateTimeErrorMessage);

  // First Name field validation
  const $firstNameField = $('#first_name');
  const $firstNameErrorMessage = $('#first_name_error');
  hideErrorOnInput($firstNameField, $firstNameErrorMessage);

  // Last Name field validation
  const $lastNameField = $('#last_name');
  const $lastNameErrorMessage = $('#last_name_error');
  hideErrorOnInput($lastNameField, $lastNameErrorMessage);

  // Email field validation
  const $emailField = $('#email');
  const $emailErrorMessage = $('#email_error');
  hideErrorOnInput($emailField, $emailErrorMessage);

  // Password field validation
  const $passwordField = $('#password');
  const $passwordErrorMessage = $('#password_error');
  hideErrorOnInput($passwordField, $passwordErrorMessage);

  const $countryField = $('#country');
  const $countryErrorMessage = $('#country_error');
  hideErrorOnInput($countryField, $countryErrorMessage);

  const $stateField = $('#state');
  const $stateErrorMessage = $('#state_error');
  hideErrorOnInput($stateField, $stateErrorMessage);

  const $cityField = $('#city');
  const $cityErrorMessage = $('#city_error');
  hideErrorOnInput($cityField, $cityErrorMessage);

  const $territoryNameField = $('#territory_name');
  const $territoryNameErrorMessage = $('#territory_name_error');
  hideErrorOnInput($territoryNameField, $territoryNameErrorMessage);


  const $employee_idField = $('#employee_id');
  const $employee_idErrorMessage = $('#employee_id_error');
  hideErrorOnInput($employee_idField, $employee_idErrorMessage);

  const $territory_master_idField = $('#territory_master_id');
  const $territory_master_idErrorMessage = $('#territory_master_id_error');
  hideErrorOnInput($territory_master_idField, $territory_master_idErrorMessage);

  const $sales_office_nameField = $('#sales_office_name');
  const $sales_office_nameErrorMessage = $('#sales_office_name_error');
  hideErrorOnInput($sales_office_nameField, $sales_office_nameErrorMessage);


  const $territory_location_nameField = $('#territory_location_name');
  const $territory_location_nameErrorMessage = $('#territory_location_name_error');
  hideErrorOnInput($territory_location_nameField, $territory_location_nameErrorMessage);

  const $hierarchical_geographyField = $('#hierarchical_geography');
  const $hierarchical_geographyErrorMessage = $('#hierarchical_geography_error');
  hideErrorOnInput($hierarchical_geographyField, $hierarchical_geographyErrorMessage);

  
  // const $auditStatusFields = $('input[name="payment_gateway[audit_status]"]'); // Select radio buttons
  // const $auditStatusErrorMessage = $('#audit_status_error');
  // $auditStatusFields.on('change', function() {
  //   $auditStatusErrorMessage.hide(); // Hide error when any radio button is selected
  // });

  // const $reasonField = $('#reason'); // Select the textarea
  // const $reasonErrorMessage = $('#reason_error');
  // hideErrorOnInput($reasonField, $reasonErrorMessage);

});

