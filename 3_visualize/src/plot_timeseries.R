plot_nwis_timeseries <- function(fileout, site_dat, width = 12, height = 7, units = 'in'){
  site_data = read_csv(site_dat)
  ggplot(data = site_data, aes(x = dateTime, y = water_temperature, color = station_name)) +
    geom_line() + theme_bw()
  ggsave(fileout, width = width, height = height, units = units)
}