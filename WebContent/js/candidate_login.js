(function () {
    'use strict'
  
    var forms = document.querySelectorAll('.needs-validation')
  
    Array.prototype.slice.call(forms)
      .forEach(function (form) {
        form.addEventListener('submit', function (event) {
          if (!form.checkValidity()) {
            event.preventDefault()
            event.stopPropagation()
          }
  
          form.classList.add('was-validated')
        }, false)
      })
  })();
  (function() {
      $('.reqrd').keyup(function() {

          var isEmpty = false;
          $('.reqrd').each(function() {
              if ($(this).val() == '') {
                  isEmpty = true;
              }
          });

          if (isEmpty) {
              $('#next_btn1').prop('disabled', true);
          } else {
              $('#next_btn1').removeAttr('disabled');
          }
      });
  });
  
  function cap() {
    var alpha = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V'
        , 'W', 'X', 'Y', 'Z', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i',
        'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '!', '@', '#', '$', '%', '^', '&', '*', '+'];
    var a = alpha[Math.floor(Math.random() * 71)];
    var b = alpha[Math.floor(Math.random() * 71)];
    var c = alpha[Math.floor(Math.random() * 71)];
    var d = alpha[Math.floor(Math.random() * 71)];
    var e = alpha[Math.floor(Math.random() * 71)];
    var f = alpha[Math.floor(Math.random() * 71)];

    var final = a + b + c + d + e + f;
    document.getElementById("capt").value = final;
}
function validcap() {
    var stg1 = document.getElementById('capt').value;
    var stg2 = document.getElementById('textinput').value;
    if(stg2=="")
    {
      alert("Enter valid Captcha/Details");

    }
    else if (stg1 == stg2) {
        alert("Captcha validated Succesfully");
        return true;
    } 
    else {
        alert("Please enter a valid captcha");
        return false;
    }
}


 //aScript function that enables or disables a submit button depending
        //on whether a checkbox has been ticked or not.
        function terms_changed(termsCheckBox) {
            //If the checkbox has been checked
            if (termsCheckBox.checked) {
                //Set the disabled property to FALSE and enable the button.
                document.getElementById("submit_button").disabled = false;
            } else {
                //Otherwise, disable the submit button.
                document.getElementById("submit_button").disabled = true;
            }
        }

        var togglePassword = document.querySelector('#togglePassword');
        var password = document.querySelector('#pass');
      
      
        togglePassword.addEventListener('click', function () {
          // toggle the type attribute
          const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
          password.setAttribute('type', type);
          // toggle the eye / eye slash icon
          this.classList.toggle('bi-eye');
      });