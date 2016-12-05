package validate;

import javax.servlet.http.HttpServletRequest;

public class Validator {

    // ensures that quantity input is number between 0 and 99
    // applies to quantity fields in cart page
    public boolean validateQuantity (String productId, String quantity) {

        boolean errorFlag = false;

        if (!productId.isEmpty() && !quantity.isEmpty()) {

            int i = -1;

            try {

                i = Integer.parseInt(quantity);
            } catch (NumberFormatException nfe) {

                System.out.println("User did not enter a number in the quantity field");
            }

            if (i < 0 || i > 99) {

                errorFlag = true;
            }
        }

        return errorFlag;
    }


    // performs simple validation on checkout form
    public boolean validateFormCustomer(String name,
                                String email,
                                String phone,
                                String address,
                                String cityRegion,
                                String ccNumber,
                                HttpServletRequest request) {

        boolean errorFlag = false;
        boolean nameError;
        boolean emailError;
        boolean phoneError;
        boolean addressError;
        boolean cityRegionError;
        boolean ccNumberError;

        if (name == null
                || name.equals("")
                || name.length() > 45) {
            errorFlag = true;
            nameError = true;
            request.setAttribute("nameError", nameError);
        }
        if (email == null
                || email.equals("")
                || !email.contains("@")) {
            errorFlag = true;
            emailError = true;
            request.setAttribute("emailError", emailError);
        }
        if (phone == null
                || phone.equals("")
                || phone.length() < 9) {
            errorFlag = true;
            phoneError = true;
            request.setAttribute("phoneError", phoneError);
        }
        if (address == null
                || address.equals("")
                || address.length() > 45) {
            errorFlag = true;
            addressError = true;
            request.setAttribute("addressError", addressError);
        }
        if (cityRegion == null
                || cityRegion.equals("")) {
            errorFlag = true;
            cityRegionError = true;
            request.setAttribute("cityRegionError", cityRegionError);
        }
        if (ccNumber == null
                || ccNumber.equals("")
                || ccNumber.length() > 19) {
            errorFlag = true;
            ccNumberError = true;
            request.setAttribute("ccNumberError", ccNumberError);
        }

        return errorFlag;
    }


    // performs simple validation on checkout form
    public boolean validateFormUser(String username,
                                String email,
                                String password1,
                                String password2,
                                HttpServletRequest request) {

        boolean errorFlag = false;
        boolean usernameError;
        boolean emailError;
        boolean password1Error;
        boolean password2Error;

        if (username == null
                || username.equals("")
                || username.length() > 20
                || username.length() < 6) {
            errorFlag = true;
            usernameError = true;
            request.setAttribute("usernameError", usernameError);
        }
        if (email == null
                || email.equals("")
                || !email.contains("@")) {
            errorFlag = true;
            emailError = true;
            request.setAttribute("emailError", emailError);
        }
        if (password1 == null
                || password1.equals("")
                || password1.length() < 8) {
            errorFlag = true;
            password1Error = true;
            request.setAttribute("password1Error", password1Error);
        }
        if (password2 == null
                || password2.equals("")
                || password2.length() < 8
                || !password2.equals(password1)) {
            errorFlag = true;
            password2Error = true;
            request.setAttribute("password2Error", password2Error);
        }

        return errorFlag;
    }

}