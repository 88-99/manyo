# README
***
tasks table

| Column | Type | Options |
| :-- | :-: | --: |
| title | string | null:false |
| content | text | null:false |
| deadline | datetime | null:false |
| status | string | null:false |
| created_at | datetime | null:false |
| updated_at | datetime | null:false |
| user_id | integer | null:false |

user table

| Column | Type | Options |
| :-- | :-: | --: |
| name | string | null:false |
| email | string | null:false |
| password | string | null:false |

label table

| Column | Type | Options |
| :-- | :-: | --: |
| name | string | null:false |

labelling table

| Column | Type | Options |
| :-- | :-: | --: |
| task_id | integer | null:false |
| label_id | integer | null:false |
