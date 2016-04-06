##Secure School
### A School Manager

* Run the `rails s` command from the root of the project to start the server
* Go to `http://localhost:3000/`


### Models
* School
	* Has name and motto
* Teacher
	* Has name and belongs to School
* Course
	* Has name, description and belongs to School
* Student
	* Has name and belongs to School
* Concentration
	* Join table for Teacher and Course
* Enrollment
	* Join table for Student and Course


* Site features multiple CRUDs for almost all models
* A separate home controller to display a home page

Access the site on Heroku!
`https://secure-school-app.herokuapp.com/`
