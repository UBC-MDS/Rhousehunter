# Read in data for tests
col_spec <- readr::cols(
  listing_url = readr::col_character(),
  price = readr::col_double(),
  num_bedroom = readr::col_double(),
  area_sqft = readr::col_double(),
  city = readr::col_character()
)
cleaned_df <- readr::read_csv(system.file("extdata", "cleaned_toy.csv", package = "rhousehunter"), col_types = col_spec)
# tests/testthat/
# Tests on input
testthat::test_that("Wrong type of input for price", {
  testthat::expect_error(data_filter(cleaned_df, -100, 2000, 500, 1, "Vancouver"))
  testthat::expect_error(data_filter(cleaned_df, 2000, 1000, 500, 1, "Vancouver"))
})

testthat::test_that("Wrong type of input for area in square feet", {
  testthat::expect_error(data_filter(cleaned_df, 1000, 2000, "hello", 1, "Vancouver"))
})

testthat::test_that("Wrong type of input for number of bedroom", {
  testthat::expect_error(data_filter(cleaned_df, 1000, 2000, "hello", 1, "Vancouver"))
})

testthat::test_that("Wrong type of input for city", {
  testthat::expect_error(data_filter(cleaned_df, 1000, 2000, 500, 1, 10))
})

# Test for outputs

testthat::test_that("The filtered data frame should be as expected", {
  testthat::expect_equal(
    data_filter(cleaned_df, 1000, 2000, 300, 1, "Vancouver"),
    dplyr::filter(cleaned_df, city == "vancouver")
  )
  testthat::expect_true(nrow(data_filter(cleaned_df, 1000, 2000, 300, 1, "richmond")) == 0)
})
