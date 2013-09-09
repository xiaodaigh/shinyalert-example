library(shiny)
options(shiny.reactlog=TRUE); 

showShinyAlert <- function(id,HTMLtext,session) {
	session$sendCustomMessage(id,HTMLtext)
}


# renderAlert <- function(expr, env = parent.frame(), quoted = FALSE) {
# 	func <- shiny::exprToFunction(expr, env, quoted)
# 	function() {
# 		alertText <- func()		
# 		alertText
# 	}
# }



# Define server logic required to generate and plot a random distribution
shinyServer(function(input, output,session) {
	no_of_showing = 0

	observe({
		if(input$actionButton1 > 0) {
			no_of_showing <<- no_of_showing + 1
			showShinyAlert("actionButton_alert",paste("You tried to show me",no_of_showing,"time(s). Click me to close."),session)
		} else {
			return("")
		}
	})
 	
})
