
download_nwis_data <- function(site_nums){
  
  # create the file names that are needed for download_nwis_site_data
  # tempdir() creates a temporary directory that is wiped out when you start a new R session; 
  # replace tempdir() with "1_fetch/out" or another desired folder if you want to retain the download

  dat_out <- download_nwis_site_data(site_num = site_nums, parameterCd = '00010')
  
  return(dat_out)
}

nwis_site_info <- function(fileout, sites_in){
  site_no <- unique(sites_in$site_no)
  site_info <- dataRetrieval::readNWISsite(site_no)
  write_csv(site_info, fileout)
}


download_nwis_site_data <- function(site_num, parameterCd = '00010', startDate="2014-05-01", endDate="2015-05-01"){
  


  # -- simulating a failure-prone web-sevice here, do not edit --
  if (sample(c(T,F,F,F), 1)){
    stop(site_num, ' has failed due to connection timeout. Try scmake() again')
  }
  # -- end of do-not-edit block
  
  # readNWISdata is from the dataRetrieval package
  data_out <- readNWISdata(sites=site_num, service="iv", 
                           parameterCd = parameterCd, startDate = startDate, endDate = endDate)
  
  return(data_out)
}

