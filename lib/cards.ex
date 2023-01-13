defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  Provides Methods for creating and handling a deck of cards
  """

  @doc """
  Returns a list of strings that has all the possible cards
  """
  def create_deck do
    values = ["Ace","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten","Jack","King","Queen"]
    suits = ["Spades","Clubs", "Hearts","Diamonds"]

  # baby dumbo solution    
  #   cards = for value <- values do
  #     for suit <- suits do
  #       "#{value} of #{suit}"
  #     end   
  #   end
  #   List.flatten(cards)
  # end
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end  
  end

  @doc """
    Shuffles the list of cards given as a function argument
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Checks is a list of cards contains a specific card
  """
  def contains(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Divides a deck into a hand and a remainder if the deck.
    the `hand_size` arg indicates the number of cards in the deck

    ## Examples
        iex> deck = Cards.create_deck
        iex> {hand, _deck} = Cards.deal(deck,1)
        iex> hand
        ["Ace of Spades"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Saves a list of cards(deck) to a file in binary format
  """
  def save(deck, file_name) do
    binary = :erlang.term_to_binary(deck)
    File.write!(file_name , binary, [])
  end

  @doc """
    Read a file and convert it to a list of string of cards.
  """
  def deck_read(file_name) do
    case File.read(file_name) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not exist cuz"
    
    end  
  end

  # this is a bad doc test
  # never assert the whole thing. Always assert the last critical line

  # @doc """
  #   This is the culmination of all the functions.
  #   This will create a deck, shuffle it and then deal a hand to you with `hand_size`

  #   ## Examples
  #     iex> Cards.create_hand(5)
  #     {["Jack of Hearts", "Eight of Hearts", "King of Spades", "Eight of Diamonds",
  #       "Ace of Clubs"],["Jack of Hearts", "Five of Hearts", "Queen of Hearts", "Jack of Clubs", "Seven of Diamonds", "King of Diamonds", "Ten of Clubs", "Ace of Hearts", "Seven of Spades", "Three of Hearts", "Two of Hearts", "King of Hearts", "Six of Clubs", "Ace of Diamonds", "Seven of Clubs", "King of Spades", "Nine of Spades", "Ace of Spades", "Eight of Spades", "Three of Spades", "Nine of Clubs", "King of Clubs", "Two of Spades", "Queen of Diamonds", "Three of Clubs", "Eight of Hearts", "Jack of Diamonds", "Two of Diamonds", "Four of Diamonds", "Ten of Diamonds", "Six of Spades", "Five of Clubs", "Nine of Diamonds", "Eight of Diamonds", "Seven of Hearts", "Queen of Clubs", "Three of Diamonds", "Ace of Clubs", "Four of Hearts", "Eight of Clubs", "Four of Spades", "Jack of Spades", "Five of Diamonds", "Six of Hearts", "Four of Clubs", "Ten of Spades", "Six of Diamonds"]}
  #   """

  def create_hand(hand_size) do
    Cards.create_deck |> Cards.shuffle |> Cards.deal(hand_size)
  end
end
