!SLIDE bullets
# 4 #
## to_i ##

!SLIDE bullets incremental left
## '4'.to_i ##
* => 4
	
!SLIDE	bullets incremental left
## '-100'.to_i ##
* => -100

!SLIDE	bullets incremental left
## '0'.to_i ##
* => 0

!SLIDE	bullets incremental left
## '3.5'.to_i ##
* => 3

!SLIDE	bullets incremental left
## '.5'.to_i ##
* => 0

!SLIDE	bullets incremental left
## '3B'.to_i ##
* => 3

!SLIDE	bullets incremental left
## 'B3'.to_i ##
* => 0

!SLIDE	bullets incremental left
## ''.to_i ##
* => 0

!SLIDE	bullets incremental left
## nil.to_i ##
* => 0
* Remember params[:number].to_i will be 0 on nil