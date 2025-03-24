**1. What is PostgreSQL?**

- PostgreSQL একটি ওপেন সোর্স রিলেশনাল ডেটাবেস ম্যানেজমেন্ট সিস্টেম যা SQL ভাষা ব্যবহার করে ডেটা ম্যানেজমেন্ট করে।

**2. What is the purpose of a database schema in PostgreSQL?**

- স্কিমা ডেটাবেসের অবজেক্ট গুলোর সংগঠিত Structure প্রদান করে, যা ডেটাবেসের মধ্যে কাঠামোগত সুরক্ষা এবং ব্যবস্থাপনা নিশ্চিত করে।

**3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.**

    - Primary Key: একটি টেবিলের মধ্যে ইউনিক আইডেন্টিফায়ার, যেটি প্রতিটি রেকর্ডকে আলাদা করে।
    - Foreign Key: একটি টেবিলের মধ্যে অন্য টেবিলের Primary Key কে রেফারেন্স করে, যা ডেটার মধ্যে সম্পর্ক তৈরি করে।

**4. What is the difference between the VARCHAR and CHAR data types?**

- VARCHAR: ভেরিয়েবল দৈর্ঘ্যের স্ট্রিং, যেখানে প্রয়োজন অনুসারে স্টোর করা হয়।

- CHAR: নির্দিষ্ট দৈর্ঘ্যের স্ট্রিং, যেটি সবসময় সেই নির্দিষ্ট দৈর্ঘ্য পর্যন্ত পূর্ণ হয়।

**5. Explain the purpose of the WHERE clause in a SELECT statement.**

- WHERE ক্লজ ব্যবহৃত হয় ডেটা ফিল্টার করার জন্য, শুধুমাত্র নির্দিষ্ট শর্ত পূরণকারী রেকর্ডগুলো নির্বাচিত করতে।

**6. What are the LIMIT and OFFSET clauses used for?**

- LIMIT: নির্বাচিত রেকর্ডের সংখ্যা সীমাবদ্ধ করে।

- OFFSET: নির্দিষ্ট সংখ্যা পর্যন্ত রেকর্ড উপেক্ষা করে এবং পরবর্তী রেকর্ডগুলো নিয়ে আসে।

**7. How can you modify data using UPDATE statements?**

        UPDATE table_name SET column1 = value1 WHERE condition;

**8. What is the significance of the JOIN operation, and how does it work in PostgreSQL?**

- JOIN অপারেশন বিভিন্ন টেবিলের মধ্যে সম্পর্ক তৈরি করে এবং তাদের তথ্য একত্রিত করে। এটি INNER JOIN, LEFT JOIN, RIGHT JOIN ইত্যাদি বিভিন্ন ধরনের হতে পারে।

**9. Explain the GROUP BY clause and its role in aggregation operations.**

- GROUP BY ক্লজ ডেটাকে গ্রুপ করতে ব্যবহৃত হয়, বিশেষ করে অগ্রেগেট ফাংশন (যেমন COUNT, SUM) ব্যবহার করার জন্য।

**10.How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?**

- COUNT(): রেকর্ডের সংখ্যা গুণে।

- SUM(): একটি কলামের সমস্ত মানের যোগফল।

- AVG(): একটি কলামের গড় মান।
