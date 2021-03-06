context("o3 rolling 8hr average")

hourly_data <- readRDS("hourly.rds")
test <- o3_rolling_8hr_avg(hourly_data, dt = "date", val = "val", by = "id")

test_that("Is a data frame", {
  expect_is(test, "data.frame")
})

test_that("Has the right column names and dimensions", {
  expected_names <- c("id", "date", "flag_valid_8hr", "val", "rolling8")
  expect_equal(names(test), expected_names)
  expect_equal(dim(test), c(43961, 5))
})

test_that("Columns are the right class", {
  classes <- list("character", c("POSIXct", "POSIXt"), "logical", "numeric", 
                  "numeric")
  expect_equal(unname(sapply(test, class)), classes)
})

test_that("can exclude data rows", {
  excl_df <-
    data.frame(id = "a",
               start = hourly_data$date[8],
               stop = hourly_data$date[10],
               stringsAsFactors = FALSE)
  ret <- o3_rolling_8hr_avg(hourly_data, dt = "date", val = "val", by = "id", 
                            excl_df, c("start", "stop"))
  expect_equal(ret$rolling8[1:20], 
               c(NA, NA, NA, NA, NA, 21.5, 19.7, NA, NA, NA, NA, NA, NA, NA, 
                 NA, 6.3, 6, 6, 7.3, 9))
})
