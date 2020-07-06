process_data <- function(nwis_filename, site_filename){
  dat <- readRDS(nwis_filename)
  site_info <- read_csv(site_filename)
  
  nwis_data_clean <- rename(dat, water_temperature = X_00010_00000) %>% 
    select(-agency_cd, -X_00010_00000_cd, -tz_cd) %>%
    left_join(site_info, by = "site_no") %>% 
    mutate(station_name = as.factor(station_nm)) %>%
    select(station_name, site_no, dateTime, water_temperature, latitude = dec_lat_va, longitude = dec_long_va)
  
  return(nwis_data_clean)
}

