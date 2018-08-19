Feature: parking

Scenario Outline: จอดรถ 0-1 ชั่วโมง
    Given ขับรถมาถึงจุดรับบัตร รับบัตรจอดรถ เมื่อเวลา <starttime> และ ขับรถออกมาคืนบัตร เมื่อเวลา <endtime>
    When จำนวนเวลาจอดรถ 0 - 1 ชั่วโมง
    Then ฉันต้องจ่ายเงิน <expected> บาท

    Examples:
    | starttime             | endtime               | expected  |
    | "19-08-2018 00:00:00" | "19-08-2018 00:00:00" | 25        |
    | "19-08-2018 00:00:00" | "19-08-2018 00:00:01" | 25        |
    | "19-08-2018 01:00:00" | "19-08-2018 02:00:00" | 25        |

Scenario Outline: จอดรถ 1-2 ชั่วโมง
    Given ขับรถมาถึงจุดรับบัตร รับบัตรจอดรถ เมื่อเวลา <starttime> และ ขับรถออกมาคืนบัตร เมื่อเวลา <endtime>
    When จำนวนเวลาจอดรถ 1 - 2 ชั่วโมง
    Then ฉันต้องจ่ายเงิน <expected> บาท

    Examples:
    | starttime             | endtime               | expected  |
    | "19-08-2018 01:00:00" | "19-08-2018 02:00:01" | 50        |
    | "19-08-2018 01:00:00" | "19-08-2018 02:59:59" | 50        |
    | "19-08-2018 01:00:00" | "19-08-2018 03:00:00" | 50        |

Scenario Outline: จอดรถ 2-3 ชั่วโมง
    Given ขับรถมาถึงจุดรับบัตร รับบัตรจอดรถ เมื่อเวลา <starttime> และ ขับรถออกมาคืนบัตร เมื่อเวลา <endtime>
    When จำนวนเวลาจอดรถ 2 - 3 ชั่วโมง
    Then ฉันต้องจ่ายเงิน <expected> บาท

    Examples:
    | starttime             | endtime               | expected  |
    | "19-08-2018 01:00:00" | "19-08-2018 03:00:01" | 80        |
    | "19-08-2018 01:00:00" | "19-08-2018 03:59:59" | 80        |
    | "19-08-2018 01:00:00" | "19-08-2018 04:00:00" | 80        |

Scenario: จอดรถ 3-4 ชั่วโมง
    Given ขับรถมาถึงจุดรับบัตร รับบัตรจอดรถ เมื่อเวลา "19-08-2018 01:00:00" และ ขับรถออกมาคืนบัตร เมื่อเวลา "19-08-2018 04:00:01"
    When จำนวนเวลาจอดรถ 3 - 4 ชั่วโมง
    Then ฉันต้องจ่ายเงิน 110 บาท

Scenario: จอดรถ 4-5 ชั่วโมง
    Given ขับรถมาถึงจุดรับบัตร รับบัตรจอดรถ เมื่อเวลา "19-08-2018 01:00:00" และ ขับรถออกมาคืนบัตร เมื่อเวลา "19-08-2018 05:00:01"
    When จำนวนเวลาจอดรถ 4 - 5 ชั่วโมง
    Then ฉันต้องจ่ายเงิน 145 บาท

Scenario: จอดรถ 5-6 ชั่วโมง
    Given ขับรถมาถึงจุดรับบัตร รับบัตรจอดรถ เมื่อเวลา "19-08-2018 01:00:00" และ ขับรถออกมาคืนบัตร เมื่อเวลา "19-08-2018 06:00:01"
    When จำนวนเวลาจอดรถ 5 - 6 ชั่วโมง
    Then ฉันต้องจ่ายเงิน 180 บาท

Scenario Outline: จอดรถ 7-24 ชั่วโมง
    Given ขับรถมาถึงจุดรับบัตร รับบัตรจอดรถ เมื่อเวลา <starttime> และ ขับรถออกมาคืนบัตร เมื่อเวลา <endtime>
    When จำนวนเวลาจอดรถ 7 - 24 ชั่วโมง
    Then ฉันต้องจ่ายเงิน <expected> บาท

    Examples:
    | starttime             | endtime               | expected  |
    | "19-08-2018 01:00:00" | "19-08-2018 07:00:01" | 250       |
    | "19-08-2018 00:00:00" | "20-08-2018 00:00:00" | 250       |

Scenario: จอดรถข้ามวัน
    Given ขับรถมาถึงจุดรับบัตร รับบัตรจอดรถ เมื่อเวลา "19-08-2018 23:00:00" และ ขับรถออกมาคืนบัตร เมื่อเวลา "20-08-2018 00:00:00"
    When จำนวนเวลาจอดรถ 0 - 1 ชั่วโมง
    Then ฉันต้องจ่ายเงิน 25 บาท

Scenario: จอดรถไม่ถึงชั่วโมง
    กำหนดให้ ขับรถมาถึงจุดรับบัตร รับบัตรจอดรถ เมื่อเวลา "19-08-2018 15:00:00" และ ขับรถออกมาคืนบัตร เมื่อเวลา "19-08-2018 15:59:00"
    เมื่อ จำนวนเวลาจอดรถ 0 - 1 ชั่วโมง
    ดังนั้น ฉันต้องจ่ายเงิน 25 บาท

