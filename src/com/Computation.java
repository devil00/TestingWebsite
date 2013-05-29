package com;

public class Computation {
	
	public float calculateScore(String ua, String ta){
		Float score= null;
		 if(ua != null)
		  {
			 if (ua.equals(ta))
			  {score=(float) 1.0;
			  }
			  
			  else{
				  score=(float) -0.25;
				  }
			  }
		 else{
			 score=(float) 0;
		 }
		return score;
		
	}

}
