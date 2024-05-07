USE DATABASE Company;

select * from employee;

--STORED PROCEDURE - EMPLOYEE CRUD

CREATE PROCEDURE spEmployeeCrud
@option VARCHAR(10),
@emp_id INT,
@first_name VARCHAR(20),
@last_name VARCHAR(20),
@birth_date DATE,
@gender CHAR(1),
@salary INT,
@super_id INT,
@branch_id INT
AS
BEGIN
	IF @option = 'INSERT'
	BEGIN
		INSERT INTO employee
		VALUES (@emp_id, @first_name, @last_name, @birth_date, @gender, @salary, @super_id, @branch_id);
	END
	ELSE IF @option = 'SELECT'
	BEGIN
		SELECT *
		FROM employee
		WHERE @emp_id = emp_id;
	END
	ELSE IF @option = 'UPDATE'
	BEGIN
		UPDATE employee
		SET 
			first_name = @first_name,
			last_name = @last_name,
			birth_date = @birth_date,
			@gender = @gender,
			salary = @salary
		WHERE emp_id = @emp_id;
	END
	ELSE IF @option = 'DELETE'
	BEGIN
		DELETE FROM employee WHERE emp_id = @emp_id;
	END
END