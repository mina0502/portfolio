	var unity = false;
	var html = false;
	var flask = false;
	var iot = false;
	var arduino = false;
	var jsp = false;
	var profile= false;	

	function func()
	{
		if(profile==true)
		{
			document.getElementById("profile").style.display="none";
			profile=false;
			return;
		}
		else
		{
			document.getElementById("profile").style.display="block";
			profile=true;
			return;
		}
	}



	function func1()
	{
		if(html==true)
		{
			document.getElementById("html").style.display="none";
			html=false;
			return;
		}
		else
		{
			document.getElementById("html").style.display="block";
			html=true;
			return;
		}
	}

	function func2()
	{
		if(flask==true)
		{
			document.getElementById("flask").style.display="none";
			flask=false;
			return;
		}
		else
		{
			document.getElementById("flask").style.display="block";
			flask=true;
			return;
		}
	}

	function func3()
	{
		if(jsp==true)
		{
			document.getElementById("jsp").style.display="none";
			jsp=false;
			return;
		}
		else
		{
			document.getElementById("jsp").style.display="block";
			jsp=true;
			return;
		}
	}

	function func4()
	{
		if(iot==true)
		{
			document.getElementById("iot").style.display="none";
			iot=false;
			return;
		}
		else
		{
			document.getElementById("iot").style.display="block";
			iot=true;
			return;
		}
	}

	
	function func5()
	{
		if(arduino==true)
		{
			document.getElementById("arduino").style.display="none";
			arduino=false;
			return;
		}
		else
		{
			document.getElementById("arduino").style.display="block";
			arduino=true;
			return;
		}
	}

		function func6()
	{
		if(unity==true)
		{
			document.getElementById("unity").style.display="none";
			unity=false;
			return;
		}
		else
		{
			document.getElementById("unity").style.display="block";
			unity=true;
			return;
		}
	}