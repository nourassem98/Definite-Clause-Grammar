
 
 s(A,Z) :- sentence(A,Z).
 s(A,Z) :- sentence(A,B), and(B,C), sentence(C,Z).
 s(A,Z) :- question(A,Z).
	s(tree(S)) --> sentence(S).
	s(tree(S,AND,S2)) --> sentence(S), and(AND), sentence(S2).
	s(tree(Q)) --> question(Q).
 
 
 sentence(A,Z) :- noun_phrase(A,B), verb_phrase(B,Z).
 sentence(A,Z) :- noun_phrase(A,B), verb_phrase(B,C), prep_phrase(C,Z).
 sentence(A,Z) :- noun_phrase(A,B), verb_phrase(B,C), prep_phrase(C,D), prep_phrase(D,Z).
 sentence(A,Z) :- noun_phrase(A,B), verb_phrase(B,C), and(C,D), verb_phrase(D,Z).
 sentence(A,Z) :- noun_phrase(A,B), and(B,C), noun_phrase(C,D), verb_phrase(D,Z). 
 sentence(A,Z) :- noun_phrase(A,B), and(B,C), noun_phrase(C,D), verb_phrase(D,E), and(E,F), verb_phrase(F,Z).
 sentence(A,Z) :- noun_phrase(A,B), and(B,C), noun_phrase(C,D), verb_phrase(D,E), prep_phrase(E,Z).
 sentence(A,Z) :- noun_phrase(A,B), and(B,C), noun_phrase(C,D), verb_phrase(D,E), prep_phrase(E,F), prep_phrase(F,Z).
	sentence(sentence(NP,VP)) --> noun_phrase(NP), verb_phrase(VP).
	sentence(sentence(NP,VP,PP)) --> noun_phrase(NP), verb_phrase(VP),prep_phrase(PP).
	sentence(sentence(NP,VP,PP1,PP2)) --> noun_phrase(NP), verb_phrase(VP),prep_phrase(PP1),prep_phrase(PP2).
	sentence(sentence(NP,VP,AND,VP2)) --> noun_phrase(NP), verb_phrase(VP),and(AND),verb_phrase(VP2).
	sentence(sentence(NP,AND,NP2,VP)) --> noun_phrase(NP), and(AND), noun_phrase(NP2),verb_phrase(VP).
	sentence(sentence(NP,AND,NP2,VP,AND2,VP2)) --> noun_phrase(NP), and(AND), noun_phrase(NP2),verb_phrase(VP), and(AND2), verb_phrase(VP2).
	sentence(sentence(NP,AND,NP2,VP,PP)) --> noun_phrase(NP), and(AND), noun_phrase(NP2),verb_phrase(VP), prep_phrase(PP).
	sentence(sentence(NP,AND,NP2,VP,PP,PP2)) --> noun_phrase(NP), and(AND), noun_phrase(NP2),verb_phrase(VP), prep_phrase(PP), prep_phrase(PP2).
	
 
 question(A,Z) :- interrogative_pronoun(A,B), verb_phrase(B,Z).
 question(A,Z) :- interrogative_pronoun(A,B), verb_phrase(B,C),verb_infinitive(C,Z).
	question(question(INTRG,VP)) --> interrogative_pronoun(INTRG), verb_phrase(VP).
	question(question(INTRG,VP,VINF)) --> interrogative_pronoun(INTRG), verb_phrase(VP),verb_infinitive(VINF).
 
 noun_phrase(A,Z) :- noun(A,Z).
 noun_phrase(A,Z) :- det(A,B), noun(B,Z).
 noun_phrase(A,Z) :- det(A,B), noun(B,C), pro_object1(C, D), pro_subject(D, E), verb(E,Z).
 noun_phrase(A,Z) :- det(A,B), adjective(B,C), noun(C,Z).
 noun_phrase(A,Z) :- det(A,B), adjective(B,C), adjective(C,D), noun(D,Z).
 noun_phrase(A,Z) :- nounPL(A,Z).
 noun_phrase(A,Z) :- detPL(A,B), nounPL(B,Z).
 noun_phrase(A,Z) :- adjective(A,B), nounPL(B,Z).
 noun_phrase(A,Z) :- detPL(A,B), adjective(B,C), nounPL(C,Z).
 noun_phrase(A,Z) :- detPL(A,B), adjective(B,C), adjective(C,D), nounPL(D,Z).
	 noun_phrase(np(N)) --> noun(N).
	 noun_phrase(np(D,N)) --> det(D), noun(N).
	 noun_phrase(np(D,N,PROOBJ1,PROSUBJ,V1)) --> det(D), noun(N), pro_object1(PROOBJ1), pro_subject(PROSUBJ), verb(V1).
	 noun_phrase(np(D,ADJ,N)) --> det(D), adjective(ADJ), noun(N).
	 noun_phrase(np(D,ADJ1,ADJ2,N)) --> det(D), adjective(ADJ1), adjective(ADJ2), noun(N).
	 noun_phrase(np(N)) --> nounPL(N).
	 noun_phrase(np(D,N)) --> detPL(D), nounPL(N).
	 noun_phrase(np(ADJ,N)) --> adjective(ADJ), nounPL(N).
	 noun_phrase(np(D,ADJ,N)) --> detPL(D), adjective(ADJ), nounPL(N).
	 noun_phrase(np(D,ADJ1,ADJ2,N)) --> detPL(D), adjective(ADJ1), adjective(ADJ2), nounPL(N).

 
 verb_phrase(A,Z) :- verb(A,B), noun_phrase(B,Z).
 verb_phrase(A,Z) :- verb(A,B), noun_phrase(B,C), noun_phrase(C,Z).
 verb_phrase(A,Z) :- verb(A,B), noun_phrase(B,C), and(C,D), noun_phrase(D,Z).
 verb_phrase(A,Z) :- verb(A,B), noun_phrase(B,C), pro_object1(C,D), pro_subject(D,E), verb(E,Z).
 verb_phrase(A,Z) :- adverb(A,B), verb(B,C), noun_phrase(C,Z).
 verb_phrase(A,Z) :- verb(A,B), and(B,C), verb(C,D), noun_phrase(D,Z).


	verb_phrase(vp(V,NP)) --> verb(V), noun_phrase(NP).
	verb_phrase(vp(V,NP,NP2)) --> verb(V), noun_phrase(NP), noun_phrase(NP2).
	verb_phrase(vp(V,NP,AND,NP2)) --> verb(V), noun_phrase(NP), and(AND), noun_phrase(NP2).
	verb_phrase(vp(V,NP,PROBJ1,PROSUBJ,V2)) --> verb(V), noun_phrase(NP), pro_object1(PROBJ1), pro_subject(PROSUBJ), verb(V2).
	verb_phrase(vp(ADV,V,NP)) --> adverb(ADV), verb(V), noun_phrase(NP).
	verb_phrase(vp(V,AND,V2,NP)) --> verb(V), and(AND), verb(V2), noun_phrase(NP).
 
 prep_phrase(A,Z) :- proposition(A,B), noun_phrase(B,Z).
	prep_phrase(pp(PREP,NP)) --> proposition(PREP), noun_phrase(NP).
 
 interrogative_pronoun([who|X],X). 
 interrogative_pronoun([what|X],X). 
 interrogative_pronoun([where|X],X). 
 interrogative_pronoun([how|X],X). 
 interrogative_pronoun([when|X],X).
	 interrogative_pronoun(intergPronoun(who)) --> [who].
	 interrogative_pronoun(intergPronoun(what)) --> [what].
	 interrogative_pronoun(intergPronoun(where)) --> [where].
	 interrogative_pronoun(intergPronoun(how)) --> [how].
	 interrogative_pronoun(intergPronoun(when)) --> [when].
 
 det([the|X], X).
 det([a|X], X).
 det([every|X], X).
 det([some|X], X).
	 det(det(the)) --> [the].
	 det(det(a)) --> [a].
	 det(det(every)) --> [every].
	 det(det(some)) --> [some].
 detPL([many|X], X).
 detPL([some|X], X).
 detPL([most|X], X).
 detPL([all|X], X).
	 detPL(dPL(many)) --> [many].
	 detPL(dPL(some)) --> [some].
	 detPL(dPL(most)) --> [most].
	 detPL(dPL(all)) --> [all].
 
 adjective([young|X], X).
 adjective([big|X], X).
 adjective([large|X], X).
 adjective([empty|X], X).
 adjective([tall|X], X).
 adjective([short|X], X).
 adjective([old|X], X).
 adjective([poor|X], X).
 adjective([white|X], X).
 adjective([brilliant|X], X).
 adjective([smart|X], X).
 adjective([rich|X], X).
 adjective([fat|X], X).
 adjective([talented|X], X).
 adjective([bright|X], X).
 adjective([thin|X], X).
 adjective([light|X], X).
 adjective([heavy|X], X).
 adjective([dark|X], X).
 adjective([sick|X], X).
	 adjective(adj(young)) --> [young].
	 adjective(adj(big)) --> [big].
	 adjective(adj(large)) --> [large].
	 adjective(adj(empty)) --> [empty].
	 adjective(adj(tall)) --> [tall].
	 adjective(adj(short)) --> [short].
	 adjective(adj(old)) --> [old].
	 adjective(adj(poor)) --> [poor].
	 adjective(adj(white)) --> [white].
	 adjective(adj(brilliant)) --> [brilliant].
	 adjective(adj(smart)) --> [smart].
	 adjective(adj(rich)) --> [rich].
	 adjective(adj(fat)) --> [fat].
	 adjective(adj(talented)) --> [talented].
	 adjective(adj(bright)) --> [bright].
	 adjective(adj(thin)) --> [thin].
	 adjective(adj(light)) --> [light].
	 adjective(adj(heavy)) --> [heavy].
	 adjective(adj(dark)) --> [dark].
	 adjective(adj(sick)) --> [sick].
 
 noun([boy|X], X).
 noun([box|X], X).
 noun([room|X], X).
 noun([school|X], X).
 noun([woman|X], X).
 noun([man|X], X).
 noun([envelope|X], X).
 noun([building|X], X).
 noun([shed|X], X).
 noun([tree|X], X).
 noun([girl|X], X).
 noun([student|X], X).
 noun([chair|X], X).
 noun([cat|X], X).
 noun([bat|X], X).
 noun([bed|X], X).
	 noun(n(boy)) --> [boy].
	 noun(n(box)) --> [box].
	 noun(n(room)) --> [room].
	 noun(n(school)) --> [school].
	 noun(n(woman)) --> [woman].
	 noun(n(man)) --> [man].
	 noun(n(envelope)) --> [envelope].
	 noun(n(building)) --> [building].
	 noun(n(shed)) --> [shed].
	 noun(n(tree)) --> [tree].
	 noun(n(girl)) --> [girl].
	 noun(n(student)) --> [student].
	 noun(n(chair)) --> [chair].
	 noun(n(cat)) --> [cat].
	 noun(n(bat)) --> [bat].
	 noun(n(bed)) --> [bed].
 
 nounPL([students|X], X).
 nounPL([professors|X], X).
 nounPL([lecturers|X], X).
 nounPL([scientists|X], X).
 nounPL([researchers|X], X).
	 nounPL(nPL(students)) --> [students].
	 nounPL(nPL(professors)) --> [professors].
	 nounPL(nPL(lecturers)) --> [lecturers].
	 nounPL(nPL(scientists)) --> [scientists].
	 nounPL(nPL(researchers)) --> [researchers].
 
 pro_subject([he|X], X).
 pro_subject([she|X], X).
 pro_object([him|X], X).
 pro_object([her|X], X).
 pro_object1([whom|X], X).
	 pro_subject(pronounSubj(he)) --> [he].
	 pro_subject(pronounSubj(she)) --> [she].
	 pro_object(pronounObj(him)) --> [him].
	 pro_object(pronounObj(her)) --> [her].
	 pro_object1(pronounObj1(whom)) --> [whom].
 
 and([and|X], X).	
	and(and(and)) --> [and].	

 adverb([quickly|X], X).
 adverb([well|X], X).
 adverb([softly|X], X).
 adverb([hardly|X], X).
 adverb([loudly|X], X).
 adverb([greedily|X], X).
 adverb([generously|X], X).
 adverb([patiently |X], X).
 adverb([quietly |X], X).
 adverb([gently |X], X).
	 adverb(adv(quickly)) --> [quickly].
	 adverb(adv(well)) --> [well].
	 adverb(adv(softly)) --> [softly].
	 adverb(adv(hardly)) --> [hardly].
	 adverb(adv(loudly)) --> [loudly].
	 adverb(adv(greedily)) --> [greedily].
	 adverb(adv(generously)) --> [generously].
	 adverb(adv(patiently)) --> [patiently].
	 adverb(adv(quietly)) --> [quietly].
	 adverb(adv(gently)) --> [gently].
 
 verb([pushed|X], X).
 verb([stored|X], X).
 verb([gave|X], X).
 verb([climbed|X], X).
 verb([watched|X], X).
 verb([liked|X], X).
 verb([shot|X], X).
 verb([admired|X], X).
 verb([appreciated|X], X).
 verb([did|X], X).
 verb([contained|X], X).
 verb([built|X], X).
 verb([killed|X], X).
 verb([drank|X], X).
 verb([ate|X], X).
 verb([ran|X], X).
 verb([walked|X], X).
 verb([thought|X], X).
 verb([stood|X], X).
 verb([danced|X], X).
 verb([likes|X], X).
	 verb(v(pushed)) --> [pushed].
	 verb(v(stored)) --> [stored].
	 verb(v(gave)) --> [gave].
	 verb(v(climbed)) --> [climbed].
	 verb(v(watched)) --> [watched].
	 verb(v(liked)) --> [liked].
	 verb(v(shot)) --> [shot].
	 verb(v(admired)) --> [admired].
	 verb(v(appreciated)) --> [appreciated].
	 verb(v(did)) --> [did].
	 verb(v(contained)) --> [contained].
	 verb(v(built)) --> [built].
	 verb(v(killed)) --> [killed].
	 verb(v(drank)) --> [drank].
	 verb(v(ate)) --> [ate].
	 verb(v(ran)) --> [ran].
	 verb(v(walked)) --> [walked].
	 verb(v(thought)) --> [thought].
	 verb(v(stood)) --> [stood].
	 verb(v(danced)) --> [danced].
	 verb(v(likes)) --> [likes].
 
 verb_infinitive([do|X], X).
 verb_infinitive([eat|X], X).
 verb_infinitive([kill|X], X).
 verb_infinitive([kiss|X], X).
 verb_infinitive([hate|X], X).
	 verb_infinitive(vInf(do)) --> [do].
	 verb_infinitive(vInf(eat)) --> [eat].
	 verb_infinitive(vInf(kill)) --> [kill].
	 verb_infinitive(vInf(kiss)) --> [kiss].
	 verb_infinitive(vInf(hate)) --> [hate].
 
 proposition([in|X],X).
 proposition([after|X],X). 
 proposition([behind|X],X). 
 proposition([along|X],X).
 proposition([as|X],X). 
 proposition([by|X],X). 
 proposition([off|X],X).
 proposition([through|X],X). 
 proposition([up|X],X). 
 proposition([over|X],X).
	 proposition(prepos(in)) --> [in].
	 proposition(prepos(after)) --> [after].
	 proposition(prepos(behind)) --> [behind].
	 proposition(prepos(along)) --> [along].
	 proposition(prepos(as)) --> [as].
	 proposition(prepos(by)) --> [by].
	 proposition(prepos(off)) --> [off].
	 proposition(prepos(through)) --> [through].
	 proposition(prepos(up)) --> [up].
	 proposition(prepos(over)) --> [over].