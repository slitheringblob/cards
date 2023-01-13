defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "Create deck creates 52 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 52
  end

  #another example of a jank test. Randomizing may lead to a same deck
  test "Shuffling a deck randmizes IT" do
    deck = Cards.create_deck
    assert deck != Cards.shuffle(deck)
  end

end
