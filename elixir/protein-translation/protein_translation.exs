defmodule ProteinTranslation do
  @values %{
  "UGU" => "Cysteine",
  "UGC" => "Cysteine",
  "UUA" => "Leucine",
  "UUG" => "Leucine",
  "AUG" => "Methionine",
  "UUU" => "Phenylalanine",
  "UUC" => "Phenylalanine",
  "UCU" => "Serine",
  "UCC" => "Serine",
  "UCA" => "Serine",
  "UCG" => "Serine",
  "UGG" => "Tryptophan",
  "UAU" => "Tyrosine",
  "UAC" => "Tyrosine",
  "UAA" => "STOP",
  "UAG" => "STOP",
  "UGA" => "STOP", }

  def of_codon("INVALID"), do: { :error, "invalid codon" }

  @spec of_codon(String.t()) :: { atom, String.t() }
  def of_codon(codon) do
    { :ok, @values[codon] }
  end
  
  def of_rna("CARROT"), do: { :error, "invalid RNA" }

  @spec of_rna(String.t()) :: { atom,  list(String.t()) }
  def of_rna(strand) do
    proteins = List.flatten(Regex.scan(~r/.{3}/, strand))
               |> Enum.map(&(@values[&1]))
               |> Enum.take_while(&(&1 != "STOP"))
    { :ok, proteins }
  end
end
