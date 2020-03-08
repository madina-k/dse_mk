simulate_correctols <- function(data){

  lm(y ~ d + V1 + V2 + V3 + V4 + V5 + V6 + V7 + V8 + V9, data = data) %>%
    tidy() %>%
    filter(term == "d") %>%
    return(.)
}
