program battleship;

uses crt;

var i, y, x, c, points, cpoints:integer;
	posts, cposts, empty:array[1..25] of string;
	bool, cbool:array[1..25] of boolean;
	ships:array[1..10] of string;
	waves, attacked:string;
	dead, cdead:boolean;
	key, yesorno:char;
	
	
	
procedure intro();
	begin
	writeln('           ____    _  _____ _____ _     _____ ____  _   _ ___ ____');
	writeln('          | __ )  / \|_   _|_   _| |   | ____/ ___|| | | |_ _|  _ \');
	writeln('          |  _ \ / _ \ | |   | | | |   |  _| \___ \| |_| || || |_) ');
	writeln('          | |_) / ___ \| |   | | | |___| |___ ___) |  _  || ||  __/');
	writeln('          |____/_/   \_\_|   |_| |_____|_____|____/|_| |_|___|_|');
	writeln('');
	writeln('      /\                                                             /\');
	writeln('      ||                                                             ||');
	writeln('      ||                             |__                             ||');
	writeln('     /||\                            |\/                            /||\');
	writeln('    /:||:\                           ---                           /:||:\');
	writeln('    |:||:|                           / | [                         |:||:|');
	writeln('    |/||\|                    !      | |||                         |/||\|');
	writeln('      **                    _/|     _/|-++`                          **');
	writeln('      **                +  +--|    |--|--|_ |-                       **');
	writeln('                     { /|__|  |/\__|  |--- |||__/');
	writeln('                    +---------------___[}-_===_.`____                 /\');
	writeln('                ____`-` ||___-{]_| _[}-  |     |_[___\==--            \/');
	writeln(' __..._____--==/___]_|__|_____________________________[___\==--____,------` .7');
	writeln('|                                                                     BB-61/');
	writeln(' \_________________________________________________________________________|');
	writeln();
	end;
	
procedure explosion();
	begin
	writeln('                               ________________');
	writeln('                          ____/ (  (    )   )  \_');
	writeln('                         /( (  (  )   _    ))  )   )\');
	writeln('                       ((     (   )(    )  )   (   )  )');
	writeln('                     ((/  ( _(   )   (   _) ) (  () )  )');
	writeln('                    ( (  ( (_)   ((    (   )  .((_ ) .  )_');
	writeln('                   ( (  )    (      (  )    )   ) . ) (   )');
	writeln('                  (  (   (  (   ) (  _  ( _) ).  ) . ) ) ( )');
	writeln('                  ( (  (   ) (  )   (  ))     ) _)(   )  )  )');
	writeln('                 ( (  ( \ ) (    (_  ( ) ( )  )   ) )  )) ( )');
	writeln('                  (  (   (  (   (_ ( ) ( _    )  ) (  )  )   )');
	writeln('                 ( (  ( (  (  )     (_  )  ) )  _)   ) _( ( )');
	writeln('                  ((  (   )(    (     _    )   _) _(_ (  (_ )');
	writeln('                   (_((__(_(__(( ( ( |  ) ) ) )_))__))_)___)');
	writeln('                   ((__)        \\||lll|l||///          \_))');
	writeln('                            (   /(/ (  )  ) )\   )');
	writeln('                          (    ( ( ( | | ) ) )\   )');
	writeln('                           (   /(| / ( )) ) ) )) )');
	writeln('                         (     ( ((((_(|)_)))))     )');
	writeln('                          (      ||\(|(|)|/||     )');
	writeln('                        (        |(||(||)||||        )');
	writeln('                          (     //|/l|||)|\\ \     )');
	writeln('                        (/ / //  /|//||||\\  \ \  \ _)');
	writeln('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
	end;

procedure credits();
	begin
	writeln('     /     )');
	writeln('    (_    _)                     0_,-.__');
	writeln('      (_  )_                     |_.-._/'); 
	writeln('       (    )                    |_--..\        ΤΡΕΛΗΣ ΧΑΡΑΛΑΜΠΟΣ');
	writeln('        (__)                     |__--_/');
	writeln('     |``   ``\                   |');
	writeln('     |        \                  |      /b.');
	writeln('     |         \  ,,,---===?A`\  |  ,==y`');
	writeln('   ___,,,,,---==""\        |M] \ | ;|\ |>                        1ΙΤΕΠ01');
	writeln('           _   _   \   ___,|H,,---==""""bno,');
	writeln('    o  O  (_) (_)   \ /          _     AWAW/');
	writeln('                     /         _(+)_  dMM/');
	writeln('      \@_,,,,,,---=="   \      \\|//  MW/                               2016');
	writeln('--````"                         ===  d/');
	writeln('                                    ,`________________________________________');                                    //
	writeln('   \    \    \     \               ,/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
	writeln('                         _____    ,`  ~~~   .-""-.~~~~~~  .-""-.~~~~~~  .-""-.');
	writeln('      .-""-.           ///==---   /`-._ ..-`      -.__..-`._ ..-`      -.__..-');
	writeln('            `-.__..-` =====\\\\\\ V/  .---\. .---\. -.__..-`._ ..-`.---\..---\');
	writeln('                      ~~~~~~~~~~~~, _`,--/_.\  .-""-. _`,--/_.\  .-""-. _`,--/');
	writeln('                            .-""-.___` --  \|         -.__..-`         -.__..-');
	end;
	
procedure defeat();
	begin
	writeln('   MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM');
	writeln('   MMMMMMMMMMMM        MMMMMMMMMMMM');
	writeln('   MMMMMMMMMM            MMMMMMMMMM');
	writeln('   MMMMMMMMM              MMMMMMMMM');
	writeln('   MMMMMMMM                MMMMMMMM');
	writeln('   MMMMMMM                 MMMMMMMM    You lost the game!! ');
	writeln('   MMMMMMM                  MMMMMMM');
	writeln('   MMMMMMM                  MMMMMMM');
	writeln('   MMMMMMM    MMM    MMM    MMMMMMM');
	writeln('   MMMMMMM   MMMMM   MMMM   MMMMMMM');
	writeln('   MMMMMMM   MMMMM   MMMM   MMMMMMM');
	writeln('   MMMMMMMM   MMMM M MMMM  MMMMMMMM');
	writeln('   MMVKMMMM        M        MMMMMMM');
	writeln('   MMMMMMMM       MMM      MMMMMMMM');
	writeln('   MMMMMMMMMMMM   MMM  MMMMMMMMMMMM');
	writeln('   MMMMMMMMMM MM       M  MMMMMMMMM');
	writeln('   MMMMMMMMMM  M M M M M MMMMMMMMMM');
	writeln('   MMMMMMMMMMM MMMMMMMMM MMMMMMMMMM');
	writeln('   MMMMMMMMMMM M MMMMM M MMMMMMMMMM');
	writeln('   MMMMMMMMMMM   M M M  MMMMMMMMMMM');
	writeln('   MMMMMMMMMMMM         MMMMMMMMMMM');
	writeln('   MMMMMMMMMMMMMM     MMMMMMMMMMMMM');
	writeln('   MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM');
	end;
	
procedure compdefeat();
	begin
	writeln('   MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM');
	writeln('   MMMMMMMMMMMM        MMMMMMMMMMMM');
	writeln('   MMMMMMMMMM            MMMMMMMMMM');
	writeln('   MMMMMMMMM              MMMMMMMMM');
	writeln('   MMMMMMMM                MMMMMMMM');
	writeln('   MMMMMMM                 MMMMMMMM    Your opponent lost the game!! ');
	writeln('   MMMMMMM                  MMMMMMM');
	writeln('   MMMMMMM                  MMMMMMM');
	writeln('   MMMMMMM    MMM    MMM    MMMMMMM');
	writeln('   MMMMMMM   MMMMM   MMMM   MMMMMMM');
	writeln('   MMMMMMM   MMMMM   MMMM   MMMMMMM');
	writeln('   MMMMMMMM   MMMM M MMMM  MMMMMMMM');
	writeln('   MMVKMMMM        M        MMMMMMM');
	writeln('   MMMMMMMM       MMM      MMMMMMMM');
	writeln('   MMMMMMMMMMMM   MMM  MMMMMMMMMMMM');
	writeln('   MMMMMMMMMM MM       M  MMMMMMMMM');
	writeln('   MMMMMMMMMM  M M M M M MMMMMMMMMM');
	writeln('   MMMMMMMMMMM MMMMMMMMM MMMMMMMMMM');
	writeln('   MMMMMMMMMMM M MMMMM M MMMMMMMMMM');
	writeln('   MMMMMMMMMMM   M M M  MMMMMMMMMMM');
	writeln('   MMMMMMMMMMMM         MMMMMMMMMMM');
	writeln('   MMMMMMMMMMMMMM     MMMMMMMMMMMMM');
	writeln('   MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM');
	end;

procedure fillarrays();
	begin
	ships[1]:='MotherShip';
	ships[2]:='GaloonShip';
	ships[3]:='CanonShip1';
	ships[4]:='CanonShip2';
	ships[5]:='CanonShip3';
	ships[6]:=' Skoona1  ';
	ships[7]:=' Skoona2  ';
	ships[8]:=' Skoona3  ';
	ships[9]:='  Mine1   ';
	ships[10]:='  Mine2   ';
		for i:=1 to 25 do
			begin
			posts[i]:='  Empty   ';
			cposts[i]:='  Empty   ';
			empty[i]:=waves;
			bool[i]:=false;
			cbool[i]:=false;
			end;
		for i:=1 to 10 do 
			begin
				repeat
				x:=random(25)+1;
					if (cposts[x]='  Empty   ') then cposts[x]:=ships[i];
				until (cposts[x]=ships[i]);
			end;
	end;
	
procedure enter();
	begin
	writeln();
	writeln('Press <Enter> to continue.');
	readln();
	clrscr;
	end;
	
procedure wrongbutton();
	begin
	writeln('Wrong choice! Try Again!');
	delay(2000);
	clrscr;
	end;
	
procedure escenter();
	begin
		repeat
			begin
			writeln ('Press <Enter> to start the game or <Esc> for exit.');
			key:=readkey;
			clrscr;	
				case key of
				#13, #0, #28:	begin
								writeln ('Battleship starts ! ! !':50);
								delay(2000);
								clrscr;
								end;
				#27:	begin
							repeat
							writeln ('Are you sure? You want finish the game? (Y)es or (N)o.');
							yesorno:=readkey;	
							clrscr;
								case yesorno of
								#89, #121:	begin
												writeln ('Exit game...':50);
												delay(2000);
												credits();
												delay(2000);
												clrscr;
												halt;
												end;
								#78, #110:	begin
											writeln ('Battleship starts ! ! !':50);
											delay(2000);
											clrscr;
											end
								else wrongbutton();
								end;
						until (yesorno=#78) or (yesorno=#110) or (yesorno=#89) or (yesorno=#121);
					end;
				else wrongbutton();
				end;
			end;
		until (key=#13) or (key=#27) or (key=#0) or (key=#28);
	end;

procedure usermap();
	begin
	writeln();
	writeln('                         YOUR MAP                                 YOUR FLEET');
	writeln('  ______________________________________________________        ______________');
	writeln(' |1~ ~ ~ ~ ~|2~ ~ ~ ~ ~|3~ ~ ~ ~ ~|4~ ~ ~ ~ ~|5~ ~ ~ ~ ~|      | 1) ', ships[1], '|');
	writeln(' |', posts[1], '|', posts[2], '|', posts[3], '|', posts[4], '|', posts[5], '|      | 2) ', ships[2], '|');
	writeln(' |__________|__________|__________|__________|__________|      | 3) ', ships[3], '|');
	writeln(' |6~ ~ ~ ~ ~|7~ ~ ~ ~ ~|8~ ~ ~ ~ ~|9~ ~ ~ ~ ~|10 ~ ~ ~ ~|      | 4) ', ships[4], '|');
	writeln(' |', posts[6], '|', posts[7], '|', posts[8], '|', posts[9], '|', posts[10], '|      | 5) ', ships[5], '|');
	writeln(' |__________|__________|__________|__________|__________|      | 6) ', ships[6], '|');
	writeln(' |11 ~ ~ ~ ~|12 ~ ~ ~ ~|13 ~ ~ ~ ~|14 ~ ~ ~ ~|15 ~ ~ ~ ~|      | 7) ', ships[7], '|');
	writeln(' |', posts[11], '|', posts[12], '|', posts[13], '|', posts[14], '|', posts[15], '|      | 8) ', ships[8], '|');
	writeln(' |__________|__________|__________|__________|__________|      | 9) ', ships[9], '|');
	writeln(' |16 ~ ~ ~ ~|17 ~ ~ ~ ~|18 ~ ~ ~ ~|19 ~ ~ ~ ~|20 ~ ~ ~ ~|      |10) ', ships[10], '|');
	writeln(' |', posts[16], '|', posts[17], '|', posts[18], '|', posts[19], '|', posts[20], '|      |______________|');
	writeln(' |__________|__________|__________|__________|__________|');
	writeln(' |21 ~ ~ ~ ~|22 ~ ~ ~ ~|23 ~ ~ ~ ~|24 ~ ~ ~ ~|25 ~ ~ ~ ~|');
	writeln(' |', posts[21], '|', posts[22], '|', posts[23], '|', posts[24], '|', posts[25], '|      Your points:', points);
	writeln(' |__________|__________|__________|__________|__________|  Computer points:', cpoints);
	writeln();
	end;
	
procedure compmap();
	begin
	writeln();
	writeln('                      COMPUTER MAP');
	writeln(' ______________________________________________________');
	writeln(' |1~ ~ ~ ~ ~|2~ ~ ~ ~ ~|3~ ~ ~ ~ ~|4~ ~ ~ ~ ~|5~ ~ ~ ~ ~|');
	writeln(' |', empty[1], '|', empty[2], '|', empty[3], '|', empty[4], '|', empty[5], '|');
	writeln(' |__________|__________|__________|__________|__________|');
	writeln(' |6~ ~ ~ ~ ~|7~ ~ ~ ~ ~|8~ ~ ~ ~ ~|9~ ~ ~ ~ ~|10 ~ ~ ~ ~|');
	writeln(' |', empty[6], '|', empty[7], '|', empty[8], '|', empty[9], '|', empty[10], '|');
	writeln(' |__________|__________|__________|__________|__________|');
	writeln(' |11 ~ ~ ~ ~|12 ~ ~ ~ ~|13 ~ ~ ~ ~|14 ~ ~ ~ ~|15 ~ ~ ~ ~|');
	writeln(' |', empty[11], '|', empty[12], '|', empty[13], '|', empty[14], '|', empty[15], '|');
	writeln(' |__________|__________|__________|__________|__________|');
	writeln(' |16 ~ ~ ~ ~|17 ~ ~ ~ ~|18 ~ ~ ~ ~|19 ~ ~ ~ ~|20 ~ ~ ~ ~|');
	writeln(' |', empty[16], '|', empty[17], '|', empty[18], '|', empty[19], '|', empty[20], '|');
	writeln(' |__________|__________|__________|__________|__________|');
	writeln(' |21 ~ ~ ~ ~|22 ~ ~ ~ ~|23 ~ ~ ~ ~|24 ~ ~ ~ ~|25 ~ ~ ~ ~|');
	writeln(' |', empty[21], '|', empty[22], '|', empty[23], '|', empty[24], '|', empty[25], '|      Your points:', points);
	writeln(' |__________|__________|__________|__________|__________|  Computer points:', cpoints);
	writeln();
	end;
		

begin
repeat
cursoroff;
randomize();
attacked:='    X     ';
waves:='~ ~ ~ ~ ~ ';
dead:=false;
cdead:=false;
points:=0;
cpoints:=0;
fillarrays();
intro();
escenter();
	for x:=1 to 10 do
		begin
			repeat
			clrscr;
			usermap();
			writeln();
			write('Choose a place (1-25) from the map for your ', ships[x], '.  ');
			readln(y);
			writeln();
				if (y>0) and (y<26) then				
					if (posts[y]='  Empty   ') then posts[y]:=ships[x]
					else	begin
						 	writeln('In place ', y,' you load the ', posts[y],'.');
						 	delay(3000);
						 	end
				else wrongbutton();
			until (y>0) and (y<26) and (posts[y]=ships[x]);
		end;
clrscr;
usermap();
enter();
clrscr;
compmap();
writeln('Your opponent is choosing his posts...');
writeln();
enter();
	repeat
		repeat
		clrscr;
		compmap();
		write('Choose a number (1-25) for your attack.  ');
		readln(y);
		writeln();
			if (cbool[y]=true) then
				begin
				writeln('You have already attack this post. Try again!');
				enter();
				end;
	until (cbool[y]=false);
	if (cbool[y]=false) then 
		begin
		empty[y]:=cposts[y];
			if (empty[y]='MotherShip') then
				begin
				points:=points+1000;
				clrscr;
				explosion();
				writeln('You exterminate the MotherShip! You won 1000 points.');
				enter();
				end
			else if (empty[y]='GaloonShip') then
				begin
				points:=points+500;
				clrscr;
				explosion();
				writeln('You exterminate the GaloonShip! You won 500 points.');
				enter();
				end
			else if (empty[y]='CanonShip1') or (empty[y]='CanonShip2') or (empty[y]='CanonShip3') then	
				begin
				points:=points+200;
				clrscr;
				explosion();
				writeln('You exterminate a CanonShip! You won 200 points.');
				enter();
				end
			else if (empty[y]=' Skoona1  ') or (empty[y]=' Skoona2  ') or (empty[y]=' Skoona3  ') then
				begin
				points:=points+100;
				clrscr;
				explosion();
				writeln('You exterminate a Skoona! You won 100 points.');
				enter();
				end
			else if (empty[y]='  Mine1   ') or (empty[y]='  Mine2   ') then	
				begin
				points:=0;
				dead:=true;
				clrscr;
				defeat();
				writeln('You are DEAD!');
				enter();
				end
			else	begin
					points:=points+0;
					writeln('This post is empty');
					enter();
					end;
			cbool[y]:=true;
		end;	
	if (points<>2400) and (dead=false) then
		begin
			repeat
			clrscr;
			usermap();
			y:=random(25)+1;
				if (bool[y]=true) then writeln();
			until (bool[y]=false);
		if (bool[y]=false) then
			begin
			writeln('Computer choose post number ', y,' to attack.');
			writeln();
			delay(2000);
				if (posts[y]='MotherShip') then
					begin
					cpoints:=cpoints+1000;
					clrscr;
					explosion();
					writeln('Your MotherShip is exterminated! Computer won 1000 points.');
					enter();
					posts[y]:=attacked;					
					end
				else if (posts[y]='GaloonShip') then
					begin
					cpoints:=cpoints+500;
					clrscr;
					explosion();
					writeln('Your GaloonShip is exterminated! Computer won 500 points.');
					enter();
					posts[y]:=attacked;
					end
				else if (posts[y]='CanonShip1') or (posts[y]='CanonShip2') or (posts[y]='CanonShip3') then	
					begin
					cpoints:=cpoints+200;
					clrscr;
					explosion();
					writeln('A CanonShip is exterminated! Computer won 200 points.');
					enter();
					posts[y]:=attacked;
					end
				else if (posts[y]=' Skoona1  ') or (posts[y]=' Skoona2  ') or (posts[y]=' Skoona3  ') then
					begin
					cpoints:=cpoints+100;
					clrscr;
					explosion();
					writeln('A Skoona is exterminated! Computer won 100 points.');
					enter();
					posts[y]:=attacked;
					end
				else if (posts[y]='  Mine1   ') or (posts[y]='  Mine2   ') then	
					begin
					cpoints:=0;
					cdead:=true;
					clrscr;
					compdefeat();
					writeln('Your opponent is DEAD!');
					enter();
					posts[y]:=attacked;
					end
				else	begin
						cpoints:=cpoints+0;
						writeln('This post is empty');
						enter();
						posts[y]:=attacked;
						end;
				bool[y]:=true;
			end;
		end;
	until (points=2400) or (cpoints=2400) or (dead=true) or (cdead=true);
until (yesorno=#89) or (yesorno=#121);
end.