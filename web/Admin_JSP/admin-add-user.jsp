<!DOCTYPE html>
<html>
<head>
    <title>Add New User</title>
</head>
<body>
    <h1>Add New User</h1>
    <form action="adminadduser" method="post">
        <label for="firstName">First Name:</label>
        <input type="text" id="firstName" name="firstName" required><br>

        <label for="middleName">Middle Name:</label>
        <input type="text" id="middleName" name="middleName"><br>

        <label for="lastName">Last Name:</label>
        <input type="text" id="lastName" name="lastName" required><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>

        <label for="phoneNumber">Phone Number:</label>
        <input type="text" id="phoneNumber" name="phoneNumber" required><br>

        <label for="dateOfBirth">Date of Birth:</label>
        <input type="date" id="dateOfBirth" name="dateOfBirth" required><br>

        <label for="gender">Gender:</label>
        <select id="gender" name="gender" required>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
        </select><br>

        <label for="citizenIdentification">Citizen Identification:</label>
        <input type="text" id="citizenIdentification" name="citizenIdentification" required><br>

        <label for="role">Role:</label>
        <select id="role" name="role" required>
            <option value="Manager">Manager</option>
            <option value="Staff">Staff</option>
        </select><br>

        <input type="submit" value="Add User">
    </form>
</body>
</html>