Shiny Alert banner example!
==================

A simple Shiny alert example. To run

shiny::runApp("shinyalert-example","xiaodaigh")

To use in your own Apps
==================
* Download the shinyalerts.js file and put it in the www folder
* Copy the shinyalert function into your ui.R
* Copy the showShinyAlert functioninto your server.R
* In ui.R insert funciton shinyalert("yourAlertId") where you want the banner to appear
* In server.R call the function showShinyAlert("yourAlertId","some new text") when you want your banner to appear
* Clicking on the banner will close it
