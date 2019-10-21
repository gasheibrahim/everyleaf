# README
| Table         | Column        | Datatype |
| ------------- |:-------------:| -----:   |
|               | id            | integer  |
|user           | name          |  string  |
|               | email         |  string  |
|               | password      |  string  |
|               | user_type     |  string  |
| Table         | Column        | Datatype |
| ------------- |:-------------:| -----:   |
|               | id            |  integer |
|   label       | content       |  text    |
| Table         | Column        | Datatype |
| ------------- |:-------------:| -----:   |
|               | id            | integer  |
|               | name          | string   |
|  task         | content       | text     |
|               | user_id       | integer  |
|               | status        | string   |
|               | priority      | string   |
|               | start_date    | string   |
|               | end_date      | string   |

Deploying on Heroku Steps:
install heroku in your CP
creating account on heroku
open your terminal
type git add -A
then, type git commit -m "init"
then, type heroku create 
this comand it will create application on heroku
and type git push heroku master
in order to push your appication on heroku
and then, type heroku run rake db:migrate for migrate your database on heroku
and then, heroku config
check if the application is on heroku, and find logs for typing heroku logs
finaly you run application on browse