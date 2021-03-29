	var profile= false;	
	var html = false;
	var flask = false;
	var jsp = false;
	var iot = false;
	var arduino = false;
	var unity = false;
	var test=["unity","html","flask","iot","arduino","jsp","profile"];


	function switchOff()
	{
		for(var i=0;i<7;i++)
		{
			document.getElementById(test[i]).style.display="none";
			unity=html=flask=iot=arduino=jsp=profile=false;
		}
	}
	

	function func(val)
	{
		if(val=='profile')
		{
			if(profile==true)
			{
				switchOff();
			}
			else
			{
				switchOff();
				document.getElementById(val).style.display="block";
				profile=true;
			}
		}

		if(val=='html')
		{
			if(html==true)
			{
				switchOff();
			}
			else
			{
				switchOff();
				document.getElementById(val).style.display="block";
				html=true;
			}
		}

		if(val=='flask')
		{
			if(flask==true)
			{
				switchOff();
			}
			else
			{
				switchOff();
				document.getElementById(val).style.display="block";
				flask=true;
			}
		}

		if(val=='jsp')
		{
			if(jsp==true)
			{
				switchOff();
			}
			else
			{
				switchOff();
				document.getElementById(val).style.display="block";
				jsp=true;
			}
		}

		if(val=='iot')
		{
			if(iot==true)
			{
				switchOff();
			}
			else
			{
				switchOff();
				document.getElementById(val).style.display="block";
				iot=true;
			}
		}

		if(val=='arduino')
		{
			if(arduino==true)
			{
				switchOff();
			}
			else
			{
				switchOff();
				document.getElementById(val).style.display="block";
				arduino=true;
			}
		}

		if(val=='unity')
		{
			if(unity==true)
			{
				switchOff();
			}
			else
			{
				switchOff();
				document.getElementById(val).style.display="block";
				unity=true;
			}
		}

	}



