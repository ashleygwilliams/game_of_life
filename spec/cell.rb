require "../lib/cell"


describe Cell, "#act" do

  context 'alive' do 
    let(:cell) {Cell.new(4,4)}

    it "should remain alive if it has 3 neighbors" do
      cell.alive = true
      cell.act(3)
      expect(cell.future).to be_true
    end

    it "should die if it has 4 neighbors" do
      cell.alive=true
      cell.act(4)
      expect(cell.future).to be_false
    end

    it "should die if it has 1 neighbor" do
      cell.alive=true
      cell.act(1)
      expect(cell.future).to be_false
    end
    
  end

  context 'dead' do 
    let(:cell) {Cell.new(4,4)}

    it "should become alive if it has 3 neighbors" do
      cell.act(3)
      expect(cell.future).to be_true
    end

    it "should stay dead if it has 4 neighbors" do
      cell.alive=true
      cell.act(4)
      expect(cell.future).to be_false
    end

    it "should stay dead if it has 1 neighbor" do
      cell.alive=true
      cell.act(1)
      expect(cell.future).to be_false
    end
    
  end

end