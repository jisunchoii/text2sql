
CREATE TABLE Equipment (
    equipment_id INT PRIMARY KEY,
    equipment_name VARCHAR(100) NOT NULL,
    needs_diagnosis BOOLEAN NOT NULL,
    location VARCHAR(100),
    installation_date DATE
);

CREATE TABLE Maintenance (
    maintenance_id INT PRIMARY KEY,
    equipment_id INT,
    maintenance_date DATE NOT NULL,
    maintenance_type VARCHAR(50),
    description TEXT,
    FOREIGN KEY (equipment_id) REFERENCES Equipment(equipment_id)
);

CREATE TABLE Technician (
    technician_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact_info VARCHAR(100)
);

CREATE TABLE Maintenance_Assignment (
    assignment_id INT PRIMARY KEY,
    maintenance_id INT,
    technician_id INT,
    FOREIGN KEY (maintenance_id) REFERENCES Maintenance(maintenance_id),
    FOREIGN KEY (technician_id) REFERENCES Technician(technician_id)
);

-- Equipment 테이블에 데이터 삽입
INSERT INTO Equipment (equipment_id, equipment_name, needs_diagnosis, location, installation_date) VALUES
(1, '컨베이어 벨트 A', TRUE, '공장 1층', '2020-01-15'),
(2, '로봇 팔 B', FALSE, '공장 2층', '2021-03-22'),
(3, '포장기 C', TRUE, '창고', '2019-11-30'),
(4, '용접기 D', FALSE, '공장 1층', '2022-05-10'),
(5, '프레스 기계 E', TRUE, '공장 3층', '2018-07-05');

-- Maintenance 테이블에 데이터 삽입
INSERT INTO Maintenance (maintenance_id, equipment_id, maintenance_date, maintenance_type, description) VALUES
(1, 1, '2023-01-10', '정기 점검', '벨트 장력 조정 및 윤활'),
(2, 1, '2023-06-15', '고장 수리', '모터 교체'),
(3, 2, '2023-04-20', '정기 점검', '센서 캘리브레이션'),
(4, 3, '2023-02-28', '정기 점검', '필터 교체'),
(5, 3, '2023-07-05', '고장 수리', '제어 보드 교체'),
(6, 4, '2023-03-12', '정기 점검', '전극 교체 및 청소'),
(7, 5, '2023-05-18', '정기 점검', '유압 시스템 점검');

-- Technician 테이블에 한국인 이름으로 더미 데이터 삽입
INSERT INTO Technician (technician_id, name, contact_info) VALUES
(1, '김철수', 'kim.cheolsu@example.com'),
(2, '이영희', 'lee.younghee@example.com'),
(3, '박민수', 'park.minsu@example.com');

-- Maintenance_Assignment 테이블에 더미 데이터 삽입
INSERT INTO Maintenance_Assignment (assignment_id, maintenance_id, technician_id) VALUES (1, 1, 1), (2, 2, 2), (3, 3, 3);