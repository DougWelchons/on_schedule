# README
## OnSchedule by Doug Welchons
The intent of this project is to provide a schedule tracking tool (gantt chart) for construction projects

Basic tasks that it needs to capture as part of the core features are:

* creation of a new project which will include (at the project level) the following information
    * start date
    * estimated end date
    * work week (5/8's(M-F), 4/10's(M-Th or Tu-F) etc.)
    * any observed holidays that will not be considered working days
* creation of tasks within a project that has the following information based on type
    * Type - Internal Task (a task the company needs to complete)
        * Title
        * start date
        * end Date
        * allocated hours
        * cost code
    * Type - External Task (a task performed by another contractor, not under the companies scope)
        * title
        * Start date
        * end Date
    * Type - Inspection (single date for inspection)
        * Title
        * Date
    * Type - Milestone (a target or goal to be achieved by a given date)
        * Title
        * Date

presentation of information

The following information should be available within the project show page
* start and end date
* Total day's and working day
* Total day's and working day remaining till the end of the project
* total hours and man days (based on internal tasks)
* man loading by day
* all tasks listed with relevant information, including if applicable;
    * Title
    * type
    * start and end date
    * Hours
    * average man power needed


Additional ideas and thoughts
- task groupings
- add task linking
- sorting feature
- PDF conversion
- Company admin, full CRUD, and view only access levels
- email varification/login invite
- intra company chat
