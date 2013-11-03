require 'spec_helper'

describe NewSudoku do

  describe "#initialize" do

    let(:sudoku) { NewSudoku.new('222') }


    it "returns a new sudoku object" do
      expect(sudoku).to be_an_instance_of NewSudoku
    end

    it "errors on incorrect number of parameters" do
      expect { NewSudoku.new }.to raise_exception ArgumentError
    end

    it "converts 'numbers' string into array" do
      numbers = '222'
      @numbers = numbers.split('')
      expect(@numbers).to eq ["2", "2", "2"]
    end

    it "calls the #solve method" do

    end
  end


  describe "#row" do

  end
end
