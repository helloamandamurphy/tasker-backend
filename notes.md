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
