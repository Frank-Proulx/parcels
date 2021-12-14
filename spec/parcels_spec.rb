require 'rspec'
require 'parcels'

describe('Parcel') do
  p = Parcel.new(3,3,3,4,nil)
  it('should return 4 when p.weight called') do
    expect(p.weight).to(eq(4))
  end

  it('should return 1 when p.id called') do
    expect(p.id).to(eq(1))
  end

  describe('#save') do
    it('should return') do
    p1 = Parcel.new(3,3,2,4,nil)
    p1.save
    expect(Parcel.all).to(eq([p1]))
    end
  end
  
  describe('#update') do
    it('should return') do
      p2 = Parcel.new(3,2,3,4,nil)
      p2.save
      p2.update(3,3,4,5)
      p2.save
      expect(p2.weight).to(eq(5))
      expect(Parcel.find(3).weight).to(eq(5))
    end
  end
  
  describe('.clear') do
    it('should return [] for all') do
      p3 = Parcel.new(10,2,3,4,nil)
      p3.save
      Parcel.clear
      expect(Parcel.all).to(eq([]))
    end
  end

  describe('#volume') do
    it('should return 8 for 2 w 2 h 2 l') do
      Parcel.clear
      p = Parcel.new(2,2,2,88,nil)
      p.save
      expect(p.volume).to(eq(8))
    end
  end

  describe('#cost_to_ship') do
    it('should return 37 for 2w 2h 2l 4weight 5distance') do
      Parcel.clear
      p = Parcel.new(2,2,2,4, nil)
      p.save
      expect(p.cost_to_ship(5)).to(eq(37))
    end
  end

end