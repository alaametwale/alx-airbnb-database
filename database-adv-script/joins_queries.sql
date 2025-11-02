-- 0. اكتب استعلاما باستخدام FULL OUTER JOIN لاسترداد جميع المستخدمين وجميع الحجوزات، حتى إذا لم يكن لدى المستخدم حجز أو لم يكن الحجز مرتبطا بمستخدم.
-- (في MySQL، نستخدم UNION بين LEFT JOIN و RIGHT JOIN لتحقيق FULL OUTER JOIN)

-- الجزء الأول: LEFT JOIN (يجلب جميع المستخدمين + حجوزاتهم المطابقة)
SELECT
    U.id AS user_id, 
    U.first_name, 
    B.id AS booking_id,
    B.property_id
FROM 
    users AS U
LEFT JOIN 
    bookings AS B 
ON 
    U.id = B.user_id

UNION 

-- الجزء الثاني: RIGHT JOIN (يجلب جميع الحجوزات + المستخدمين المطابقين)
-- هذا الجزء ضروري لجلب الحجوزات التي ليس لها مستخدم مطابق (حجز يتيم)، والتي قد تكون نادرة في الواقع
SELECT
    U.id AS user_id, 
    U.first_name, 
    B.id AS booking_id,
    B.property_id
FROM 
    users AS U
RIGHT JOIN 
    bookings AS B 
ON 
    U.id = B.user_id
-- لا نحتاج إلى إضافة شرط WHERE هنا لأن UNION تزيل التكرارات تلقائياً
;