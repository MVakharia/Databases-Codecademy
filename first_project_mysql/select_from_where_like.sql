SELECT * FROM spellcaster_searcher_exodia WHERE card_name LIKE '%Forbidden One';

SELECT * FROM spellcaster_searcher_exodia WHERE card_name LIKE '%Spellbook%';



SELECT * FROM spellcaster_searcher_exodia WHERE card_name NOT LIKE '%Forbidden One%';

SELECT SUM(quantity) FROM spellcaster_searcher_exodia WHERE card_name LIKE '%of%';

SELECT SUM(quantity) FROM spellcaster_searcher_exodia;

SELECT * FROM spellcaster_searcher_exodia;