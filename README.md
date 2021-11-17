# README
***
tasks table

| Column | Type | Options |
| :-- | :-: | --: |
| title | string | null:false |
| content | text | null:false |
| deadline | datetime | null:false |
| status | integer | null:false |
| priority | integer | null:false |
| created_at | datetime | null:false |
| updated_at | datetime | null:false |
| user_id | integer | null:false |

user table

| Column | Type | Options |
| :-- | :-: | --: |
| name | string | null:false |
| email | string | null:false |
| password | string | null:false |
| admin | boolean | default: false |

label table

| Column | Type | Options |
| :-- | :-: | --: |
| name | string | null:false |

labelling table

| Column | Type | Options |
| :-- | :-: | --: |
| task_id | integer | null:false |
| label_id | integer | null:false |

***
## デプロイ手順

1.Herokuに新しいアプリケーションを作成する  
$ heroku create  
<br />
2.アセットプリコンパイルをする  
$ rails assets:precompile RAILS_ENV=production  
<br />
3.git commitコマンドを使用して、コミットをする   
$ git add -A  
$ git commit -m "init"  
<br />
4.Herokuにデプロイをする  
$ git push heroku master  
<br />
5.データベースを移行する  
$ heroku run rails db:migrate  
<br />
6.アプリケーションにアクセスする  
$ heroku open  
