%%
%class pr_43
%standalone
%unicode
%{
 
 String input;
 String[] vowels = {"ඌ", "ඕ", "ඕ", "ආ", "ආ", "ඈ", "ඈ", "ඈ", "ඊ", "ඊ", "ඊ", "ඊ", "ඒ", "ඒ", "ඒ", "ඌ", "ඌ", "ඖ", "ඇ", "අ", "ඇ", "ඉ", "එ", "උ", "ඔ", "ඓ" };

 String[] vowelsUni={"oo", "o\\", "oe", "aa", "a\\", "Aa", "A\\", "ae", "ii", "i\\", "ie", "ee",  "ea", "e\\", "ei", "uu", "u\\", "au", "/--+a", "a", "A", "i", "e", "u", "o", "I"};

 String[] vowelModifier = {"ූ", "ෝ", "ෝ", "ා","ා", "ෑ", "ෑ", "ෑ", "ී", "ී", "ී", "ී", "ේ", "ේ", "ේ", "ූ", "ූ", "ෞ", "ැ", "", "ැ", "ි", "ෙ", "ු", "ො", "ෛ"};
    
 String[] consonents = {"ඬ", "ඳ", "ඟ", "ථ", "ධ", "ඝ","ඡ", "ඵ", "භ", "ශ", "ෂ", "ඥ", "ඤ", "ළු", "ද", "ච", "ඛ", "ත", "ට", "ක", "ඩ", "න", "ප", "බ", "ම", "ය", "ය", "ය", "ජ", "ල", "ව", "ව", "ස", "හ", "ණ", "ළ", "ඛ", "ඝ", "ඨ", "ඪ", "ඵ", "ඹ", "ෆ", "ඣ", "ග", "ර"};

 String[] consonentsUni = {"nnd", "nndh", "nng", "Th", "Dh", "gh", "Ch", "ph", "bh", "sh", "Sh", "GN", "KN", "Lu", "dh", "ch", "kh", "th", "t", "k", "d", "n", "p", "b", "m", "\\u005C", "Y", "y", "j", "l", "v", "w", "s", "h", "N", "L", "K", "G", "T", "D", "P", "B", "f", "q", "g", "r"};

	String[] specialConsonents = {"ං", "ඃ", "ඞ","ඍ", /*"ර්", "ර්"*/};
	String[] specialConsonentsUni = {"NnN", "Hh", "NN", "Rg",/* "/R/g", "/\r/g"*/};

	String[] specialChars = {"ෲ", "ෘ"};
	String[] specialCharsUni = {"ruu", "ru"};
   //specialCharUni[2]='්‍ර'; specialChar[2]='ra';


 private void printText(String x){
    String s,r,s2="";

	//Special consonents
	for(int i=0;i<specialConsonentsUni.length;i++){
		x = x.replace(specialConsonentsUni[i], specialConsonents[i]);
	}
        
	//Consonents , specialvowels
	for(int i =0; i<specialChars.length;i++){
		for(int j=0; j<consonents.length;j++){
			
			s = consonentsUni[j] + specialCharsUni[i];
			r = consonents[j] + specialChars[i];	
			x = x.replace(s,r);

		}
	}

	//rakaransha
	 for(int i=0; i<consonents.length;i++){
    	for(int j=0;j<vowels.length;j++){
                
			s = consonentsUni[i]+ "r"+ vowelsUni[j];
         //r = "\u0DB4" + "\u0DCA"+ "\u200D"+ "\u0DBB" + vowelModifier[j]+ "";
         r = consonents[i] + "\u0DCA"+ "\u200D"+ "\u0DBB" + vowelModifier[j]+ "";
         x = x.replace(s,r);
		}
		s = consonentsUni[i]+ "r";
      r = consonents[i]+ "\u0DCA"+ "\u200D"+ "\u0DBB"+ "";
      x = x.replace(s,r);

	 }

	//yansaya
	 for(int i=0; i<consonents.length;i++){
    	for(int j=0;j<vowels.length;j++){
                
			s = consonentsUni[i]+ "y"+ vowelsUni[j];
         r = consonents[i] + "\u0DCA"+ "\u200D"+ "\u0DBA" + vowelModifier[j]+ "";
         x = x.replace(s,r);
		}
		s = consonentsUni[i]+ "y";
      r = consonents[i]+ "\u0DCA"+ "\u200D"+ "\u0DBA"+ "";
      x = x.replace(s,r);

	 }

    for(int i=0; i<consonents.length;i++){
    	for(int j=0;j<vowels.length;j++){
                
			s = consonentsUni[i]+ vowelsUni[j];
         r = consonents[i] + vowelModifier[j]+ "";
         x = x.replace(s,r);
		}

	 }
      
	//hal   
    for(int i=0; i<consonents.length;i++){
        s = consonentsUni[i];
        r = consonents[i]+ "්"+ "";
        x = x.replace(s,r);
    }
	
	//vowels
	 for(int j=0;j<vowels.length;j++){
                
			s = vowelsUni[j];
         r = vowels[j]+ "";
         x = x.replace(s,r);
		}
        
	
    System.out.println( x );
 }
%}

%%

([a-zA-Z])\w+ {  input = yytext(); 
            printText(input); }

[0-9]				{ System.out.println("Invalid input : "+yytext()); }
[*+-/@#$%&]\w+			{ System.out.println("Invalid input : "+yytext());}
