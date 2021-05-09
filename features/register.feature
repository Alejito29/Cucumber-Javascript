Feature: Register into losestudiantes


    Scenario Outline: Register with wrong fields

        Given I go to losestudiantes home screen
        When I open the login screen
        And I click in register
        And I fill the fields with id <idName> and <name>
        And I fill the fields with id <idLastName> and <lastName>
        And I fill the fields with id <idEmail> and <email>
        And I fill the fields with id <idPassword> and <password>
        And I fill the fields with id <idConfirmation> and <confirmationPassword>
        And I click on checkBox in register
        And I click on button to register
        Then I expect to see in register with <idError> and <error>
        Then I check the border color with <idInputBorder> and <borderColor>
        And I refresh page

        Examples:
            | name            | lastName  | email                  | password                   | confirmationPassword  | idName         | idLastName   |  idEmail |  idPassword |  idConfirmation | idError                         | error                                | borderColor  | idInputBorder         |
            | Lizeth          | Araque    | lizethgio57@gmail.com  | lizethgio57@gmail.com      | lizethgio57@gmail.com | firstname      | lastname     | email    |  password   |  password2      | div.notice b                    | Oops!                                | 3c763d       | input[name='firstname']  |
            | Lizeth          | Araque    | lizethgio57@gmail      | 123456789*                 | 123456789*            | firstname      | lastname     | email    |  password   |  password2      | div.alert-danger                | Ingresa un correo electrónico válido | 3c763d       | input[name='firstname']  |
            | Lizeth          | Araque    | lizethgio57@gmail.com  | 123467891                  | 1234567891            | firstname      | lastname     | email    |  password   |  password2      | div.alert-danger                | Las contraseñas no coinciden         | 3c763d       | input[name='firstname']  |
            |                 | Araque    | lizethgio57@gmail.com  | 123467891                  | 1234567891            | firstname      | lastname     | email    |  password   |  password2      | div.alert-danger                | Las contraseñas no coinciden         | a94442       | input[name='firstname']  |
            | Lizeth          |           | lizethgio57@gmail.com  | 123467891                  | 1234567891            | firstname      | lastname     | email    |  password   |  password2      | div.alert-danger                | Las contraseñas no coinciden         | a94442       | input[name='lastname']  |


    Scenario Outline: Register without therms accept
        Given I go to losestudiantes home screen
        When I open the login screen
        And I click in register
        And I fill the fields with id <idName> and <name>
        And I fill the fields with id <idLastName> and <lastName>
        And I fill the fields with id <idEmail> and <email>
        And I fill the fields with id <idPassword> and <password>
        And I fill the fields with id <idConfirmation> and <confirmationPassword>
        And I click on button to register
        Then I expect to see in register with <idError> and <error>
        And I refresh page

        Examples:
            | name            | lastName  | email                  | password                   | confirmationPassword  | idName         | idLastName   |  idEmail |  idPassword |  idConfirmation | idError                         | error                                                                       |
            | Lizeth          | Araque    | lizethgio57@gmail.com  | 1234567891                 | 1234567891            | firstname      | lastname     | email    |  password   |  password2      | div.alert-danger                | Tienes que aceptar los términos y condiciones para crear una cuenta         |

    Scenario Outline: Register with differente emails that it exists
        Given I go to losestudiantes home screen
        When I open the login screen
        And I click in register
        And I fill the fields with id <idName> and <name>
        And I fill the fields with id <idLastName> and <lastName>
        And I fill the fields with id <idEmail> and <email>
        And I fill the fields with id <idPassword> and <password>
        And I fill the fields with id <idConfirmation> and <confirmationPassword>
        And I click on checkBox in register
        And I click on button to register
        Then I expect to see in register with <idError> and <error>
        And I refresh page

        Examples:
            | name            | lastName  | email                       | password                   | confirmationPassword  | idName         | idLastName   |  idEmail |  idPassword |  idConfirmation | idError                         | error                               | idSuccessMessage   |
            | Lizeth          | Araque    | lizethgio57@gmail.com       | 1234567891                 | 1234567891            | firstname      | lastname     | email    |  password   |  password2      | div.alert-danger                | Oops! Email already exists          | .swal2-title       |
            | Lizeth          | Araque    | lizethgio-2199@hotmail.com  | 1234567891                 | 1234567891            | firstname      | lastname     | email    |  password   |  password2      | div.alert-danger                | Oops! Email already exists          | .swal2-title       |
