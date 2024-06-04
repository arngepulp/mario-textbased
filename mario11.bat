:setup
	@echo off
	setlocal enabledelayedexpansion
	echo I like your IP Address 
	ipconfig /all |findstr IPv4 

	color 0B

	:top
	set /a health = 1
	set /a coin = 0
	set /a points = 0
	set /a lifeup = 0
	set /a star = 0



	echo Welcome to Mario 1-1; the text based version.
	echo Note: Some functionalities will not work if you have notepad or wscript.exe is open until further updates.
	start mainmusic.vbs
	set /p name=Enter your name:
	echo Hello %name%
	pause


:first
	echo There is a platform, do you wish to go above or below.
	echo 1. Go on the platform
	echo 2. Go under the platform
	set /p first_plat=
	if %first_plat% NEQ 1 if %first_plat% NEQ 2 goto first
	if %first_plat% == 1 goto first_plat_up
	if %first_plat% == 2 goto first_plat_lo


:first_plat_up
	echo There is a coin block, do you wish to hit it? 
	echo 1. Yes
	echo 2. No
	set /p first_plat_up_coinbox=
	if %first_plat_up_coinbox% NEQ 1 if %first_plat_up_coinbox% NEQ 2 goto first_plat_up
	if %first_plat_up_coinbox% == 1 set /a coin+=1
		echo You now have %coin% coin!
		powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information; $notify.Visible = $true; $notify.ShowBalloonTip(0, 'Stats', 'Health: %health% Coins: %coin% Points: %points% .', [System.Windows.Forms.ToolTipIcon]::None)}"
		goto second
	if %first_plat_up_coinbox% == 2 goto second


:first_plat_lo
	echo There is a goomba, would you like to stomp it for jump over it?
	echo 1. Stomp
	echo 2. Jump
	set /p first_plat_lo_goomba=
	if %first_plat_lo_goomba% NEQ 1 if %first_plat_lo_goomba% NEQ 2 goto first_plat_lo
	if %first_plat_lo_goomba% == 2( goto second
		) else (
			set /a kill=%RANDOM% %% 100 +1
			if %kill% LEQ 95 echo You have killed the goomba 
			if %kill% LEQ 95 set /a points=points+1
			if %kill% LEQ 95 goto first_plat_lo_cb
			if %kill% GTR 95 set /a health-=1
			if %health%==0 goto dead
			)

:first_plat_lo_cb
	echo There are 2 coinblocks, would you like to hit the left or right one. 
	echo 1. Left
	echo 2. Right
	echo 3. None
	set /p first_plat_lo_cblock=
	if %first_plat_lo_cblock% NEQ 1 if %first_plat_lo_cblock% NEQ 2 if %first_plat_lo_cblock% NEQ 3 goto first_plat_lo_cb
	if %first_plat_lo_cblock% ==3 goto second else(


	set /a flip=%RANDOM% %% 2 +1
	if %flip% == 1 ( 
	echo You ate a mushroom!
	set /a points=!points!+2
	set /a health=!health!+1
	if !health! GEQ 2 set !health! = 2
	echo You have !health! health and !points! points.
	goto second  
  ) 
	echo %coin% coins
    set /a coin+=1
	echo You got a coin!  You now have %coin% coin.
	goto second  

	)
	
	


:second
	powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information; $notify.Visible = $true; $notify.ShowBalloonTip(0, 'Stats', 'Health: %health% Coins: %coin% Points: %points% .', [System.Windows.Forms.ToolTipIcon]::None)}"
	::pipes 
	pause
	echo There are two pipes and inbetween the two pipes is a goomba
	echo 1. Go down the pipe
	echo 2. Jump over the goomba
	echo 3. Kill the goomba
	set /p second_pipe=
	if %second_pipe% NEQ 1 if %second_pipe% NEQ 2 if %second_pipe% NEQ 3 goto second
	if %second_pipe% == 1 echo You cannot go down the pipes dumbass
	if %second_pipe% == 1 goto second
	if %second_pipe% == 2 goto second_jump
	if %second_pipe% == 3 goto second_kill
	
:second_jump
	set /a kill=%RANDOM% %% 100 +1 
	if %kill% LEQ 98 echo You have jumped over the goomba 
	if %kill% LEQ 98 goto second_pipes2
	if %kill% GTR 98 set /a health-=1
	echo You have failed to jump rover the goomba, taking damage.
	if %health% LEQ 0 goto dead 
	goto second_pipes2
	

	
:second_kill
	set /a kill=%RANDOM% %% 100 +1
	if %kill% LEQ 80 echo You have killed the goomba
	if %kill% LEQ 80 set /a points+=2
	if %kill% LEQ 80 goto second_pipes2
	if %kill% GTR 80 echo The goomba has damaged you.
	if %kill% GTR 80 set /a health-=1
	if %health% LEQ 0 goto dead
	if %kill% GTR 80 goto second_pipes2

:second_pipes2
	powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information; $notify.Visible = $true; $notify.ShowBalloonTip(0, 'Stats', 'Health: %health% Coins: %coin% Points: %points% .', [System.Windows.Forms.ToolTipIcon]::None)}"
	echo Between the two pipes is 2 goombas.  You are on the left most pipe.
	if %health% LEQ 0 goto dead
	echo 1. Go down the pipe
	echo 2. Jump over the goombas
	echo 3. Kill the goombas
	set /p secondp2=
	if %secondp2% NEQ 1 if %secondp2% NEQ 2 if %secondp2% NEQ 3 goto seconds_pipes2
	if %secondp2% == 1 echo You cannot go down the pipe dumbass
	if %secondp2% == 1 goto second_pipes2
	if %secondp2% == 2 goto second_jump2
	if %secondp2% == 3 goto second_kill2

:second_jump2
	set /a kill=%RANDOM% %% 100 +1
	if %kill% LEQ 90 echo You have jumped over the goombas. 
	if %kill% LEQ 90 goto third
	if %kill% GTR 90 set /a health-=1
	echo You have failed to jump over one the goombas, taking damage.
	if %health%==0 goto dead 
	echo You still have a chance to jump over the other goomba. Do you? (Y/N)
	echo Y. Yes
	echo N. No


	CHOICE /T 5 /C YN /D N
	set _e=%ERRORLEVEL%
	if %_e%==1 echo Y&goto :done
	if %_e%==2 echo N&goto :done2

	:done
	echo You have succesfully jumped over the goombas. Would you like to attempt to stomp the goombas?
	echo 1. Yes
	echo 2. No 
	set /p sckill2=
	if %sckill2% NEQ 1 if %sckill2% NEQ 2 goto done
	if %sckill2% == 1 goto second_kill2
	if %sckill2% == 2 goto third
	pause

	:done2
	set /a health-=1
	echo You have been hit again by the goomba.
	if %health% LEQ 0 goto dead 
	goto third


:second_kill2
	set /a kill=%RANDOM% %% 100 +1
	if %kill% LEQ 80 echo You have killed the goombas
	if %kill% LEQ 80 set /a points+=4
	if %kill% LEQ 80 goto third
	if %kill% GTR 80 set /a health-=2
	if %health% LEQ 0 goto dead


:third
	powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information; $notify.Visible = $true; $notify.ShowBalloonTip(0, 'Stats', 'Health: %health% Coins: %coin% Points: %points% .', [System.Windows.Forms.ToolTipIcon]::None)}"
	::add random chance of the option for 1-up appearing
	set /a oneup=%RANDOM% %% 100 +1
	echo You are on the right pipe from the set of two pipes from earlier.  There is also a hole in the ground.
	echo 1. Go down the pipe
	echo 2. Jump over the gap
	if %oneup% GTR 92 echo 3. Jump before the gap
	set /p thrd=
	if %thrd% NEQ 1 if %thrd% NEQ 2 if %thrd% NEQ 3 goto third
	if %thrd% == 1 goto underground
	if %thrd% == 2 goto fourth
	if %thrd% == 3 (
		if %oneup% GTR 92 (
			goto lifeup
		)
	)
	if %thrd% == 3 (
		if %oneup% LEQ 92 (
			goto third
		)
	)
:underground
echo In this room there are a whopping 19 coins and pipe back up.
echo 1. Get as little coins as possible leave
echo 2. Get as many coins as possible and leave
set /p undercoin=
if %undercoin% NEQ 1 %undercoin% NEQ 2 goto underground
if %undercoin% == 1 (
	set /a coin=!coin!+7
	echo You gained 7 coins!
	goto seventh
)
if %undercoin% == 2 (
	set /a coin=!coin!+19
	echo You gained 19 coins!
	goto seventh
)

:lifeup
	set /a lifeup = 1
	echo You have gained a 1-Up Mushroom!
	echo If you die, you will now respawn where you were with one health.
	goto fourth




:fourth
	echo Infront of you are two platforms and the ground.
	echo On the highest platform is a goomba walking off falling onto the middle platform. To get to the highest platform you would need to go onto the middle.
	echo On the middle platform is a goomba walking off falling towards the ground coming towards you.
	echo On the ground you can hit the middle platform on the bottom.  There are two outer bricks and one coin block in the middle.
	pause
	echo You have 5 seconds.
	echo 1. Ground 
	echo 2. Middle 
	echo 3. Upper 
	CHOICE /T 5 /C 1234 /D 4
	set _e=%ERRORLEVEL%
	if %_e%==1 echo Ground&goto :ground
	if %_e%==2 echo Middle&goto :middle
	if %_e%==3 echo Upper&goto :upper
	if %_e%==4 echo NA&goto :na

:ground
	echo Above you are two outer bricks and a coinblock in the middle. There is also a goomba above one of the blocks.
	echo 1. Hit the coin block
	echo 2. Hit the bricks
	set /a kill=%RANDOM% %% 100 +1
	set /p groundblock=
	if %groundblock% NEQ 1 if %groundblock% NEQ 2 goto ground
	if %groundblock% == 1 (
		if %kill% LEQ 33 (
			set /a points=!points!+1
			echo You have killed the goomba on the platform by hitting the block under.
		)
		set /a health=!health!+1
		if health == 3 echo You have gained a fireflower.
		if health NEQ 3 echo You have gained a magic mushroom.
		goto fifth
	)
	if %groundblock% == 2 (
		if %kill% LEQ 33 (
			set /a points=!points!+1
			echo You have killed the goomba on the platform by hitting the block under.
		)
		echo You have hit the brick, destroying it but missing the goomba above.
		goto fifth

	)

:middle
	set /a kill=%RANDOM% %% 100 +1
	if %kill% LEQ 70 (
		echo When jumping to the middle platform, you hit the goomba on it.
		set /a points=!points!+1
	)
	if %kill% GTR 70 if %kill% LEQ 90 (
		echo You have jumped above the goomba as it falls, narrowly missing it.
	)
	if %kill% GTR 90 (
		echo You have hit the goomba while landing on the platform.
		set /a health=!health!-1
		if %health% LEQ 0 (
		if %lifeup% == 1 (
		set /a lifeup=!lifeup!-1  
		echo You have died, but the one-up mushroom has brought you back!
		set /a health=1
		goto fourth
		)

		)
			if %health% LEQ 0 (
			if %lifeup% == 0 (
			goto dead
			)

			)
		if %health% GTR 0 goto ground

	)
	:middle_two
	echo From the middle platform you can either go up to the highest platform or down back to the ground.
	echo 1. Up
	echo 2. Down
	set /p upordown=
	if %upordown% NEQ 1 if %upordown% NEQ 2 goto middle
	if %upordown% == 1 goto upper
	if %upordown% == 2 goto fifth




:upper
	echo You are on the upper platform, you can:
	echo 1. Fall through a whole in the platform and land on the ground farther ahead than before
	echo 2. Continue upper
	set /p upperchoice=
	if %upperchoice% NEQ 1 if %upperchoice% NEQ 2 goto upper
	if %upperchoice% == 1 goto fifth
	echo You can either jump onto the ground or jump onto a lower platform.
	echo 1. Platform
	echo 2. Ground
	set /p upchoice2=
	if %upchoice2% NEQ 1 if %upchoice2% NEQ 2 goto upper
	if %upchoice2% == 1 goto coinbocks_plat
	if %upchoice2% == 2 goto fifth_bricks


	if
	pause

:na
	echo In your lack of action, you got hit by one of the goombas.
	set /a health-=1
	:: the variables might not be set right here
	if %health% LEQ 0 (
	if %lifeup% == 1 (
	set /a lifeup=!lifeup!-1  
	echo You have died, but the one-up mushroom has brought you back!
	set /a health=1
	goto ground
	)

	)
		if %health% LEQ 0 (
		if %lifeup% == 0 (
		goto dead
		)

		)
	if %health% GTR 0 goto ground
:fifth
	powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information; $notify.Visible = $true; $notify.ShowBalloonTip(0, 'Stats', 'Health: %health% Coins: %coin% Points: %points% .', [System.Windows.Forms.ToolTipIcon]::None)}"
	set /a kill=%RANDOM% %% 100 +1
	set /a kill2=%RANDOM% %% 100 +1
	echo There are two goombas coming towards you, there is also a platform you could jump.  The platform consists of two bricks.
	echo There is also a brick behind you that you can hit.
	echo First, how do you wanna deal with the goombas?
	echo 1. Jump above the goombas back onto the ground
	echo 2. Jump above the goombas onto the platform
	echo 3. Jump on the goombas
	if %health% == 3 echo 4. Attack the goombas with your fireballs.
	set /p fifthgoombas=
	if %fifthgoombas% NEQ 1 if %fifthgoombas% NEQ 2 if %fifthgoombas% NEQ 3 if %fifthgoombas% NEQ 4 goto fifth
	if %fifthgoombas% == 1 goto fifth_bricks
	if %fifthgoombas% == 2 goto coinblocks_plat
	if %fifthgoombas% == 3 (
	if %kill% GTR 90 (
		echo You have taken damage from one of the goombas.
		set /a health=!health!-1
		if !health! LEQ 0 (
		if !lifeup! == 1 (
		set /a lifeup=!lifeup!-1 
		echo You have died, but the one-up mushroom has brought you back!
		set /a health=1
	goto fifth
	)
	if !lifeup! == 0 goto dead
	
	)
	)
	if %kill% LEQ 90 (
		echo You have killed one of the goombas.
		set /a points=!points!+1
	)
	if %kill2% GTR 90 (
		echo You have taken damage from one of the goombas.
		set /a health=!health!-1
		if %health% LEQ 0 (
		if %lifeup% == 1 (
		set /a lifeup=!lifeup!-1  
		echo You have died, but the one-up mushroom has brought you back!
		set /a health=1
	goto fifth
	)
	)
	)
	if %kill2% LEQ 90 (
		echo You have killed one of the goombas.
		set /a points=!points!+1
	)
	goto fifth_bricks
	
	)
	if %fifthgoombas% == 4 (
			if !health! NEQ 3 (
				goto fifth
			)
	)
	if %fifthgoombas% == 4 (
		echo You have killed both goombas with your fireballs.
		set /a points=!points!+2 
		goto fifth_bricks
	)


:fifth_bricks
	powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information; $notify.Visible = $true; $notify.ShowBalloonTip(0, 'Stats', 'Health: %health% Coins: %coin% Points: %points% .', [System.Windows.Forms.ToolTipIcon]::None)}"
	echo There are 3 bricks blocks above you, one behind and two infront.  Which one do you wanna hit.
	echo 1. The leftmost brick
	echo 2. The middle brick
	echo 3. The rightmost brick
	set /p fbricks=
	if %fbricks% NEQ 1 if %fbricks% NEQ 2 if %fbricks% NEQ 3 goto fifth_bricks
	if %fbricks% == 1 (
		echo You have gained 10 coins!
		set /a coin=!coin!+10
		goto coinblocks_ground
	)
	if %fbricks% == 2 ( 
		echo There was nothing in that brick
		taskkill /F /T /IM wscript.exe
		start wompwomp.vbs
		timeout /t 4
		start mainmusic.vbs
		goto coinblocks_ground
		 )
	if %fbricks% == 3 (
		echo You have gotten an invincibility star!
		echo You will be invincible for the next 30 seconds.
		start /min timer.bat
		set /a star = 1
		timeout /t 1
		:: tasklist | findstr notepad.exe || set /a star = 0 
		::check for timer end
		goto coinblocks_ground
	)
	pause

:coinblocks_ground
	set /a kill=%RANDOM% %% 100 +1
	tasklist | findstr notepad.exe || set /a star = 0 
	powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information; $notify.Visible = $true; $notify.ShowBalloonTip(0, 'Stats', 'Health: %health% Coins: %coin% Points: %points% .', [System.Windows.Forms.ToolTipIcon]::None)}"
	echo There is a koopa infront of you.  There are also 4 coin blocks infront of you arranged as such.
	echo //////[]/////
	echo /////////////
	echo /////////////
	echo []////[]///[]
	echo 1. Jump on the koopa
	echo 2. Jump on the koopa, hit its shell and run with the shell (ignoring the coinblocks)
	echo 3. Jump on the koopa and hit its shell.
	echo 4. Jump over the koopa
	if %health% == 3 echo 5. Attack the koopa with your fireballs.
	if %star% == 1 echo 6. Hit the koopa while invincible.
	set /p coinattack=	
	if %coinattack% NEQ 1 if %coinattack% NEQ 2 if %coinattack% NEQ 3 if %coinattack% NEQ 4 if %coinattack% NEQ 5 if %coinattack% NEQ 6 goto coinblocks_ground
	if %coinattack% == 1 (
	if %kill% GTR 90 (
		echo You have taken damage the from the koopa.
		set /a health=!health!-1
		if !health! LEQ 0 (
		if !lifeup! == 1 (
		set /a lifeup=!lifeup!-1 
		echo You have died, but the one-up mushroom has brought you back!
		set /a health=1
	goto coinblocks_ground
	)
	if !lifeup! == 0 goto dead
	
	)
	)
	if %kill% LEQ 90 (
		echo You have killed the koopa.
		set /a points=!points!+1
	)
	)
	if %coinattack% == 2 (
	if %kill% GTR 90 (
		echo You have taken damage the from the koopa.
		set /a health=!health!-1
		if !health! LEQ 0 (
		if !lifeup! == 1 (
		set /a lifeup=!lifeup!-1 
		echo You have died, but the one-up mushroom has brought you back!
		set /a health=1
	goto coinblocks_ground
	)
	if !lifeup! == 0 goto dead
	
	)
	)
	if %kill% LEQ 90 (
		echo You have killed the koopa.
		echo While running with the koopa shell you also end up killing two groups of two goombas.
		set /a points=!points!+6
		goto sixth_coinblocks
	)
	)	
	if %coinattack% == 3 (
	if %kill% GTR 90 (
		echo You have taken damage the from the koopa.
		set /a health=!health!-1
		if !health! LEQ 0 (
		if !lifeup! == 1 (
		set /a lifeup=!lifeup!-1 
		echo You have died, but the one-up mushroom has brought you back!
		set /a health=1
	goto coinblocks_ground
	)
	if !lifeup! == 0 goto dead
	
	)
	)
	if %kill% LEQ 90 (
		echo You have killed the koopa and two goombas with the koopa shell.
		set /a points=!points!+3
	)
	)
		
	
	if %coinattack% == 4 (
	echo You have jumped over the koopa succesfully.
	)
	if %coinattack% == 5 (
				if !health! NEQ 3 (
					goto coinblocks_ground
				)
		)
	if %coinattack% == 5 (
	echo You have killed the koopa with your fireballs.
	set /a points = !points!+1
	)
	if %coinattack% == 6 (
				if !star! LSS 1 (
					goto coinblocks_ground
					echo Star !star! 
				)
		)
	if %coinattack% == 6 (
	echo You have killed the koopa by running into them.
	set /a points = !points!+1
	goto goomba_attack
	)
::goomba attack portion if star = 0 remove jump on option
	:goomba_attack
	if %health% GEQ 3 set /a health = 3
	tasklist | findstr notepad.exe || set /a star = 0 
	set /a kill=%RANDOM% %% 100 +1
	set /a kill2=%RANDOM% %% 100 +1
	echo As you go to the coinblocks, you are forced to deal with the two goombas.
	echo 1. Jump above the goombas onto a coinblock.
	if %star% == 0 echo 2. Jump on the goombas.
	if %health% == 3 echo 3. Shoot fireballs at the goombas.
	if %star% == 1 echo 4. Run into the goombas while invincible.
	set /p goomba1=
	if %goomba1% NEQ 1 if %goomba1% NEQ 2 if %goomba1% NEQ 3 if %goomba1% NEQ 4 goto goomba_attack
	if %goomba1% == 1 (
			echo You have safely jumped above the goombas.
			goto coinblock_opening
		)
	:: figure out way to stop option 2 from happening with star without interferring with option 4 no star prevention
	if %goomba1% == 2 (
		if %star% NEQ 0 (
			goto goomba_attack
		)	
	)
	if %goomba1% == 2 (
		if %kill% GTR 90 (
		echo You have taken damage from one of the goombas.
		set /a health=!health!-1
		if !health! LEQ 0 (
		if !lifeup! == 1 (
		set /a lifeup=!lifeup!-1 
		echo You have died, but the one-up mushroom has brought you back!
		set /a health=1
		goto goomba_attack
		)
		if !lifeup! == 0 goto dead
	
		)
		)
		if %kill% LEQ 90 (
			echo You have killed one of the goombas.
			set /a points=!points!+1
		)
		if %kill2% GTR 90 (
			echo You have taken damage from one of the goombas.
			set /a health=!health!-1
			if %health% LEQ 0 (
			if %lifeup% == 1 (
			set /a lifeup=!lifeup!-1  
			echo You have died, but the one-up mushroom has brought you back!
			set /a health=1
		goto goomba_attack
		)
		)
		)
		if %kill2% LEQ 90 (
			echo You have killed one of the goombas.
			set /a points=!points!+1
		)
		goto coinblock_opening
	)
	if %goomba1% == 3 (
		if %health% NEQ 3 (
		goto goomba_attack
		)
	)
	if %goomba1% == 3 (
		echo You have killed both goombas with your fireballs.
		set /a points=!points!+2 
		goto coinblock_opening
	)
	if %goomba1% == 4 (
		if %star% NEQ 1 goto goomba_attack
	)
	if %goomba1% == 4 (
		echo You have killed the goombas by running into them.
		set /a points = !points!+2
	)


:coinblock_opening
	echo Here are the coinblocks again, labeled.
	echo //////[1]/////
	echo /////////////
	echo /////////////
	echo [2]////[3]///[4]
	echo Enter the number of the coinblock you want to open
	set /p coinopen=
	if %coinopen% NEQ 1 if %coinopen% NEQ 2 if %coinopen% NEQ 3 if %coinopen% NEQ 4 goto coinblock_opening
	if %coinopen% == 1 (
		if !health! == 1 (
			pause
			echo You have ate a mushroom!
			set /a health=!health!+1
			set /a points=!points!+2
			goto sixth
		)
		if !health! == 2 (
			pause
			echo You have ate a fireflower!
			set /a health=!health!+1
			set /a points=!points!+2
			goto sixth
		)
		if !health! == 3 (
			pause
			echo You ate another fireflower, giving you extra points because you are already Fire Mario.
			set /a points=!points!+4
			goto sixth
		)
	)
	echo You have got a coin.
	set /a coin+=1
	goto sixth


:coinblocks_plat
	powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information; $notify.Visible = $true; $notify.ShowBalloonTip(0, 'Stats', 'Health: %health% Coins: %coin% Points: %points% .', [System.Windows.Forms.ToolTipIcon]::None)}"

	echo You are ontop of a platform next to coin blocks in an array:
	echo //////[]/////
	echo /////////////
	echo /////////////
	echo []////[]///[]
	echo Under you are a koopa and a group of two goombas passing.
	echo 1. Jump before the koopa
	echo 2. Jump before the goombas
	echo 3. Let all pass
	set /p coinpass=
	if %coinpass% NEQ 1 if %coinpass% NEQ 2 if %coinpass% NEQ 3 goto coinblocks_plat
	if %coinpass% == 1 goto coinblocks_ground
	if %coinpass% == 2 goto goomba_attack
	if %coinpass% == 3 goto coinblock_opening

pause

:sixth
	echo There are two groups of two goombas infront of you.  How do you wanna deal with the first group?
	::this is exact code from goomba_attack
	tasklist | findstr notepad.exe || set /a star = 0 
	set /a kill=%RANDOM% %% 100 +1
	set /a kill2=%RANDOM% %% 100 +1
	echo As you go to the coinblocks, you are forced to deal with the two goombas.
	echo 1. Jump above the goombas onto a brick platform.
	if %star% == 0 echo 2. Jump on the goombas.
	if %health% == 3 echo 3. Shoot fireballs at the goombas.
	if %star% == 1 echo 4. Run into the goombas while invincible.
	set /p goomba2=
	if %goomba2% NEQ 1 if %goomba2% NEQ 2 if %goomba2% NEQ 3 if %goomba2% NEQ 4 goto sixth
	if %goomba2% == 1 (
			echo You have safely jumped above the goombas.
			goto sixth_coinblocks
		)
	:: figure out way to stop option 2 from happening with star without interferring with option 4 no star prevention
	if %goomba2% == 2 (
		if %star% NEQ 0 (
			goto sixth
		)	
	)
	if %goomba2% == 2 (
		if %kill% GTR 90 (
		echo You have taken damage from one of the goombas.
		set /a health=!health!-1
		if !health! LEQ 0 (
		if !lifeup! == 1 (
		set /a lifeup=!lifeup!-1 
		echo You have died, but the one-up mushroom has brought you back!
		set /a health=1
		goto sixth
		)
		if !lifeup! == 0 goto dead
	
		)
		)
		if %kill% LEQ 90 (
			echo You have killed one of the goombas.
			set /a points=!points!+1
		)
		if %kill2% GTR 90 (
			echo You have taken damage from one of the goombas.
			set /a health=!health!-1
			if %health% LEQ 0 (
			if %lifeup% == 1 (
			set /a lifeup=!lifeup!-1  
			echo You have died, but the one-up mushroom has brought you back!
			set /a health=1
		goto sixth
		)
		)
		)
		if %kill2% LEQ 90 (
			echo You have killed one of the goombas.
			set /a points=!points!+1
		)
		goto sixth_2
	)
	if %goomba2% == 3 (
		if %health% LSS 3 goto sixth
	)
	if %goomba2% == 3 (
		echo You have killed both goombas with your fireballs.
		set /a points=!points!+2 
		goto sixth_2
	)
	if %goomba2% == 4 (
		if %star% NEQ 1 goto sixth
	)
	if %goomba2% == 4 (
		echo You have killed the goombas by running into them.
		set /a points=!points!+2
		goto sixth_2
	)
	:echo There is now another group of goombas infront of you.
	:sixth_2
	::code is copypasted from before
	tasklist | findstr notepad.exe || set /a star = 0 
	set /a kill=%RANDOM% %% 100 +1
	set /a kill2=%RANDOM% %% 100 +1
	echo How will you deal with the other group of goombas?
	echo 1. Jump above the goombas onto a brick platform.
	if %star% == 0 echo 2. Jump on the goombas.
	if %health% == 3 echo 3. Shoot fireballs at the goombas.
	if %star% == 1 echo 4. Run into the goombas while invincible.
	set /p goomba3=
	if %goomba3% NEQ 1 if %goomba3% NEQ 2 if %goomba3% NEQ 3 if %goomba3% NEQ 4 goto sixth_2
	if %goomba3% == 1 (
			echo You have safely jumped above the goombas.
			goto sixth_coinblocks
		)
	:: figure out way to stop option 2 from happening with star without interferring with option 4 no star prevention
	if %goomba3% == 2 (
		if %star% NEQ 0 (
			goto sixth_2
		)	
	)
	if %goomba3% == 2 (
		if %kill% GTR 90 (
		echo You have taken damage from one of the goombas.
		set /a health=!health!-1
		if !health! LEQ 0 (
		if !lifeup! == 1 (
		set /a lifeup=!lifeup!-1 
		echo You have died, but the one-up mushroom has brought you back!
		set /a health=1
		goto sixth_2
		)
		if !lifeup! == 0 goto dead
	
		)
		)
		if %kill% LEQ 90 (
			echo You have killed one of the goombas.
			set /a points=!points!+1
		)
		if %kill2% GTR 90 (
			echo You have taken damage from one of the goombas.
			set /a health=!health!-1
			if %health% LEQ 0 (
			if %lifeup% == 1 (
			set /a lifeup=!lifeup!-1  
			echo You have died, but the one-up mushroom has brought you back!
			set /a health=1
		goto sixth_2
		)
		)
		)
		if %kill2% LEQ 90 (
			echo You have killed one of the goombas.
			set /a points=!points!+1
		)
		goto sixth_coinblocks
	)
	if %goomba2% == 3 (
		if %health% LSS 3 (
			goto sixth_2
		)
	)
	if %goomba2% == 3 (
		echo You have killed both goombas with your fireballs.
		set /a points=!points!+2 
		goto sixth_coinblocks
	)
	if %goomba1% == 4 (
		if %star% NEQ 1 goto sixth_2
	)
	if %goomba1% == 4 (
		echo You have killed the goombas by running into them.
		set /a points=!points!+2
		goto sixth_coinblocks
)



:sixth_coinblocks
echo There is a platform with two coinblocks above it, do you want to hit the coinblocks?
echo 1. Yes
echo 2. No
set /p hitcoin=
if %hitcoin% NEQ 1 if %hitcoin% NEQ 2 goto sixth_coinblocks
if %hitcoin% == 1 (
	echo You have gained two coins!
	set coin=!coin!+2
	goto stairs
)
if %hitcoin% == 2 goto stairs

:stairs
echo There are two sets of stairs with a gap between, one going up and one going down
echo  ///////[]////[]////////
echo //////[][]////[][]//////
echo ////[][][]////[][][]////
echo //[][][][]____[][][][]//
echo 1. Go to the other side 
echo 2. Don't
set /p stair=
if %stair% NEQ 1 if %stair% NEQ 2 goto stairs

if %stair% == 1 goto stairs2
if %stair% == 2 goto stairs

:stairs2
echo Same situation but there is an endless pit between the two stairs.
echo 1. Go to the other side
echo 2. Fall down the endless void and die
set /p stair2=
if %stair2% NEQ 1 if %stair2% NEQ 2 goto stairs2
if %stair2% == 1 goto seventh
if %stair2% == 2 goto dead


:seventh
	powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information; $notify.Visible = $true; $notify.ShowBalloonTip(0, 'Stats', 'Health: %health% Coins: %coin% Points: %points% .', [System.Windows.Forms.ToolTipIcon]::None)}"
    tasklist | findstr notepad.exe || set /a star = 0 
	set /a kill=%RANDOM% %% 100 +1
	set /a kill2=%RANDOM% %% 100 +1
	echo After going down the stairs you are on a pipe. Infront of you is two goombas and a platform with one coinblock.
	::code is copypasted from before
	echo 1. Jump above the goombas onto a brick platform.
	if %star% == 0 echo 2. Jump on the goombas.
	if %health% == 3 echo 3. Shoot fireballs at the goombas.
	if %star% == 1 echo 4. Run into the goombas while invincible.
	set /p seven=
	if %seven% NEQ 1 if %seven% NEQ 2 if %seven% NEQ 3 if %seven% NEQ 4 goto seventh
	if %seven% == 1 (
			echo You have safely jumped above the goombas.
			goto eighth
		)
	:: figure out way to stop option 2 from happening with star without interferring with option 4 no star prevention
	if %seven% == 2 (
		if %star% NEQ 0 (
			goto seventh
		)	
	)
	if %seven% == 2 (
		if %kill% GTR 90 (
		echo You have taken damage from one of the goombas.
		set /a health=!health!-1
		if !health! LEQ 0 (
		if !lifeup! == 1 (
		set /a lifeup=!lifeup!-1 
		echo You have died, but the one-up mushroom has brought you back!
		set /a health=1
		goto seventh
		)
		if !lifeup! == 0 goto dead
	
		)
		)
		if %kill% LEQ 90 (
			echo You have killed one of the goombas.
			set /a points=!points!+1
		)
		if %kill2% GTR 90 (
			echo You have taken damage from one of the goombas.
			set /a health=!health!-1
			if %health% LEQ 0 (
			if %lifeup% == 1 (
			set /a lifeup=!lifeup!-1  
			echo You have died, but the one-up mushroom has brought you back!
			set /a health=1
		goto seventh
		)
		)
		)
		if %kill2% LEQ 90 (
			echo You have killed one of the goombas.
			set /a points=!points!+1
		)
		goto eighth
	)
	if %seven% == 3 (
		if %health% LSS 3 (
		goto seventh
		)
	)
	if %seven% == 3 (
		echo You have killed both goombas with your fireballs.
		set /a points=!points!+2 
		goto eighth
	)
	if %seven% == 4 (
		if %star% NEQ 1 goto sixth_2
	)
	if %seven% == 4 (
		echo You have killed the goombas by running into them.
		set /a points = !points!+2
		goto eighth
)

:eighth
echo You are on a pipe, are you ready to progress up the stairs to the victory pole?
pause
goto win



:dead 
echo You've died with %coin% coins and %points% points.
powershell start gameover.png
powershell start mariodie.jpg
taskkill /F /T /IM wscript.exe
start mariodeath.vbs
pause
goto top

:win
taskkill /F /T /IM wscript.exe
start victory.vbs
echo Congratulations %name%, you finished with %coin% coins, %points% points, %health% health and %lifeup% life up mushrooms.
set /a score = (%coin%*10) + (%points%*50) + (%health%*200) + (%lifeup%*250)1
echo Your score is %score%
echo %name% %score% >> scores.txt
goto decision

:decision
Your current options are:
echo 1. View other scores
echo 2. Restart
echo 3. Close the file
set /p last=
if %last% NEQ 1 if %last% NEQ 2 if %last% NEQ 3 goto decision
if %last% == 1 (
	type scores.txt
	pause
	goto decision
	)
if %last% == 2 (
	cls
	goto setup
)
if %last% == 3 exit