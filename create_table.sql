
CREATE TABLE "match" (
    "id" int   NOT NULL,
    "date" date   NOT NULL,
    "location" varchar   NOT NULL,
    "weight_class" varchar   NOT NULL,
    "winner_fighter_id" int   NOT NULL,
    "loser_fighter_id" int   NOT NULL,
    CONSTRAINT "pk_match" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "fighter" (
    "id" int   NOT NULL,
    "fighter_name" varchar   NOT NULL,
    "height" float   NOT NULL,
    "weight" float   NOT NULL,
    CONSTRAINT "pk_fighter" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "match" ADD CONSTRAINT "fk_match_winner_fighter_id" FOREIGN KEY("winner_fighter_id")
REFERENCES "fighter" ("id");

ALTER TABLE "match" ADD CONSTRAINT "fk_match_loser_fighter_id" FOREIGN KEY("loser_fighter_id")
REFERENCES "fighter" ("id");

