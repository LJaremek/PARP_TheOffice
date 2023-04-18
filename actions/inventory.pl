:- multifile dwight_stapler_in_jelly/0, creed_quest_done_full/0, creed_quest_done_half/0, holding/1.

inventory :-
    (holding(creed_reference) -> write("Creed's reference"), nl; true),
    (holding(jim_reference) -> write("Jim's reference"), nl; true),
    (holding(dwight_reference) -> write("Dwight's reference"), nl; true),
    (holding(stapler) -> write("Stapler"), nl; true),
    (holding(stapler_in_jelly) -> write("Stapler in a jelly"), nl; true),
    (holding(soda) -> write("Grape soda"), nl; true),
    (holding(strange_soda) -> write("Strange soda"), nl; true),
    (holding(coupon) -> write("Coupon to the vending machine (hint: type 'coupon.' to have a look)"), nl; true),
    nl.

coupon :-
    write("       =ONE FREE SODA="), nl,
    write("          F   G   H"), nl,
    write("       P 034 015 092"), nl,
    write("       R 059 041 065"), nl,
    write("       S 026 073 087"), nl.