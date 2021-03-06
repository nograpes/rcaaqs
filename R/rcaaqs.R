# Copyright 2015 Province of British Columbia
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
# http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.

#' rcaaqs: Tools for calculating CAAQS with air quality data
#' 
#' The rcaaqs package provides functions for the calculation of Canadian Ambient
#' Air Quality Standards (CAAQS).
#' 
#' @section rcaaqs functions:
#'   
#'   \itemize{ 
#'   \item General functions for doing things like formatting dates,
#'     filling in sequences, etc.
#'   \item Functions for stepwise calculation of CAAQS metrics for different 
#'     pollutants. Currently these are only complete for PM2.5 (annual and 24hr)
#'     metrics, and are in development for ozone.
#'   \item Functions for assigning metrics for different pollutants into 
#'     achievement and management categories
#'   }
#'   
#' @docType package
#' @name rcaaqs
NULL
