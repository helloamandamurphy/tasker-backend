USERS
A User has_many Lists
`has_many :lists`

Use OAuth with Gmail / Create New User

Attributes:
  -Name (string)
  -Email (string)
  -Password (string)

LISTS
A List belongs_to a User
`belongs_to :user`
A List has_many Tasks
`has_many :tasks`

Attributes:
  -Name (Defaults to Date) (string)
  -Total Time (integer)
  -Start Time (created by event)


TASKS
A Task belongs_to a List
`belongs_to :list`

Attributes:
  -Name (string)
  -Estimated Time (integer)--> need method to convert this and add to start time.
  -Start Time (created by event) (timestamp)
  -End Time (created by event) (timestamp)


FEATURES TO ADD LATER
-Oauth for Google login
-Get List names to default to something like "To Do ${current_date}"
-Convert work time to minutes. (Seconds is just excessive)
-At the end of the work session, show estimated time vs. actual time.
-Have a button that updates the database with actual start / end times.
-Ability to add breaks as tasks
-CSS animation of work bar.
-Eventually, you could add a category to tasks (Blogging tasks take longer than expected.)
