context("pm 24h caaq")

annual_values <- readRDS("annual_98_percentiles.rds")
annual_values_one_id <- annual_values[annual_values$id == "a", ]

test_that("Is a data frame", {
  expect_is(pm_24h_caaq(annual_values, year = "year", val = "ann_98_percentile", 
                        by = "id", cyear = "latest"), "data.frame")
  expect_is(pm_24h_caaq(annual_values_one_id, year = "year", val = "ann_98_percentile", 
                        cyear = "latest"), "data.frame")
})

test_that("Has correct dimensions", {
  expect_equal(dim(pm_24h_caaq(annual_values_one_id, year = "year", 
                               val = "ann_98_percentile")), c(1, 8))
  
  # For multiple sites:
  expect_equal(dim(pm_24h_caaq(annual_values, year = "year", 
                               val = "ann_98_percentile", by = "id")), c(2, 9))
})

test_that("Column classes are correct", {
  classes <- c(as.list(c(rep("integer", 4), "character", "numeric")), 
               list(c("ordered", "factor"), c("ordered", "factor")))
  
  ret_classes <- unname(sapply(pm_24h_caaq(annual_values_one_id, year = "year", 
                                            val = "ann_98_percentile"), class))
  
  # For multiple sites:
  ret_classes <- unname(sapply(pm_24h_caaq(annual_values, year = "year", 
                                            val = "ann_98_percentile", 
                                           by = "id"), class))
  expect_equal(ret_classes, c("character", classes))
})

test_that("average is correct", {
  ret <- pm_24h_caaq(annual_values, year = "year", val = "ann_98_percentile", 
                     by = "id")
  
  manual <- 
   c(round(mean(annual_values$ann_98_percentile[annual_values$id == "a"], na.rm = TRUE), 0), 
     round(mean(annual_values$ann_98_percentile[annual_values$id == "b"], na.rm = TRUE), 0))
  expect_equal(ret$metric_value, manual)
})

test_that("n_years is correct", {
  ## removing a row
  ret <- pm_24h_caaq(annual_values[-c(3:5),], year = "year", val = "ann_98_percentile", 
                     by = "id")
  expect_equal(ret$n_years, c(1,3))
})

test_that("returns an error when multiple years and no grouping", {
  annual_values$year[2] <- 2013
  expect_error(pm_24h_caaq(annual_values, year = "year", 
                           val = "ann_98_percentile"), "duplicate")
})
