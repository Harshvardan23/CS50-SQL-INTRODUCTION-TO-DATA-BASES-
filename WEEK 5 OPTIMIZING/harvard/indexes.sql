create index "idx_courses_department" on "courses"("department")
;

create index "idx_courses_title" on "courses"("title")
;

create index "idx_courses_dept_num_sem" on "courses"("department", "number", "semester")
;

create index "idx_enrollments_student_course" on "enrollments"("student_id", "course_id")
;

create index "idx_enrollments_course" on "enrollments"("course_id")
;

create index "idx_satisfies_course" on "satisfies"("course_id")
;

create index "idx_satisfies_requirement" on "satisfies"("requirement_id")
;
