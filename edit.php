<?php include 'config.php'; ?>

<?php
if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $result = $conn->query("
        SELECT e.*, p.position_name, d.department_name 
        FROM employees e
        LEFT JOIN positions p ON e.position_id = p.id
        LEFT JOIN departments d ON e.department_id = d.id
        WHERE e.id = $id
    ");
    if ($result->num_rows == 1) {
        $row = $result->fetch_assoc();
    } else {
        echo "Employee not found!";
        exit();
    }
} else {
    header("Location: index.php");
    exit();
}

$positions = $conn->query("SELECT * FROM positions ORDER BY position_name");
$departments = $conn->query("SELECT * FROM departments ORDER BY department_name");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['full_name'];
    $position_id = $_POST['position_id'];
    $department_id = $_POST['department_id'];
    $email = $_POST['email'];
    $salary = $_POST['salary'];
    $date_hired = $_POST['date_hired'];

    $sql = "UPDATE employees 
            SET full_name='$name', 
                position_id='$position_id', 
                department_id='$department_id',
                email='$email', 
                salary='$salary', 
                date_hired='$date_hired'
            WHERE id=$id";

    if ($conn->query($sql)) {
        header("Location: index.php");
        exit();
    } else {
        echo "Error updating record: " . $conn->error;
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Employee</title>
    <link rel="stylesheet" href="edit.css">
</head>
<body>
<div class="form-container">
    <h2>Edit Employee</h2>
    
    <form method="POST" class="form">
        <label>Full Name:</label>
        <input type="text" name="full_name" value="<?= htmlspecialchars($row['full_name']); ?>" required>

        <label>Position:</label>
        <select name="position_id" required>
            <option value="">Select Position</option>
            <?php while ($pos = $positions->fetch_assoc()): ?>
                <option value="<?= $pos['id']; ?>" <?= ($pos['id'] == $row['position_id']) ? 'selected' : ''; ?>>
                    <?= htmlspecialchars($pos['position_name']); ?>
                </option>
            <?php endwhile; ?>
        </select>

        <label>Department:</label>
        <select name="department_id" required>
            <option value="">Select Department</option>
            <?php while ($dept = $departments->fetch_assoc()): ?>
                <option value="<?= $dept['id']; ?>" <?= ($dept['id'] == $row['department_id']) ? 'selected' : ''; ?>>
                    <?= htmlspecialchars($dept['department_name']); ?>
                </option>
            <?php endwhile; ?>
        </select>

        <label>Email:</label>
        <input type="email" name="email" value="<?= htmlspecialchars($row['email']); ?>" required>

        <label>Salary:</label>
        <input type="number" name="salary" step="0.01" value="<?= $row['salary']; ?>" required>

        <label>Date Hired:</label>
        <input type="date" name="date_hired" value="<?= $row['date_hired']; ?>" required>

        <button type="submit" class="submit-btn">Update Employee</button>
    </form>

    <div class="back-container">
        <a href="index.php" class="back-link">Back to List</a>
    </div>
</div>
</body>
</html>
