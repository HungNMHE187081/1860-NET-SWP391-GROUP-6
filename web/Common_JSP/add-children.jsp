<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Child Information</title>
    <style>
        /* Basic styles for better layout */
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        form {
            margin: 20px 0;
        }
        label {
            display: block;
            margin: 10px 0 5px;
        }
    </style>
</head>
<body>
    <h2>Add Child Information</h2>
    
    <!-- Display error message if available -->
    <c:if test="${not empty errorMessage}">
        <div style="color: red;">${errorMessage}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/customer/addchild" method="post" enctype="multipart/form-data">
        <input type="hidden" name="customerID"value="${sessionScope.user.userID}"/>.
        <label for="firstName">First Name:</label>
        <input type="text" name="firstName" required /><br/>

        <label for="middleName">Middle Name:</label>
        <input type="text" name="middleName" /><br/>

        <label for="lastName">Last Name:</label>
        <input type="text" name="lastName" required /><br/>

        <label for="dateOfBirth">Date of Birth:</label>
        <input type="date" name="dateOfBirth" required /><br/>

        <label for="gender">Gender:</label>
        <select name="gender" required>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Other">Other</option>
        </select><br/>

        <label for="childImage">Upload Child's Image:</label>
        <input type="file" name="childImage" accept="image/*" required /><br/>

        <input type="submit" value="Add Child" />
    </form>
</body>
</html>
