# Database Normalization Analysis for Airbnb Schema (3NF)

The proposed schema, consisting of `User`, `Property`, `Booking`, `Amenity`, `Review`, and the junction table `Property_Amenity`, is already structured to largely comply with the **Third Normal Form (3NF)**.

## Review of Normal Forms

### 1NF (First Normal Form) - تم تحقيقه
* **التحقق:** جميع الجداول تحتوي على قيم ذرية (Atomic values) في كل عمود. لا توجد مجموعات متكررة أو صفوف متعددة الأبعاد.

### 2NF (Second Normal Form) - تم تحقيقه
* **التحقق:** جميع السمات غير المفتاحية (Non-key attributes) تعتمد بشكل كامل على المفتاح الأساسي (PK) في جميع الجداول، ولا يوجد اعتماد جزئي.

### 3NF (Third Normal Form) - تم تحقيقه
* **الشرط:** يجب ألا يكون هناك **اعتماد متعدٍ (Transitive Dependency)** (حيث يعتمد عمود غير مفتاحي على عمود غير مفتاحي آخر).
* **التحليل والتأكيد:** تم فصل جميع المعلومات المتعلقة بالكيانات (مثل المستخدمين والعقارات) إلى جداول منفصلة وربطها بالمفاتيح الخارجية. على سبيل المثال، معلومات المضيف (المستخدم) منفصلة عن معلومات العقار، مما يزيل التكرار ويضمن أن جميع السمات تعتمد فقط على المفتاح الأساسي لجدولها.

## الخلاصة

**التصميم الحالي يفي بمتطلبات 3NF.** تم التعامل مع علاقات "متعدد لمتعدد" (M:N) بين `Property` و `Amenity` باستخدام جدول ربط (`Property_Amenity`)، مما يزيل التكرار ويضمن سلامة البيانات.
