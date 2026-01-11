<?php include 'config.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Employee Management System</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<div class="wrapper">
    <h2>Employee Management System</h2>

    <div class="add-btn-container">
        <a href="add.php" class="add-btn">+ Add Employee</a>
            <a href="index.html" class="home-btn"> Home</a>

    </div>

    <table class="employee-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Full Name</th>
                <th>Position</th>
                <th>Department</th>
                <th>Email</th>
                <th>Salary</th>
                <th>Date Hired</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <?php

          session_start();
         include 'config.php';

          // Check if admin is logged in
           if (!isset($_SESSION['admin'])) {
            header("Location: login.php");
             exit();
}



        $query = "
            SELECT e.id, e.full_name, e.email, e.salary, e.date_hired,
                   p.position_name AS position,
                   d.department_name AS department
            FROM employees e
            LEFT JOIN positions p ON e.position_id = p.id
            LEFT JOIN departments d ON e.department_id = d.id
            ORDER BY e.id DESC
        ";

        $result = $conn->query($query);

        if ($result && $result->num_rows > 0):
            while ($row = $result->fetch_assoc()):
        ?>
            <tr>
                <td><?= $row['id']; ?></td>
                <td><?= htmlspecialchars($row['full_name']); ?></td>
                <td><?= htmlspecialchars($row['position']); ?></td>
                <td><?= htmlspecialchars($row['department']); ?></td>
                <td><?= htmlspecialchars($row['email']); ?></td>
                <td>₱<?= number_format($row['salary'], 2); ?></td>
                <td><?= $row['date_hired']; ?></td>
                <td>
    <div class="action-buttons">
        <a href="edit.php?id=<?= $row['id']; ?>" class="edit-btn">Edit</a>
        <a href="delete.php?id=<?= $row['id']; ?>" onclick="return confirm('Are you sure?');" class="delete-btn">Delete</a>
    </div>
</td>

            </tr>
        <?php endwhile; else: ?>
            <tr>
                <td colspan="8" class="no-data">No employees found.</td>
            </tr>
        <?php endif; ?>
        </tbody>
    </table>
</div>

</body>
</html>
