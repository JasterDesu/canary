-- Minlevel and multiplier are MANDATORY
-- Maxlevel is OPTIONAL, but is considered infinite by default
-- Create a stage with minlevel 1 and no maxlevel to disable stages
experienceStages = 
{
	{
		minlevel = 1,
		maxlevel = 8,
		multiplier = 40
	}, 
	{
		minlevel = 9,
		maxlevel = 60,
		multiplier = 400
	}, 
	{
		minlevel = 61,
		maxlevel = 100,
		multiplier = 350
	}, 
	{
		minlevel = 101,
		maxlevel = 200,
		multiplier = 300
	},
	{
		minlevel = 201,
		maxlevel = 300,
		multiplier = 250
	},
	{
		minlevel = 301,
		maxlevel = 400,
		multiplier = 200
	},
	{
		minlevel = 401,
		maxlevel = 500,
		multiplier = 150
	},
	{
		minlevel = 501,
		maxlevel = 600,
		multiplier = 100
	},
	{
		minlevel = 601,
		maxlevel = 700,
		multiplier = 80
	},
	{
		minlevel = 701,
		maxlevel = 800,
		multiplier = 60
	},	
	{
		minlevel = 801,
		maxlevel = 900,
		multiplier = 40
	},	
	{
		minlevel = 901,
		maxlevel = 1000,
		multiplier = 20
	},	
	{
		minlevel = 1001,
		maxlevel = 1200,
		multiplier = 10
	},	
	{
		minlevel = 1201,
		maxlevel = 1400,
		multiplier = 8
	},	
	{
		minlevel = 1201,
		maxlevel = 1600,
		multiplier = 5
	},	
	{
		minlevel = 1601,
		maxlevel = 2000,
		multiplier = 3
	},	
	{
		minlevel = 2001,
		maxlevel = 2200,
		multiplier = 2
	},	
	{
			minlevel = 2201,
			multiplier = 1
	},
}

skillsStages = 
{
	{
		minlevel = 0,
		maxlevel = 30,
		multiplier = 60
	}, 
	{
		minlevel = 31,
		maxlevel = 60,
		multiplier = 40
	}, 
	{
		minlevel = 61,
		maxlevel = 90,
		multiplier = 10
	}, 
	{
		minlevel = 91,
		maxlevel = 110,
		multiplier = 8
	}, 
	{
		minlevel = 111,
		maxlevel = 130,
		multiplier = 6
	}, 
	{
		minlevel = 131,
		maxlevel = 140,
		multiplier = 4.5
	},
	{
		minlevel = 141,
		maxlevel = 150,
		multiplier = 3
	},
	{
		minlevel = 151,
		multiplier = 2
	},
}

magicLevelStages = {
	{
		minlevel = 0,
		maxlevel = 30,
		multiplier = 30
	}, 
	{
		minlevel = 31,
		maxlevel = 60,
		multiplier = 15
	}, 
	{
		minlevel = 61,
		maxlevel = 90,
		multiplier = 10
	}, 
	{
		minlevel = 91,
		maxlevel = 110,
		multiplier = 6
	}, 
	{
		minlevel = 111,
		maxlevel = 130,
		multiplier = 3
	}, 
	{
		minlevel = 131,
		multiplier = 2
	},
}

fist = {
	{
	    minlevel = 0,
	    maxlevel = 30,
	    multiplier = 10
    }, {
	    minlevel = 31,
	    maxlevel = 50,
	    multiplier = 8
    }, {
		minlevel = 51,
		maxlevel = 70,
		multiplier = 6
    }, {
		minlevel = 71,
		maxlevel = 90,
		multiplier = 4
    }, {
		minlevel = 91,
		maxlevel = 111,
		multiplier = 2
    }, {
		minlevel = 111,
		multiplier = 1
    },
}