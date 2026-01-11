<?php include 'config.php'; ?>

<?php
$positions = $conn->query("SELECT * FROM positions");
$departments = $conn->query("SELECT * FROM departments");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['full_name'];
    $position_id = $_POST['position_id'];
    $department_id = $_POST['department_id'];
    $email = $_POST['email'];
    $salary = $_POST['salary'];
    $date_hired = $_POST['date_hired'];

    $sql = "INSERT INTO employees (full_name, position_id, department_id, email, salary, date_hired)
            VALUES ('$name', '$position_id', '$department_id', '$email', '$salary', '$date_hired')";

    if ($conn->query($sql)) {
        header("Location: index.php");
        exit();
    } else {
        echo "Error: " . $conn->error;
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Employee</title>
    <link rel="stylesheet" href="add.css">
</head>
<body>

<div class="container">
    <h2>Add New Employee</h2>

    <form method="POST" class="form">

        <label>Full Name:</label>
        <input type="text" name="full_name" required>

        <label>Position:</label>
        <select name="position_id" required>
            <option value="">Select Position</option>
            <?php while ($pos = $positions->fetch_assoc()): ?>
                <option value="<?= $pos['id'] ?>"><?= htmlspecialchars($pos['position_name']) ?></option>
            <?php endwhile; ?>
        </select>

        <label>Department:</label>
        <select name="department_id" required>
            <option value="">Select Department</option>
            <?php while ($dept = $departments->fetch_assoc()): ?>
                <option value="<?= $dept['id'] ?>"><?= htmlspecialchars($dept['department_name']) ?></option>
            <?php endwhile; ?>
        </select>

        <label>Email:</label>
        <input type="email" name="email" required>

        <label>Salary:</label>
        <input type="number" name="salary" step="0.01" required>

        <label>Date Hired:</label>
        <input type="date" name="date_hired" required>

        <button type="submit" class="button">Add Employee</button>
    </form>

<div class="back-container">
    <a href="index.php" class="back-link"> Back to List</a>
</div>

</div>

</body>
</html>
