-- Create the database
CREATE DATABASE Project_ChildrenCareDB_ver2;
GO

USE Project_ChildrenCareDB_ver2;
GO

-- Create Users table (base table for all user types)
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50),
    MiddleName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100) UNIQUE,
    PhoneNumber NVARCHAR(20),
    DateOfBirth DATE,
    Gender NVARCHAR(10),
    CitizenIdentification NVARCHAR(12),
    ProfileImage NVARCHAR(MAX),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);

-- Create UserAuthentication table
CREATE TABLE UserAuthentication (
    UserID INT PRIMARY KEY,
    Username NVARCHAR(50) UNIQUE,
    PasswordHash NVARCHAR(255),
    Salt NVARCHAR(255),
    LastLogin DATETIME,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);

-- Create Roles table
CREATE TABLE Roles (
    RoleID INT PRIMARY KEY IDENTITY(1,1),
    RoleName NVARCHAR(50) UNIQUE
);

-- Create UserRoles table (for many-to-many relationship between Users and Roles)
CREATE TABLE UserRoles (
    UserID INT,
    RoleID INT,
    PRIMARY KEY (UserID, RoleID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID) 
);

-- Create Address tables
CREATE TABLE Provinces (
    ProvinceID INT PRIMARY KEY IDENTITY(1,1),
    ProvinceName NVARCHAR(100)
);

CREATE TABLE Districts (
    DistrictID INT PRIMARY KEY IDENTITY(1,1),
    ProvinceID INT,
    DistrictName NVARCHAR(100),
    FOREIGN KEY (ProvinceID) REFERENCES Provinces(ProvinceID) ON DELETE CASCADE
);

CREATE TABLE Wards (
    WardID INT PRIMARY KEY IDENTITY(1,1),
    DistrictID INT,
    WardName NVARCHAR(100),
    FOREIGN KEY (DistrictID) REFERENCES Districts(DistrictID) ON DELETE CASCADE
);

CREATE TABLE UserAddresses (
    AddressID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT,
    WardID INT,
    StreetAddress NVARCHAR(255),
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (WardID) REFERENCES Wards(WardID) ON DELETE CASCADE
);

-- Tạo bảng Specializations
CREATE TABLE Specializations (
    SpecializationID INT PRIMARY KEY IDENTITY(1,1),
    SpecializationName NVARCHAR(100) UNIQUE
);

-- Tạo bảng Degrees
CREATE TABLE Degrees (
    DegreeID INT PRIMARY KEY IDENTITY(1,1),
    DegreeName NVARCHAR(50) UNIQUE
);

-- Tạo bảng Categories
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(100) UNIQUE
);

-- Tạo bảng Staff
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    StaffName NVARCHAR(150),
    YearsOfExperience INT CHECK (YearsOfExperience > 0),
    SpecializationID INT,
    DegreeID INT,
    HireDate DATE,
    Salary FLOAT CHECK (Salary > 0),
    FOREIGN KEY (StaffID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (SpecializationID) REFERENCES Specializations(SpecializationID),
    FOREIGN KEY (DegreeID) REFERENCES Degrees(DegreeID)
);

-- Create Children table
CREATE TABLE Children (
    ChildID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    FirstName NVARCHAR(50),
    MiddleName NVARCHAR(50),
    LastName NVARCHAR(50),
    DateOfBirth DATE,
    Gender NVARCHAR(10),
    ChildImage NVARCHAR(MAX),
    FOREIGN KEY (CustomerID) REFERENCES Users(UserID) ON DELETE CASCADE
);

-- Create AgeLimits table
CREATE TABLE AgeLimits (
    AgeLimitID INT PRIMARY KEY IDENTITY(1,1),
    AgeLimit NVARCHAR(50) UNIQUE
);

-- Create Services table
CREATE TABLE Services (
    ServiceID INT PRIMARY KEY IDENTITY(1,1),
    ServiceName NVARCHAR(100),
	CategoryID INT,
	DegreeID INT,
    Description NVARCHAR(MAX),
    Price FLOAT CHECK (Price > 0),
    Duration INT CHECK (Duration > 0), -- in minutes
    ServiceImage NVARCHAR(255),
    IsActive BIT,
    AgeLimitID INT,
	CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
	FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
	FOREIGN KEY (DegreeID) REFERENCES Degrees(DegreeID),
    FOREIGN KEY (AgeLimitID) REFERENCES AgeLimits(AgeLimitID)
);

-- Create Orders table
CREATE TABLE Orders(
	OrderID INT PRIMARY KEY IDENTITY(1,1),
	CustomerID INT,
	Quantity INT CHECK (Quantity > 0),
	TotalPrice FLOAT CHECK (TotalPrice > 0),
	OrderDate DATETIME DEFAULT GETDATE(),
	isCheckOut BIT,
	FOREIGN KEY (CustomerID) REFERENCES Users(UserID) ON DELETE CASCADE
)

-- Create OrderItems table
CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ServiceID INT,
    ChildID INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID) ON DELETE CASCADE,
    FOREIGN KEY (ChildID) REFERENCES Children(ChildID) ON DELETE NO ACTION
);

-- Create Reservations table
CREATE TABLE Reservations (
    ReservationID INT PRIMARY KEY IDENTITY(1,1),
	OrderItemID INT,
    ReservationDate DATE,
    StartTime TIME,
	StaffID INT,
	isExam BIT,
	hasRecord BIT DEFAULT 0,
	FOREIGN KEY (OrderItemID) REFERENCES OrderItems(OrderItemID) ON DELETE NO ACTION,
	FOREIGN KEY (StaffID) REFERENCES Staff(StaffID) ON DELETE CASCADE,
);

-- Create MedicalRecords table
CREATE TABLE MedicalRecords (
    RecordID INT PRIMARY KEY IDENTITY(1,1),
    ChildID INT,
    StaffID INT,
    ReservationID INT,
    Diagnosis NVARCHAR(MAX),
    Treatment NVARCHAR(MAX),
    Notes NVARCHAR(MAX),
    RecordDate DATE,
    FOREIGN KEY (ChildID) REFERENCES Children(ChildID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID) ON DELETE CASCADE,
    FOREIGN KEY (ReservationID) REFERENCES Reservations(ReservationID)
);
-- Create MedicineCategory table
CREATE TABLE MedicineCategory (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),  
    CategoryName NVARCHAR(255) NOT NULL          
);

-- Create Medicine table
CREATE TABLE Medicine (
    MedicineID INT PRIMARY KEY IDENTITY(1,1),  
    Name NVARCHAR(255) NOT NULL,                  
    Description NVARCHAR(MAX),                    
    Uses NVARCHAR(MAX),                           
    Dosage NVARCHAR(MAX),                         
    UserManual NVARCHAR(MAX),                     
    Contraindications NVARCHAR(MAX),              
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES MedicineCategory(CategoryID)
);

-- Create Prescriptions table
CREATE TABLE Prescriptions (
    PrescriptionID INT PRIMARY KEY IDENTITY(1,1),
    RecordID INT,
    MedicineID INT,
    Dosage NVARCHAR(50),
    Frequency NVARCHAR(50),
    Duration NVARCHAR(50),
    FOREIGN KEY (RecordID) REFERENCES MedicalRecords(RecordID),
    FOREIGN KEY (MedicineID) REFERENCES Medicine(MedicineID)
);

-- Create Feedback table
CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT,
    ServiceID INT,
    UserName NVARCHAR(150),
    Email NVARCHAR(100),
    PhoneNumber NVARCHAR(20),
    -- ReservationDate DATE,
    Rating INT,
    ExperienceRating NVARCHAR(20),
    Comment NVARCHAR(MAX),
    Suggestion NVARCHAR(MAX),
    AttachmentPath NVARCHAR(MAX),
    --FeedbackDate DATE,
    Status BIT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);

-- Create Posts table
CREATE TABLE Posts (
    PostID INT PRIMARY KEY IDENTITY(1,1),
    AuthorID INT,
    Title NVARCHAR(255),
    Content NVARCHAR(MAX),
    PublishedDate DATE,
    IsPublished BIT DEFAULT 0,
    FOREIGN KEY (AuthorID) REFERENCES Users(UserID) ON DELETE CASCADE
);

-- Create Settings table
CREATE TABLE Settings (
    SettingID INT PRIMARY KEY IDENTITY(1,1),
    SettingName NVARCHAR(100) UNIQUE,
    SettingValue NVARCHAR(MAX),
    Description NVARCHAR(255)
);

-- Create Notifications table
CREATE TABLE Notifications (
    NotificationID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT,
    Message NVARCHAR(MAX),
    CreatedAt DATETIME DEFAULT GETDATE(),
    IsRead BIT DEFAULT 0,
    ScheduledDate DATETIME,
    ReminderSent BIT DEFAULT 0,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);

-- Create Payments table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY IDENTITY(1,1),
    ReservationID INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATETIME,
    PaymentStatus NVARCHAR(20),
    PaymentMethod NVARCHAR(50),
    FOREIGN KEY (ReservationID) REFERENCES Reservations(ReservationID)
);

-- Create HealthMetrics table
CREATE TABLE HealthMetrics (
    MetricID INT PRIMARY KEY IDENTITY(1,1),
    ChildID INT,
    Height DECIMAL(5,2),
    Weight DECIMAL(5,2),
    BMI DECIMAL(5,2),
    RecordDate DATE,
    FOREIGN KEY (ChildID) REFERENCES Children(ChildID)
);

-- Create Allergies table
CREATE TABLE Allergies (
    AllergyID INT PRIMARY KEY IDENTITY(1,1),
    ChildID INT,
    AllergyName NVARCHAR(100),
    Severity NVARCHAR(50),
    DiagnosedDate DATE,
    FOREIGN KEY (ChildID) REFERENCES Children(ChildID)
);

-- Create Immunizations table
CREATE TABLE Immunizations (
    ImmunizationID INT PRIMARY KEY IDENTITY(1,1),
    ChildID INT,
    VaccineName NVARCHAR(100),
    DateAdministered DATE,
    NextDueDate DATE,
    FOREIGN KEY (ChildID) REFERENCES Children(ChildID)
);

-- Create DietaryRestrictions table
CREATE TABLE DietaryRestrictions (
    RestrictionID INT PRIMARY KEY IDENTITY(1,1),
    ChildID INT,
    Restriction NVARCHAR(100),
    Reason NVARCHAR(255),
    FOREIGN KEY (ChildID) REFERENCES Children(ChildID)
);

-- Create EmergencyContacts table
CREATE TABLE EmergencyContacts (
    ContactID INT PRIMARY KEY IDENTITY(1,1),
    ChildID INT,
    ContactName NVARCHAR(100),
    Relationship NVARCHAR(50),
    PhoneNumber NVARCHAR(20),
    FOREIGN KEY (ChildID) REFERENCES Children(ChildID)
);

-- Create ActivityLog table
CREATE TABLE ActivityLog (
    LogID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT,
    ActivityType NVARCHAR(50),
    ActivityDescription NVARCHAR(MAX),
    ActivityTimestamp DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);

-- Create PaymentMethods table
CREATE TABLE PaymentMethods (
    PaymentMethodID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT,
    MethodType NVARCHAR(50),
    AccountNumber NVARCHAR(255),  -- Encrypted
    ExpiryDate DATE,
    IsDefault BIT DEFAULT 0,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);

-- Add PaymentMethodID to Payments table
ALTER TABLE Payments
ADD PaymentMethodID INT,
FOREIGN KEY (PaymentMethodID) REFERENCES PaymentMethods(PaymentMethodID);


-- Create Reports table
CREATE TABLE Reports (
    ReportID INT PRIMARY KEY IDENTITY(1,1),
    ReportName NVARCHAR(100),
    ReportType NVARCHAR(50),
    GeneratedBy INT,
    GeneratedDate DATETIME DEFAULT GETDATE(),
    ReportParameters NVARCHAR(MAX),
    ReportData NVARCHAR(MAX),
    ReportStatus NVARCHAR(20) DEFAULT 'Processing',
    DataStartDate DATETIME,
    DataEndDate DATETIME,
    FOREIGN KEY (GeneratedBy) REFERENCES Users(UserID) ON DELETE CASCADE
);

-- Create Blogs table
CREATE TABLE Blogs (
    BlogID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(255) NOT NULL,
    Content NVARCHAR(MAX) NOT NULL,
    AuthorName NVARCHAR(100) NOT NULL,
    CreatedDate DATETIME DEFAULT GETDATE(),
    UpdatedDate DATETIME DEFAULT GETDATE(),
    IsPublished BIT DEFAULT 0,
    ThumbnailPath NVARCHAR(255),
    Views INT DEFAULT 0

);

-- Create BlogCategories table
CREATE TABLE BlogCategories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(100) NOT NULL
   
);

-- Create BlogCategoryMapping table
CREATE TABLE BlogCategoryMapping (
    BlogID INT,
    CategoryID INT,
    PRIMARY KEY (BlogID, CategoryID),
    FOREIGN KEY (BlogID) REFERENCES Blogs(BlogID),
    FOREIGN KEY (CategoryID) REFERENCES BlogCategories(CategoryID)
);

-- Create BlogComments table
CREATE TABLE BlogComments (
    CommentID INT PRIMARY KEY IDENTITY(1,1),
    BlogID INT,
    UserID INT,
    Content NVARCHAR(MAX) NOT NULL,
    CreatedDate DATETIME DEFAULT GETDATE(),
    IsApproved BIT DEFAULT 0,
    FOREIGN KEY (BlogID) REFERENCES Blogs(BlogID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);

-- Add indexes to improve query performance
CREATE INDEX IX_Blogs_CreatedDate ON Blogs(CreatedDate);
CREATE INDEX IX_BlogComments_BlogID ON BlogComments(BlogID);

-- Insert default roles
INSERT INTO Roles (RoleName) VALUES 
('Administrator'), ('Manager'), ('Staff'), ('Customer'), ('Guest');

-- Insert some sample settings
INSERT INTO Settings (SettingName, SettingValue, Description) VALUES
('SiteName', 'Children Care Center', 'Name of the website'),
('ContactEmail', 'contact@childrencare.com', 'Contact email for the website'),
('MaxReservationsPerDay', '50', 'Maximum number of reservations allowed per day');

INSERT INTO AgeLimits (AgeLimit) VALUES 
(N'Trẻ sơ sinh'),
(N'Từ 1 đến 5 tuổi'),
(N'Từ 6 đến 12 tuổi'),
(N'Từ 13 đến 18 tuổi');


-- Thêm dữ liệu vào bảng Specializations
INSERT INTO Specializations (SpecializationName) VALUES (N'Khoa Nhi');
INSERT INTO Specializations (SpecializationName) VALUES (N'Khoa Mắt');
INSERT INTO Specializations (SpecializationName) VALUES (N'Khoa Da liễu');
INSERT INTO Specializations (SpecializationName) VALUES (N'Khoa Tâm lý');
INSERT INTO Specializations (SpecializationName) VALUES (N'Khoa Sản');
INSERT INTO Specializations (SpecializationName) VALUES (N'Khoa Răng hàm mặt');


-- Thêm dữ liệu vào bảng Degrees
INSERT INTO Degrees (DegreeName) VALUES (N'Bác sĩ'), (N'Y tá'), (N'Điều dưỡng'), (N'Tư vấn viên');


-- Thêm dữ liệu vào bảng Categories
INSERT INTO Categories (CategoryName) VALUES (N'Khám và điều trị bệnh'), (N'Tiêm chủng'),
 (N'Tư vấn'), (N'Chăm sóc'), (N'Gói dịch vụ');


INSERT INTO Services (ServiceName, CategoryID, DegreeID, Description, Price, Duration, ServiceImage, IsActive, AgeLimitID) VALUES
(N'Khám sức khỏe tổng quát cho trẻ sơ sinh', 1, 1, N'Đo chiều cao, cân nặng, vòng đầu, kiểm tra tim phổi, tư vấn dinh dưỡng, tiêm chủng', 200000, 40, 'img/kham-suc-khoe-tong-quat-cho-tre-so-sinh.jpg', 1, 1),
(N'Tiêm chủng cho trẻ sơ sinh', 2, 2, N'Tiêm các loại vắc xin theo lịch tiêm chủng, theo dõi phản ứng sau tiêm', 150000, 30, 'img/tiem-chung-cho-tre-so-sinh.png', 1, 1),
(N'Tư vấn về chăm sóc trẻ sơ sinh', 3, 4, N'Tư vấn về giấc ngủ, dinh dưỡng, các vấn đề thường gặp ở trẻ sơ sinh', 200000, 60, 'img/tu-van-cham-soc-tre-so-sinh.jpg', 1, 1),
(N'Gói chăm sóc trẻ sơ sinh trọn gói (1 tháng) cho trẻ sơ sinh', 5, 1, N'Bao gồm khám sức khỏe định kỳ, chăm sóc tại nhà, tư vấn dinh dưỡng, tiêm chủng', 5000000, 60, 'img/kham-suc-khoe-tong-quat-cho-tre-so-sinh.jpg', 0, 1),
(N'Massage sơ sinh', 4, 3, N'Giúp bé thư giãn, tăng cường tuần hoàn máu, phát triển các giác quan', 200000, 45, 'img/massage-cho-tre-so-sinh.jpg', 1, 1),
(N'Tắm bé sơ sinh bằng thảo dược', 4, 3, N'Làm sạch da, giảm ngứa, tạo cảm giác dễ chịu cho bé', 250000, 45, 'img/tam-thao-duoc-cho-tre-so-sinh.jpg', 1, 1),
(N'Khám và điều trị rôm sảy, mẩn ngứa ở trẻ sơ sinh', 1, 1, N'Khám, chẩn đoán và điều trị các bệnh về da ở trẻ sơ sinh', 300000, 45, 'img/kham-benh-rom-say-cho-tre-so-sinh.jpg', 0, 1),
(N'Khám và điều trị vàng da ở trẻ sơ sinh', 1, 1, N'Theo dõi mức bilirubin, tư vấn điều trị tại nhà', 300000, 45, 'img/kham-benh-vang-da-cho-tre-so-sinh.jpg', 0, 1),

(N'Khám sức khỏe tổng quát cho trẻ từ 1 đến 5 tuổi', 1, 1, N'Đo chiều cao, cân nặng, kiểm tra thị lực, tư vấn phát triển, tiêm chủng', 250000, 45, 'img/kham-suc-khoe-tong-quat-cho-tre-tu-1-den-5.jpg', 1, 2),
(N'Khám và điều trị các bệnh thông thường cho trẻ từ 1 đến 5 tuổi', 1, 1, N'Sốt, ho, cảm cúm, tiêu chảy, viêm tai giữa...', 300000, 45, 'img/kham-va-dieu-tri-cac-benh-thong-thuong-cho-tre-tu-1-den-5.jpg', 1, 2),
(N'Gói khám sức khỏe định kỳ 6 tháng cho trẻ từ 1 đến 5 tuổi', 5, 1, N'Bao gồm 2 lần khám sức khỏe tổng quát, tư vấn dinh dưỡng, tiêm chủng', 1200000, 60, 'img/kham-suc-khoe-tong-quat-cho-tre-tu-1-den-5.jpg', 0, 2),
(N'Tiêm chủng cho trẻ từ 1 đến 5 tuổi', 2, 2, N'Tiêm các loại vắc xin theo lịch tiêm chủng, theo dõi phản ứng sau tiêm', 150000, 30, 'img/tiem-chung-cho-tre-tu-1-den-5.png', 1, 2),
(N'Tư vấn tâm lý cho trẻ từ 1 đến 5 tuổi', 3, 4, N'Hỗ trợ trẻ vượt qua các vấn đề về cảm xúc, hành vi', 300000, 60, 'img/tu-van-tam-ly-cho-tre-tu-1-den-5.jpg', 1, 2),
(N'Gói chăm sóc răng miệng cho trẻ từ 1 đến 5 tuổi', 5, 3, N'Khám răng, vệ sinh răng miệng, tư vấn chăm sóc răng miệng', 200000, 45, 'img/cham-soc-rang-mieng-cho-tre-tu-1-den-5.jpg', 1, 2),

(N'Khám sức khỏe tổng quát cho trẻ từ 6 đến 12 tuổi', 1, 1, N'Đo chiều cao, cân nặng, kiểm tra thị lực, tư vấn dậy thì, tiêm chủng', 300000, 45, 'img/kham-suc-khoe-tong-quat-cho-tre-tu-6-den-12.jpg', 1, 3),
(N'Tư vấn tâm lý cho trẻ em từ 6 đến 12 tuổi', 3, 4, N'Hỗ trợ trẻ vượt qua các vấn đề tâm lý, căng thẳng học tập...', 300000, 60, 'img/tu-van-tam-ly-cho-tre-tu-6-den-12.jpg', 1, 3),
(N'Gói khám sức khỏe định kỳ hàng năm cho trẻ từ 6 đến 12 tuổi', 5, 1, N'Bao gồm khám sức khỏe tổng quát, tư vấn dinh dưỡng, tiêm chủng, khám chuyên khoa (nếu cần)', 1500000, 60, 'img/kham-suc-khoe-tong-quat-cho-tre-tu-6-den-12.jpg', 0, 3),
(N'Tư vấn về dinh dưỡng cho trẻ em từ 6 đến 12 tuổi', 3, 4, N'Tư vấn chế độ ăn uống cân đối, lành mạnh', 250000, 60, 'img/tu-van-dinh-duong-cho-tre-tu-6-den-12.png', 1, 3),
(N'Khám và điều trị các vấn đề về mắt cho trẻ từ 6 đến 12 tuổi', 1, 1, N'Khám mắt, điều trị cận thị, viễn thị...', 250000, 45, 'img/kham-va-dieu-tri-cac-van-de-ve-mat-cho-tre-tu-6-den-12.png', 1, 3),
(N'Tiêm chủng cho trẻ từ 6 đến 12 tuổi', 2, 2, N'Tiêm các loại vắc xin theo lịch tiêm chủng, theo dõi phản ứng sau tiêm', 150000, 30, 'img/tiem-chung-cho-tre-tu-6-den-12.png', 1, 3),

(N'Khám sức khỏe tổng quát cho trẻ từ 13 đến 18 tuổi', 1, 1, N'Đo chiều cao, cân nặng, kiểm tra thị lực, tư vấn sức khỏe sinh sản, tiêm chủng', 350000, 45, 'img/kham-suc-khoe-tong-quat-cho-tre-tu-13-den-18.jpg', 1, 4),
(N'Khám và điều trị các bệnh lý tuổi dậy thì cho trẻ từ 13 đến 18 tuổi', 1, 1, N'Rối loạn kinh nguyệt, dậy thì sớm, dậy thì muộn...', 400000, 60, 'img/kham-va-dieu-tri-benh-ly-tuoi-day-thi.jpg', 1, 4),
(N'Tư vấn tâm lý cho thanh thiếu niên', 3, 4, N'Hỗ trợ thanh thiếu niên vượt qua các vấn đề tâm lý, căng thẳng học tập, định hướng nghề nghiệp...', 350000, 60, 'img/tu-van-tam-ly-cho-tre-tu-13-den-18.jpg', 1, 4),
(N'Gói khám sức khỏe định kỳ hàng năm cho trẻ từ 13 đến 18 tuổi', 5, 1, N'Bao gồm khám sức khỏe tổng quát, tư vấn sức khỏe sinh sản, tiêm chủng, khám chuyên khoa (nếu cần)', 1800000, 60, 'img/kham-suc-khoe-tong-quat-cho-tre-tu-13-den-18.jpg', 0, 4),
(N'Tiêm chủng cho trẻ từ 13 đến 18 tuổi', 2, 2, N'Tiêm các loại vắc xin theo lịch tiêm chủng, theo dõi phản ứng sau tiêm', 150000, 30, 'img/tiem-chung-cho-tre-tu-13-den-18.png', 1, 4),
(N'Tư vấn về sức khỏe sinh sản cho trẻ từ 13 đến 18 tuổi', 3, 4, N'Tư vấn về các vấn đề liên quan đến giới tính, tình dục an toàn, tránh thai', 300000, 60, 'img/tu-van-suc-khoe-sinh-san.jpg', 1, 4)



INSERT INTO MedicineCategory (CategoryName) 
VALUES 
(N'Thuốc da liễu'),
(N'Thuốc hạ sốt'),
(N'Thuốc tiêm chủng'),
(N'Thuốc kháng sinh'),
(N'Thuốc giảm đau'),
(N'Thực phẩm chức năng');

INSERT INTO MedicineCategory (CategoryName) 
VALUES 
(N'Thuốc bổ'),
(N'Thuốc dị ứng');


INSERT INTO Medicine (Name, Description, Uses, Dosage, UserManual, Contraindications, CategoryID) 
VALUES 
-- Thuốc da liễu
(N'Kem chống hăm', N'Dược Phẩm ABC', N'Dùng để điều trị hăm tã ở trẻ em', N'Thoa 2 lần/ngày', N'Thoa trực tiếp lên vùng da bị tổn thương', N'Không sử dụng cho trẻ em dưới 1 tháng tuổi', 1),
(N'Thuốc mỡ Hydrocortisone', N'Dược Phẩm XYZ', N'Điều trị viêm da cơ địa và dị ứng', N'Thoa 1-2 lần/ngày', N'Sử dụng theo chỉ dẫn của bác sĩ', N'Không dùng cho trẻ dưới 2 tuổi', 1),

-- Thuốc hạ sốt
(N'Paracetamol', N'Dược Phẩm DEF', N'Hạ sốt, giảm đau', N'10-15 mg/kg, mỗi 4-6 giờ', N'Uống với nước hoặc sữa', N'Không dùng quá liều quy định', 2),
(N'Ibuprofen', N'Dược Phẩm GHI', N'Giảm đau, hạ sốt, kháng viêm', N'5-10 mg/kg, mỗi 6-8 giờ', N'Dùng sau bữa ăn để tránh kích ứng dạ dày', N'Không sử dụng cho trẻ em có bệnh về gan', 2),

-- Thuốc tiêm chủng
(N'Vắc xin Sởi', N'Viện Vắc Xin Việt Nam', N'Ngừa bệnh sởi cho trẻ em', N'0.5 ml tiêm bắp tay', N'Tiêm theo lịch trình tiêm chủng quốc gia', N'Không dùng cho trẻ em có tiền sử dị ứng nặng với vắc xin', 3),
(N'Vắc xin Viêm gan B', N'Viện Vắc Xin Việt Nam', N'Ngừa viêm gan B cho trẻ sơ sinh', N'0.5 ml tiêm bắp đùi', N'Tiêm ngay sau khi sinh trong vòng 24 giờ', N'Không sử dụng nếu trẻ bị dị ứng với thành phần của vắc xin', 3),

-- Thuốc kháng sinh
(N'Amoxicillin', N'Dược Phẩm LMN', N'Điều trị nhiễm khuẩn hô hấp, tai mũi họng', N'25-50 mg/kg/ngày, chia 2-3 lần', N'Dùng trước hoặc sau bữa ăn', N'Không dùng cho trẻ em dị ứng với penicillin', 4),
(N'Azithromycin', N'Dược Phẩm PQR', N'Điều trị nhiễm khuẩn da, đường hô hấp', N'10 mg/kg/ngày, dùng trong 3 ngày', N'Uống trước bữa ăn 1 giờ hoặc sau bữa ăn 2 giờ', N'Không dùng cho trẻ em có bệnh gan nặng', 4),

-- Thuốc giảm đau
(N'Acetaminophen', N'Dược Phẩm STU', N'Giảm đau nhẹ và vừa, hạ sốt', N'15 mg/kg, mỗi 6 giờ nếu cần', N'Uống với nước', N'Không dùng quá liều quy định', 5),
(N'Diclofenac', N'Dược Phẩm VWX', N'Giảm đau và viêm, thường dùng trong trường hợp đau sau phẫu thuật', N'1-2 mg/kg/ngày', N'Dùng theo chỉ định của bác sĩ', N'Không dùng cho trẻ có bệnh dạ dày, ruột', 5);

INSERT INTO Provinces (ProvinceName) 
VALUES (N'Thành phố Hồ Chí Minh');

INSERT INTO Districts (ProvinceID, DistrictName) VALUES 
    (1, N'Quận 1'),
    (1, N'Quận 2'),
    (1, N'Quận 3'),
    (1, N'Quận 4'),
    (1, N'Quận 5'),
    (1, N'Quận 6'),
    (1, N'Quận 7'),
    (1, N'Quận 8'),
    (1, N'Quận 9'),
    (1, N'Quận 10'),
    (1, N'Quận 11'),
    (1, N'Quận 12'),
    (1, N'Quận Bình Tân'),
    (1, N'Quận Bình Thạnh'),
    (1, N'Quận Gò Vấp'),
    (1, N'Quận Phú Nhuận'),
    (1, N'Quận Tân Bình'),
    (1, N'Quận Tân Phú'),
    (1, N'Quận Thủ Đức'),
    (1, N'Huyện Bình Chánh'),
    (1, N'Huyện Cần Giờ'),
    (1, N'Huyện Củ Chi'),
    (1, N'Huyện Hóc Môn'),
    (1, N'Huyện Nhà Bè');

INSERT INTO Wards (DistrictID, WardName) VALUES
(1, N'Phường Bến Nghé'),
(1, N'Phường Bến Thành'),
(1, N'Phường Cầu Kho'),
(1, N'Phường Cầu Ông Lãnh'),
(1, N'Phường Cô Giang'),
(1, N'Phường Đa Kao'),
(1, N'Phường Nguyễn Cư Trinh'),
(1, N'Phường Nguyễn Thái Bình'),
(1, N'Phường Phạm Ngũ Lão'),
(1, N'Phường Tân Định');

INSERT INTO Wards (DistrictID, WardName) VALUES
(2, N'Phường An Khánh'),
(2, N'Phường An Lợi Đông'),
(2, N'Phường An Phú'),
(2, N'Phường Bình An'),
(2, N'Phường Bình Khánh'),
(2, N'Phường Bình Trưng Đông'),
(2, N'Phường Bình Trưng Tây'),
(2, N'Phường Cát Lái'),
(2, N'Phường Thạnh Mỹ Lợi'),
(2, N'Phường Thảo Điền'),
(2, N'Phường Thủ Thiêm');

INSERT INTO Users (FirstName, MiddleName, LastName, Email, PhoneNumber, DateOfBirth, Gender, CitizenIdentification, ProfileImage)
VALUES 
(N'Nguyễn',N'Văn', N'A', 'nguyenvana@example.com', '0123456789', '2010-01-01', N'Nam', '123456789', NULL),
(N'Trần', N'Thị', N'B', 'tranthib@example.com', '0987654321', '2012-05-15', N'Nữ', '987654321', NULL),
(N'Lê',N'Minh', N'C', 'leminhc@example.com', '0112233445', '2015-10-20', N'Nam', '192837465', NULL);

INSERT INTO UserRoles (UserID, RoleID)
VALUES 
(1, 5), -- Người dùng 1 được gán vai trò Customer
(2, 5), -- Người dùng 2 được gán vai trò Customer
(3, 3); 

INSERT INTO UserAddresses (UserID, WardID, StreetAddress)
VALUES 
(1, 1,N'123 Đường ABC, Phường Bến Nghé'),
(2, 2, N'456 Đường DEF, Phường An Khánh'),
(3, 1, N'789 Đường GHI, Phường Bến Thành');

INSERT INTO UserAuthentication (UserID, Username, PasswordHash, Salt, LastLogin)
VALUES 
(1, 'user1', 'hashed_password1', 'salt1', GETDATE()),
(2, 'user2', 'hashed_password2', 'salt2', GETDATE()),
(3, 'user3', 'hashed_password3', 'salt3', GETDATE());

INSERT INTO Feedback 
    (UserID, ServiceID, UserName, Email, PhoneNumber, Rating, ExperienceRating, Comment, Suggestion, AttachmentPath, Status)
VALUES 
    (1, 1, N'Nguyễn Văn A', N'nguyenvana@example.com', '1234567890', 5, N'Xuất sắc', N'Dịch vụ tuyệt vời!', N'Không có', '/attachments/feedback1.jpg',  1),
    (2, 2, N'Trần Thị B', N'tranthib@example.com', '0987654321', 4, N'Tốt', N'Hài lòng với dịch vụ', N'Tùy chọn giá cả tốt hơn', '/attachments/feedback2.jpg', 1),
    (3, 3, N'Lê Minh C', N'leminhc@example.com', '1231231234', 3, N'Trung bình', N'Dịch vụ tạm ổn', N'Cải thiện thời gian phản hồi', '/attachments/feedback3.jpg', 0);


INSERT INTO Children (CustomerID, FirstName, MiddleName, LastName, DateOfBirth, Gender, ChildImage)
VALUES 
(1, N'Nguyễn', N'Văn', N'D', '2010-01-01', N'Nam', NULL),
(1, N'Trần', N'Thị', N'E', '2012-05-15', N'Nữ', NULL),
(3, N'Lê', N'Minh', N'F', '2015-10-20', N'Nam', NULL);


INSERT INTO HealthMetrics (ChildID, Height, Weight, BMI, RecordDate)
VALUES (1, 120.5, 45.6, 18.7, '2024-10-07');
INSERT INTO Allergies (ChildID, AllergyName, Severity, DiagnosedDate)
VALUES (1, 'Peanut Allergy', 'Severe', '2022-05-15');
INSERT INTO Immunizations (ChildID, VaccineName, DateAdministered, NextDueDate)
VALUES (1, 'MMR Vaccine', '2023-03-10', '2024-03-10');
INSERT INTO DietaryRestrictions (ChildID, Restriction, Reason)
VALUES (1, 'Lactose Intolerance', 'Causes stomach pain and discomfort');
INSERT INTO EmergencyContacts (ChildID, ContactName, Relationship, PhoneNumber)
VALUES (1, 'John Doe', 'Father', '0987654321');


INSERT INTO Staff (StaffID, StaffName, YearsOfExperience, SpecializationID, DegreeID, HireDate, Salary)
VALUES 
(3, N'Lê Minh C', 5, 1, 1, '2020-01-15', 50000.0);


--update Reservations set isExam = 0 where OrderItemID = 2
-- Cập nhật Quantity trong bảng Orders
UPDATE Orders
SET Quantity = (
    SELECT COUNT(*)
    FROM OrderItems
    WHERE OrderItems.OrderID = Orders.OrderID
);

/*CREATE VIEW StaffView AS
SELECT u.UserID AS StaffID, 
       u.FirstName + ' ' + u.MiddleName + ' ' + u.LastName AS StaffName, 
       s.YearsOfExperience, 
       s.SpecializationID, 
       s.DegreeID, 
       s.HireDate, 
       s.Salary
FROM Users u
JOIN UserRoles ur ON u.UserID = ur.UserID
JOIN Roles r ON ur.RoleID = r.RoleID
LEFT JOIN Staff s ON u.UserID = s.StaffID
WHERE r.RoleID = 3; 

CREATE OR ALTER VIEW ChildrenAgeView AS
SELECT 
    ChildID,
    CustomerID,
    FirstName,
    MiddleName,
    LastName,
    DateOfBirth,
    Gender,
    ChildImage,
    DATEDIFF(YEAR, DateOfBirth, GETDATE()) - 
        CASE 
            WHEN (MONTH(DateOfBirth) > MONTH(GETDATE())) OR 
                 (MONTH(DateOfBirth) = MONTH(GETDATE()) AND DAY(DateOfBirth) > DAY(GETDATE()))
            THEN 1
            ELSE 0
        END AS Age
FROM Children;

select * from StaffView

select * from Orders

select * from OrderItems

SELECT * FROM Reservations
*/

select r.ReservationID, r.OrderItemID, r.StaffID, o.ServiceID, o.ChildID from Reservations r join OrderItems o on r.OrderItemID = o.OrderItemID



SELECT 
    s.StaffID,
    s.StaffName,
    sp.SpecializationName as Specialization,
    r.ReservationDate,
    r.StartTime
FROM Staff s
INNER JOIN Specializations sp ON s.SpecializationID = sp.SpecializationID
INNER JOIN Reservations r ON s.StaffID = r.StaffID
WHERE r.ReservationDate BETWEEN '2023-10-05' AND DATEADD(day, 6, '2023-10-05')
ORDER BY r.ReservationDate, r.StartTime