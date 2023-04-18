:- multifile dwight_stapler_in_jelly/0, creed_quest_done_full/0, creed_quest_done_half/0, holding/1.

inventory :-
    holding(creed_reference), write("Creed's reference");
    holding(jim_reference), write("Jim's reference");
    holding(dwight_reference), write("Dwight's reference");
    holding(stapler), write("Stapler");
    holding(stapler_in_jelly), write("Stapler in a jelly");
    holding(soda), write("Grape soda");
    holding(strange_soda), write("Strange soda");
    holding(coupon), write("Coupon to the vending machine (hint: type 'coupon.' to have a look").

coupon :-
    write("       =ONE FREE SODA="), nl,
    write("          F   G   H"), nl,
    write("       P 034 015 092"), nl,
    write("       R 059 041 065"), nl,
    write("       S 026 073 087"), nl.