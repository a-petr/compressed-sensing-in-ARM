# compressed-sensing-in-ARM
Intro lecture notes on compressed sensing in Armenian\ Սեղմ նմուշառություն։ ծանոթագրություն

Սեղմ նմուշառությունը (անգլ․   compressed sampling կամ compressed sensing) մեթոդ է, որը հնարավորություն է տալիս
վերականգնել անհայտ ֆունկցիան՝ հնարավորինս քիչ քանակաթյամբ չափումներով կատարելով: Կախված խնդրից, ֆունկցիան 
իրենից կարող է ներկայացնել ձայնագրված խոսք, թվային ֆոտոպատկեր կամ նկարագրել որևէ ֆիզիկական երևույթ։  
Հիմնական ենթադրությունը կայանում է նրանում, որ  ֆունկցիան ունի նոսր վերլուծության գործակիցներ ինչ-որ 
օրթոնորմալ բազիսում,  այսինքն վերլուծության գործակիցների միայն փոքր մասն է 0-ից տարբեր։ Բազիսի ընտրությունը 
կախված է խնդրից։ Այս ենթադրության բնական լինելը ցույց է տրվում փորձնականում՝ նկարների և ձայնագրությունների համար
համապատասխանաբար Հաարի և կոսինուսային բազիսներում ուսումնասիրելով նրանց վերլուծությունը։ Սա է այն հատկությունը, 
որ թույլ է տալիս կատարել թվային պատկերների և ձայնագրությունների  սեղմում։ Սեղմ նմուշառության ժամանակ ասում ենք, 
որ սեղմումը և նմուշառությունը կատարվում են միաժամանակ։ 

Չափումների քանակի քչացումը մասնավորապես մեծ կարևորություն ունի մագնիսարեզոնանսային տոմոգրաֆիայում 
(նվազեցնում է  ժամանակահատվածը, որը այժմ 15-90 րոպե է, և ավելացնում է հարմարավետոությունը)։ 
2017 թվականի հունիսին, Siemens ընկերության կողմից ստեղծված սկանները, որը սկանավորման 
ժամանակը նվազեցնում է շուրջ տաս անգամ և  օգտագործում է սեղմ նմուշառություն, ստացել է ԱՄՆ Սննդի և 
Դեղերի Գործակալության FDA) հաստատումը և կարող է կիրառվել հիվանդանոցներում։ 

Սեղմ նմուշառության մաթեմատիկական տեսությունը սկիզբ է առել 
Թերենս Թաօյի, Էմանուել Կանդեսի, Դեյվիդ Դոնոհոի և Ջասթին Րոմբերգի 2004 թվականին տպագրված արդյունքներից
և  համարվում է ժամանակակից կիրառական մաթեմատիկայի կայացած ճյուղերից մեկը։

Այս կարճ ծանոթագրությունը նախատեսված է ցածր կուրսի ուսանողների համար։ Ավելի մանրամասն ծանոթանալու համար
տես հղումները։


Ներկայացված նյութը լիարժեք հասկանալու համար ծանոթությունը գծային հանրահաշվի և մաթ․ անալիզի որոշ հիմնարար 
հասկացությունների հետ (վեկտոր, մատրից, գծային հավասարումների լուծում, գծային հարթություն, օրթոնորմալ բազիս, 
ֆունկցիայի ածանցյալ և այլն) նախընտրելի է։ Միևնույն ժամանակ, որոշ այլ հասկացություններ կսահմանվեն ընթացքում։


 Ներառված են նաև haar2dthrsh.m և soundthrsh.m ֆայլերը համոզվելու համար, որ համապատասխանաբար թվային պատկերները ունեն նոսր վերլուծություն Հաարի բազիսում և թվային ձայնագրությունները ունեն նոսր վերլուծություն կոսինուսային բազիսում։  CSmodified.m ֆայլը l1-magic փաթեթի CSexample.m Ֆայլի մի փոքր փոփոխված տարբերակն է, որ l1 մինիմիզացիայի միջոցով վերականգնում է նոսր վեկտորը փոքր թվով չափումների միջոցով։ Տեղ գտած կոդը օգտագործում է  Matlab ծրագրավորման լեզուն։ Այն միգուցե ամենից օպտիմալը չէ, սակայն բավարար է նյութին ծանոթանալու համար։

Հայերեն LaTex-ի համար օգտագործվել է armtex  համակարգը։ 
