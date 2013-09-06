library(shiny)
options(shiny.reactlog=TRUE); 

renderAlert <- function(expr, env = parent.frame(), quoted = FALSE) {
	func <- shiny::exprToFunction(expr, env, quoted)
	function() {
		alertText <- func()		
		alertText
	}
}

# Define server logic required to generate and plot a random distribution
shinyServer(function(input, output) {
#  
# 	output$actionButton_alert <- renderAlert({		
# 		if(input$actionButton1 > 0) {
# 			return("You pressed the button")
# 		} else {
# 			return("")
# 		}
# 	})
#  	outputOptions(output, "actionButton_alert", suspendWhenHidden=FALSE)   
})
