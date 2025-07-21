
# 📊 College Placement Data Analysis using SQL

This project presents a comprehensive analysis of college student placement data using **MySQL**. The analysis helps uncover insights about what factors—like CGPA, IQ, internships, communication skills, and projects—affect the likelihood of a student getting placed.

## 📁 Dataset
The dataset used (`placement_data`) contains the following features:
- `Student_ID`
- `CGPA`
- `IQ`
- `Communication_Skills`
- `Internship_Experience` (Yes/No)
- `Projects_Completed`
- `Extra_Curricular_Score`
- `Placement` (Yes/No)

---

🛠️ SQL Analysis Performed

🔹 Placement vs Internship Experience
```sql
SELECT Internship_Experience, Placement, COUNT(*) AS total
FROM placement_data
GROUP BY Internship_Experience, Placement;
```

 🔹 Average GPA by Placement Status
```sql
SELECT Placement, AVG(CGPA) AS avg_gpa
FROM placement_data
GROUP BY Placement;
```

 🔹 Average IQ by Placement Status
```sql
SELECT Placement, AVG(IQ) AS avg_iq
FROM placement_data
GROUP BY Placement;
```

 🔹 Average Communication Skills by Placement Status
```sql
SELECT Placement, AVG(Communication_Skills) AS avg_communication
FROM placement_data
GROUP BY Placement;
```

🔹 Average Extra-Curricular Score by Placement Status
```sql
SELECT Placement, AVG(Extra_Curricular_Score) AS avg_extra
FROM placement_data
GROUP BY Placement;
```

🔹 Average Projects Completed by Placement Status
```sql
SELECT Placement, AVG(Projects_Completed) AS avg_project
FROM placement_data
GROUP BY Placement;
```

---

 🧠 Advanced Multi-Factor Analysis

We analyzed how a combination of CGPA level, Internship experience, and Project count affects placement rate.

```sql
SELECT
  CASE
    WHEN CGPA >= 8 THEN 'High CGPA (8-10)'
    WHEN CGPA >= 6 THEN 'Medium CGPA (6-8)'
    ELSE 'Low CGPA (<6)'
  END AS CGPA_Level,
  Internship_Experience,
  CASE
    WHEN Projects_Completed >= 3 THEN 'High Projects'
    WHEN Projects_Completed >= 1 THEN 'Medium Projects'
    ELSE 'No Projects'
  END AS Project_Level,
  COUNT(*) AS Total_Students,
  SUM(CASE WHEN Placement = 'Yes' THEN 1 ELSE 0 END) AS Placed_Students,
  ROUND(100.0 * SUM(CASE WHEN Placement = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS Placement_Rate
FROM placement_data
GROUP BY CGPA_Level, Internship_Experience, Project_Level
ORDER BY CGPA_Level, Internship_Experience, Project_Level;
```

🔍 **Insights:**
- Students with high CGPA and internship + projects have a much higher placement rate.
- Communication skills and IQ also positively correlate with placement.
- Extra-curricular activities seem to have minor influence.

---
💡 Conclusion
SQL can be a powerful tool to perform data analysis on structured datasets. This project shows how multiple academic and skill-based factors contribute to student placement success.

📌 Author
Arjun Salwan 

📎 License
This project is licensed under the MIT License - feel free to use and modify.


