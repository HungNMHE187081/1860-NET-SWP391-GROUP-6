<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Users"%>
<%@page import="model.UserAddresses"%>
<%@page import="model.Provinces"%>
<%@page import="model.District"%>
<%@page import="model.Ward"%>
<%
    Users userDetails = (Users) request.getAttribute("userDetails");
    UserAddresses address = userDetails.getAddress();
    Provinces province = address.getProvinces();
    District district = address.getDistrict();
    Ward ward = address.getWard();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Profile</title>
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <body>
        <h1>Profile Information</h1>
        <table>
            <tr>
                <th>First Name:</th>
                <td><%= userDetails.getFirstName() %></td>
            </tr>
            <tr>
                <th>Middle Name:</th>
                <td><%= userDetails.getMiddleName() %></td>
            </tr>
            <tr>
                <th>Last Name:</th>
                <td><%= userDetails.getLastName() %></td>
            </tr>
            <tr>
                <th>Email:</th>
                <td><%= userDetails.getEmail() %></td>
            </tr>
            <tr>
                <th>Phone Number:</th>
                <td><%= userDetails.getPhoneNumber() %></td>
            </tr>
            <tr>
                <th>Date of Birth:</th>
                <td><%= userDetails.getDateOfBirth() %></td>
            </tr>
            <tr>
                <th>Gender:</th>
                <td><%= userDetails.getGender() %></td>
            </tr>
            <tr>
                <th>Citizen Identification:</th>
                <td><%= userDetails.getCitizenIdentification() %></td>
            </tr>
            <tr>
                <th>Street Address:</th>
                <td><%= address.getStreetAddress() %></td>
            </tr>
            <tr>
                <th>Ward:</th>
                <td><%= ward.getWardName() %></td>
            </tr>
            <tr>
                <th>District:</th>
                <td><%= district.getDistrictName() %></td>
            </tr>
            <tr>
                <th>Province:</th>
                <td><%= province.getProvinceName() %></td>
            </tr>
            <!-- Add other fields as needed -->
        </table>
        <a href="${pageContext.request.contextPath}/customer/editprofile">Edit Profile</a>
    </body>
</html>