--USE Project_ChildrenCareDB_ver2
/*
CREATE FUNCTION dbo.removeAccent(@input NVARCHAR(MAX))
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @output NVARCHAR(MAX);
    
    -- Thay thế các ký tự có dấu bằng ký tự không dấu
    SET @output = REPLACE(@input, N'á', N'a');
    SET @output = REPLACE(@output, N'à', N'a');
    SET @output = REPLACE(@output, N'ả', N'a');
    SET @output = REPLACE(@output, N'ã', N'a');
    SET @output = REPLACE(@output, N'ạ', N'a');
    SET @output = REPLACE(@output, N'â', N'a');
    SET @output = REPLACE(@output, N'ầ', N'a');
    SET @output = REPLACE(@output, N'ẩ', N'a');
    SET @output = REPLACE(@output, N'ẫ', N'a');
    SET @output = REPLACE(@output, N'ậ', N'a');
    SET @output = REPLACE(@output, N'ê', N'e');
    SET @output = REPLACE(@output, N'ề', N'e');
    SET @output = REPLACE(@output, N'ể', N'e');
    SET @output = REPLACE(@output, N'ễ', N'e');
    SET @output = REPLACE(@output, N'ệ', N'e');
    SET @output = REPLACE(@output, N'í', N'i');
    SET @output = REPLACE(@output, N'ì', N'i');
    SET @output = REPLACE(@output, N'ỉ', N'i');
    SET @output = REPLACE(@output, N'ĩ', N'i');
    SET @output = REPLACE(@output, N'ị', N'i');
    SET @output = REPLACE(@output, N'ó', N'o');
    SET @output = REPLACE(@output, N'ò', N'o');
    SET @output = REPLACE(@output, N'ỏ', N'o');
    SET @output = REPLACE(@output, N'õ', N'o');
    SET @output = REPLACE(@output, N'ọ', N'o');
    SET @output = REPLACE(@output, N'ô', N'o');
    SET @output = REPLACE(@output, N'ồ', N'o');
    SET @output = REPLACE(@output, N'ổ', N'o');
    SET @output = REPLACE(@output, N'ỗ', N'o');
    SET @output = REPLACE(@output, N'ộ', N'o');
    SET @output = REPLACE(@output, N'ư', N'u');
    SET @output = REPLACE(@output, N'ừ', N'u');
    SET @output = REPLACE(@output, N'ử', N'u');
    SET @output = REPLACE(@output, N'ữ', N'u');
    SET @output = REPLACE(@output, N'ự', N'u');
    SET @output = REPLACE(@output, N'ý', N'y');
    SET @output = REPLACE(@output, N'ỳ', N'y');
    SET @output = REPLACE(@output, N'ỷ', N'y');
    SET @output = REPLACE(@output, N'ỹ', N'y');
    SET @output = REPLACE(@output, N'ỵ', N'y');
    
    -- Thay thế các ký tự khác tương tự
    SET @output = REPLACE(@output, N'Đ', N'D');
    SET @output = REPLACE(@output, N'đ', N'd');
    
    RETURN @output;
END
*/

-- Trigger cập nhật TotalPrice sau khi thêm, cập nhật hoặc xóa OrderItem
CREATE TRIGGER trg_UpdateTotalPrice_AfterInsertOrUpdateOrDelete
ON OrderItems
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    -- Cập nhật TotalPrice cho mỗi Order khi có thêm, cập nhật hoặc xóa OrderItem với isExam = 0 trong Reservations
    UPDATE Orders
    SET TotalPrice = (
        SELECT COALESCE(SUM(s.Price), 0) -- Đảm bảo TotalPrice là 0 nếu không có OrderItem nào thỏa mãn
        FROM OrderItems oi
        JOIN Services s ON oi.ServiceID = s.ServiceID
        JOIN Reservations r ON oi.OrderItemID = r.OrderItemID
        WHERE oi.OrderID = Orders.OrderID
          AND r.isExam = 0
    )
    WHERE Orders.OrderID IN (
        SELECT DISTINCT OrderID 
        FROM (
            SELECT OrderID FROM inserted
            UNION
            SELECT OrderID FROM deleted
        ) AS Changes
    )
    AND (
        SELECT COALESCE(SUM(s.Price), 0)
        FROM OrderItems oi
        JOIN Services s ON oi.ServiceID = s.ServiceID
        JOIN Reservations r ON oi.OrderItemID = r.OrderItemID
        WHERE oi.OrderID = Orders.OrderID
          AND r.isExam = 0
    ) > 0; -- Chỉ cập nhật nếu tổng giá lớn hơn 0
END;
GO

-- Trigger cập nhật TotalPrice khi thêm hoặc cập nhật Reservation
CREATE TRIGGER trg_UpdateTotalPrice_AfterInsertOrUpdateOnReservations
ON Reservations
AFTER INSERT, UPDATE
AS
BEGIN
    -- Cập nhật TotalPrice cho mỗi Order khi Reservation thay đổi và có isExam = 0
    UPDATE Orders
    SET TotalPrice = (
        SELECT COALESCE(SUM(s.Price), 0) -- Đảm bảo TotalPrice là 0 nếu không có OrderItem nào thỏa mãn
        FROM OrderItems oi
        JOIN Services s ON oi.ServiceID = s.ServiceID
        JOIN Reservations r ON oi.OrderItemID = r.OrderItemID
        WHERE oi.OrderID = Orders.OrderID
          AND r.isExam = 0
    )
    WHERE Orders.OrderID IN (
        SELECT DISTINCT oi.OrderID
        FROM OrderItems oi
        JOIN inserted i ON oi.OrderItemID = i.OrderItemID
    )
    AND (
        SELECT COALESCE(SUM(s.Price), 0)
        FROM OrderItems oi
        JOIN Services s ON oi.ServiceID = s.ServiceID
        JOIN Reservations r ON oi.OrderItemID = r.OrderItemID
        WHERE oi.OrderID = Orders.OrderID
          AND r.isExam = 0
    ) > 0; -- Chỉ cập nhật nếu tổng giá lớn hơn 0
END;
GO

-- Trigger cập nhật TotalPrice và Quantity sau khi thêm, cập nhật hoặc xóa OrderItem
CREATE TRIGGER trg_UpdateTotalPriceAndQuantity_AfterInsertOrUpdateOrDelete
ON OrderItems
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    -- Cập nhật TotalPrice và Quantity cho mỗi Order khi có thay đổi trong OrderItems
    UPDATE Orders
    SET 
        TotalPrice = (
            SELECT COALESCE(SUM(s.Price), 0) -- Đảm bảo TotalPrice là 0 nếu không có OrderItem nào thỏa mãn
            FROM OrderItems oi
            JOIN Services s ON oi.ServiceID = s.ServiceID
            JOIN Reservations r ON oi.OrderItemID = r.OrderItemID
            WHERE oi.OrderID = Orders.OrderID
              AND r.isExam = 0
        ),
        Quantity = (
            SELECT COUNT(*)
            FROM OrderItems oi
            JOIN Reservations r ON oi.OrderItemID = r.OrderItemID
            WHERE oi.OrderID = Orders.OrderID
              AND r.isExam = 0
        )
    WHERE Orders.OrderID IN (
        SELECT DISTINCT OrderID 
        FROM (
            SELECT OrderID FROM inserted
            UNION
            SELECT OrderID FROM deleted
        ) AS Changes
    )
    AND (
        SELECT COALESCE(SUM(s.Price), 0)
        FROM OrderItems oi
        JOIN Services s ON oi.ServiceID = s.ServiceID
        JOIN Reservations r ON oi.OrderItemID = r.OrderItemID
        WHERE oi.OrderID = Orders.OrderID
          AND r.isExam = 0
    ) > 0; -- Chỉ cập nhật nếu tổng giá lớn hơn 0
END;
GO
