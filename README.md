# Hospital Portal Management <a name="about-project"></a>

> A comprehensive Ruby on Rails application designed to streamline hospital operations, allowing receptionists to manage patient records and enabling doctors to view patient statistics.

### Live Demo 🔗

- [Video](https://www.loom.com/share/183a3d1bdddc4a51b14b589687b39352?sid=c5f6caa4-2bc2-472c-ac9a-230602fb6aa2)

## Features
#### Receptionist Portal
- Patient creation: Register new patients and manage patient information.
- CRUD Operations: Receptionists can create, view, update, and delete patient records.
### Doctor Portal
- View Patient Statistics: Visualize patient registration data over time with charts.
- Data Insights: Doctors can view age distribution and daily registration statistics of patients.
### Authentication
- User login and registration are handled via Devise.
- User email confirmation are handle with letter_opener
### Authorization
- Role-Based Access Control: Access permissions are managed using the cancancan gem to ensure data security.

## Application Structure
#### Models
- User: Uses Devise for authentication and includes roles for Receptionist, Doctor, and Admin.
- Patient: Stores patient information and includes attributes like first_name, last_name, birth_day, address, etc.
#### Controllers
- HomeController: with an index action
- PatientsController: Manages CRUD operations for patient records, accessible to Receptionists.
- DoctorsController: Handles data visualization and access to patient statistics for Doctors.
#### Views
- Home Page: A landing page with options to log in and access either the receptionist or doctor portal.
- Patient Management: Includes forms and interfaces for managing patient records.
- Statistics Dashboard: Displays patient registration data in chart format using Chartkick.

Things you may want to cover:

* Ruby version

## Usage

### Starting up the Web Server

    % bin/dev 

### Installations
- Create the database & Starting up the Web Server

```bash
$   rails db:create db:migrate
$   rails db:seed # optional
$   rails server

// or you can run additionaly this to precompile  tailwind asset and start the server

$ bin/dev
```

- To install all dependencies, run:

```bash
 $ npm run install
 $ yarn
 $ npm run dev
```

- Reload the rails console
-  call `reload!`