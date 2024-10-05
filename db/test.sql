CREATE TABLE equipment (
    equipment_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    model TEXT NOT NULL,
    location TEXT NOT NULL,
    installation_date DATE,
    status TEXT
);
CREATE TABLE fault_type (
    fault_type_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    description TEXT
);
CREATE TABLE maintenance_history (
    maintenance_id INTEGER PRIMARY KEY AUTOINCREMENT,
    equipment_id INTEGER,
    fault_type_id INTEGER,
    fault_description TEXT,
    date_reported DATETIME,
    maintenance_action TEXT,
    date_resolved DATETIME,
    technician TEXT,
    resolution_status TEXT,
    FOREIGN KEY (equipment_id) REFERENCES equipment(equipment_id),
    FOREIGN KEY (fault_type_id) REFERENCES fault_type(fault_type_id)
);
CREATE TABLE fault_pattern (
    pattern_id INTEGER PRIMARY KEY AUTOINCREMENT,
    fault_type_id INTEGER,
    pattern_description TEXT,
    suggested_action TEXT,
    FOREIGN KEY (fault_type_id) REFERENCES fault_type(fault_type_id)
);
CREATE TABLE fault_similarity (
    similarity_id INTEGER PRIMARY KEY AUTOINCREMENT,
    fault_type_id_1 INTEGER,
    fault_type_id_2 INTEGER,
    similarity_score FLOAT,
    FOREIGN KEY (fault_type_id_1) REFERENCES fault_type(fault_type_id),
    FOREIGN KEY (fault_type_id_2) REFERENCES fault_type(fault_type_id)
);
CREATE TABLE rag_response_log (
    response_id INTEGER PRIMARY KEY AUTOINCREMENT,
    query_fault_type_id INTEGER,
    similar_pattern_id INTEGER,
    generated_response TEXT,
    date_generated DATETIME,
    FOREIGN KEY (query_fault_type_id) REFERENCES fault_type(fault_type_id),
    FOREIGN KEY (similar_pattern_id) REFERENCES fault_pattern(pattern_id)
);
-- 더미 데이터 삽입
INSERT INTO equipment (name, model, location, installation_date, status) VALUES
('펌프 A', '모델 X1', '공장 1', '2020-01-15', '운영 중'),
('컨베이어 B', '모델 Y2', '공장 2', '2019-03-22', '운영 중'),
('컴프레서 C', '모델 Z3', '공장 1', '2021-05-30', '점검 중'),
('펌프 D', '모델 X2', '공장 3', '2022-08-12', '운영 중'),
('컨베이어 E', '모델 Y1', '공장 2', '2018-11-18', '퇴역'),
('컴프레서 F', '모델 Z2', '공장 3', '2019-02-10', '운영 중'),
('펌프 G', '모델 X3', '공장 1', '2020-07-05', '점검 중'),
('컨베이어 H', '모델 Y3', '공장 2', '2021-01-22', '운영 중'),
('컴프레서 I', '모델 Z1', '공장 3', '2022-03-14', '운영 중'),
('펌프 J', '모델 X4', '공장 1', '2019-06-25', '퇴역');
-- 더미 데이터 삽입
INSERT INTO fault_type (name, description) VALUES
('과열', '설비가 작동 중 과열됩니다.'),
('누수', '시스템 내에서 누수가 감지되었습니다.'),
('전원 실패', '설비가 간헐적으로 전원을 잃습니다.'),
('진동', '설비에서 과도한 진동이 감지되었습니다.'),
('부식', '설비에서 부식이 발견되었습니다.'),
('소음', '설비에서 이상한 소음이 발생합니다.'),
('마모', '설비 부품의 마모가 확인되었습니다.'),
('소프트웨어 오류', '설비 제어 소프트웨어에서 오류가 발생했습니다.'),
('기계적 고장', '기계 부품이 고장났습니다.'),
('교정 문제', '설비가 재교정이 필요합니다.');
-- 더미 데이터 삽입
INSERT INTO maintenance_history (equipment_id, fault_type_id, fault_description, date_reported, maintenance_action, date_resolved, technician, resolution_status) VALUES
(1, 1, '펌프 A가 작동 중 과열되었습니다.', '2024-07-10 14:30', '냉각 시스템을 청소하고 수리했습니다.', '2024-07-10 16:00', '김철수', '완료'),
(2, 2, '컨베이어 B에서 누수가 감지되었습니다.', '2024-07-12 09:15', '손상된 씰을 교체했습니다.', '2024-07-12 11:00', '이영희', '완료'),
(3, 3, '컴프레서 C가 간헐적으로 전원을 잃습니다.', '2024-07-15 11:00', '전원 케이블을 교체했습니다.', '2024-07-15 13:30', '박민수', '완료'),
(4, 4, '펌프 D에서 과도한 진동이 발생했습니다.', '2024-07-20 08:45', '느슨한 볼트를 조였습니다.', '2024-07-20 09:30', '최지우', '완료'),
(5, 5, '컨베이어 E에 부식이 발생했습니다.', '2024-07-25 10:00', '부식 방지 코팅을 적용했습니다.', '2024-07-25 12:00', '정다은', '완료'),
(6, 6, '컴프레서 F에서 이상한 소음이 발생했습니다.', '2024-07-28 15:00', '움직이는 부품에 윤활유를 발랐습니다.', '2024-07-28 16:30', '한준호', '완료'),
(7, 7, '펌프 G에서 마모가 확인되었습니다.', '2024-08-01 10:30', '마모된 부품을 교체했습니다.', '2024-08-01 12:00', '장미경', '완료'),
(8, 8, '컨베이어 H에서 소프트웨어 오류가 발생했습니다.', '2024-08-03 13:15', '소프트웨어를 최신 버전으로 업데이트했습니다.', '2024-08-03 14:00', '김지훈', '완료'),
(9, 9, '컴프레서 I에서 기계적 고장이 발생했습니다.', '2024-08-05 14:45', '손상된 기계 부품을 교체했습니다.', '2024-08-05 17:00', '신예은', '완료'),
(10, 10, '펌프 J의 교정 문제가 발생했습니다.', '2024-08-07 09:00', '설비를 재교정했습니다.', '2024-08-07 10:00', '이준호', '완료');

-- 더미 데이터 삽입
INSERT INTO fault_pattern (fault_type_id, pattern_description, suggested_action) VALUES
(1, '설비가 2시간 연속 작동 후 과열됩니다.', '냉각 시스템을 점검하고 적절한 환기를 보장하십시오.'),
(2, '설비가 최대 용량으로 작동할 때 누수가 발생합니다.', '씰과 연결부를 점검하고 필요시 교체하십시오.'),
(3, '고부하 상태에서 간헐적으로 전원 손실이 발생합니다.', '전원 케이블과 연결부를 점검하고 필요시 교체하십시오.'),
(4, '설비 속도가 500 RPM을 초과할 때 진동이 증가합니다.', '모든 기계 연결부를 점검하고 조여주십시오.'),
(5, '외부 금속 표면에서 부식이 발견됩니다.', '부식 방지 코팅을 적용하고 정기적으로 점검하십시오.'),
(6, '시동 시 이상한 소음이 들립니다.', '움직이는 부품에 윤활유를 바르고 베어링을 점검하십시오.'),
(7, '1000시간 작동 후 부품에서 마모가 발생합니다.', '마모된 부품을 교체하고 정기적으로 유지보수를 수행하십시오.'),
(8, '데이터 처리 중 소프트웨어 오류가 발생합니다.', '소프트웨어를 최신 버전으로 업데이트하고 로그를 확인하십시오.'),
(9, '움직이는 부품에서 기계적 고장이 감지됩니다.', '손상된 부품을 교체하고 시스템 전체를 점검하십시오.'),
(10, '6개월 후 교정이 흐트러집니다.', '설비를 재교정하고 일관성을 모니터링하십시오.');
-- 더미 데이터 삽입
INSERT INTO fault_similarity (fault_type_id_1, fault_type_id_2, similarity_score) VALUES
(1, 2, 0.7),
(1, 3, 0.5),
(2, 4, 0.6),
(3, 4, 0.4),
(5, 6, 0.3),
(7, 8, 0.2),
(8, 9, 0.5),
(9, 10, 0.6),
(1, 4, 0.3),
(2, 3, 0.4);

-- 더미 데이터 삽입
INSERT INTO rag_response_log (query_fault_type_id, similar_pattern_id, generated_response, date_generated) VALUES
(1, 1, '이전 사례에 따르면, 냉각 시스템을 점검하고 적절한 환기를 유지하는 것이 좋습니다.', '2024-08-10 09:30'),
(2, 2, '과거 유사한 문제에서는, 씰과 연결부를 점검하고 필요시 교체하는 것이 권장되었습니다.', '2024-08-10 10:00'),
(3, 3, '고부하 상태에서 발생하는 전원 손실 문제는, 전원 케이블과 연결부를 점검하는 것으로 해결되었습니다.', '2024-08-10 10:30'),
(4, 4, '진동 문제가 발생할 때는, 모든 기계 연결부를 점검하고 조여주는 것이 효과적이었습니다.', '2024-08-10 11:00'),
(5, 5, '부식 문제를 해결하려면, 부식 방지 코팅을 적용하고 정기적으로 점검하는 것이 좋습니다.', '2024-08-10 11:30'),
(6, 6, '이상 소음 발생 시, 움직이는 부품에 윤활유를 바르고 베어링을 점검하는 것이 권장되었습니다.', '2024-08-10 12:00'),
(7, 7, '부품 마모 문제는, 마모된 부품을 교체하고 정기적으로 유지보수를 수행하여 해결할 수 있습니다.', '2024-08-10 12:30'),
(8, 8, '소프트웨어 오류가 발생할 때는, 소프트웨어를 최신 버전으로 업데이트하고 로그를 확인하는 것이 효과적입니다.', '2024-08-10 13:00'),
(9, 9, '기계적 고장이 발생한 경우, 손상된 부품을 교체하고 시스템 전체를 점검하는 것이 필요합니다.', '2024-08-10 13:30'),
(10, 10, '교정 문제를 해결하기 위해, 설비를 재교정하고 일관성을 모니터링하는 것이 중요합니다.', '2024-08-10 14:00');
