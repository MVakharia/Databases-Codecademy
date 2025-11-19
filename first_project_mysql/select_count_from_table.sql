--Number of unique card names.
SELECT COUNT(DISTINCT card_name) from spellcaster_searcher_exodia;

--Number of unique attributes.
SELECT COUNT(DISTINCT attribute) from spellcaster_searcher_exodia;

--Number of unique atk values.
SELECT COUNT(DISTINCT spellcaster_searcher_exodia.atk) from spellcaster_searcher_exodia;

SELECT COUNT(DISTINCT spellcaster_searcher_exodia.def) from spellcaster_searcher_exodia;

SELECT COUNT(DISTINCT spellcaster_searcher_exodia.set_code) from spellcaster_searcher_exodia;

-- Number of items in the table that have an 'atk' value.
SELECT COUNT(atk) from spellcaster_searcher_exodia;

-- Number of items in the table that have an 'attribute' value.
SELECT COUNT(spellcaster_searcher_exodia.attribute) from spellcaster_searcher_exodia;

