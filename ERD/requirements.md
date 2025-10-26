# Entity-Relationship Diagram Requirements for an Airbnb-like Database

## 1. Entities and Attributes (الكيانات والسمات)

| الكيان (Entity) | الوصف | السمات الرئيسية (Key Attributes) |
| :--- | :--- | :--- |
| **`User` (المستخدم)** | يمثل الأشخاص الذين يستخدمون المنصة (المضيفين أو الضيوف). | `user_id` (PK)، `email`، `password_hash`، `first_name`، `last_name`، `phone_number`، `created_at`. |
| **`Property` (مكان الإقامة)** | يمثل العقارات المتاحة للحجز. | `property_id` (PK)، `host_id` (FK يشير إلى `User`)، `title`، `description`، `address`، `city`، `price_per_night`، `max_guests`، `number_of_rooms`، `is_available`. |
| **`Booking` (الحجز)** | يمثل حجزًا تم إجراؤه من قبل ضيف. | `booking_id` (PK)، `guest_id` (FK يشير إلى `User`)، `property_id` (FK يشير إلى `Property`)، `check_in_date`، `check_out_date`، `total_price`، `status`. |
| **`Amenity` (المرفق)** | يمثل الميزات أو المرافق المتاحة. | `amenity_id` (PK)، `name`، `description`. |
| **`Review` (التقييم)** | يمثل تقييمًا يتركه ضيف. | `review_id` (PK)، `property_id` (FK يشير إلى `Property`)، `guest_id` (FK يشير إلى `User`)، `rating`، `comment`، `created_at`. |
| **`Property_Amenity`** | جدول ربط بين أماكن الإقامة والمرافق (للعلاقة M:N). | `property_id` (FK, PK مركب)، `amenity_id` (FK, PK مركب). |

## 2. Defining Relationships (تحديد العلاقات)

| الكيانات المتصلة | العلاقة (Relationship) | نوع العلاقة (Cardinality) | الوصف |
| :--- | :--- | :--- | :--- |
| **`User`** و **`Property`** | **HOSTS** | **واحد لمتعدد (1:M)** | المضيف (User) الواحد يمتلك العديد من أماكن الإقامة (Property). |
| **`User`** و **`Booking`** | **MAKES** | **واحد لمتعدد (1:M)** | الضيف (User) الواحد يمكنه إجراء العديد من الحجوزات (Booking). |
| **`Property`** و **`Booking`** | **IS_BOOKED_IN** | **واحد لمتعدد (1:M)** | مكان الإقامة الواحد يمكن أن يكون له العديد من الحجوزات. |
| **`Property`** و **`Review`** | **HAS_REVIEW** | **واحد لمتعدد (1:M)** | مكان الإقامة الواحد يمكن أن يتلقى العديد من التقييمات (Review). |
| **`User`** و **`Review`** | **WRITES** | **واحد لمتعدد (1:M)** | المستخدم (كضيف) الواحد يمكنه كتابة العديد من التقييمات. |
| **`Property`** و **`Amenity`** | **HAS_AMENITY** | **متعدد لمتعدد (M:N)** | يتم تنفيذها من خلال جدول الربط `Property_Amenity`. |

## 3. Visual Representation (التمثيل المرئي)

سيتم إنشاء مخطط الكيان والعلاقة المرئي (باستخدام Draw.io أو أداة أخرى) في ملف آخر لاحقًا، ولكنه يعتمد على التحليل المذكور أعلاه.

---

## 3. حفظ التغييرات (Commit)

1.  **رسالة التأكيد (Commit message):** انزل إلى أسفل الصفحة. يمكنك ترك رسالة التأكيد الافتراضية، أو كتابة رسالة واضحة، مثل:
    * **عنوان:** `Create ERD/requirements.md with initial entity definitions`
2.  **التأكيد:** انقر على الزر الأخضر **"Commit new file"** (تأكيد الملف الجديد).

بعد تنفيذ هذه الخطوات، سيكون ملف `requirements.md` موجودًا في المجلد الصحيح وبمحتوى غير فارغ، وسيتم حل الخطأ.
