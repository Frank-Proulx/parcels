class Parcel
  attr_accessor(:weight, :h, :w, :l)
  attr_reader(:id)
  
  @@parcels = {}
  @@total_rows = 0
  
  def initialize(h,w,l,weight, id)
    @h = h
    @w = w
    @l = l
    @weight = weight
    @id = id || @@total_rows += 1
  end

  def self.all
    @@parcels.values()
  end

  def ==(parcel_to_compare)
    (self.h == parcel_to_compare.h) && (self.w == parcel_to_compare.w) && (self.l == parcel_to_compare.l) && (self.w == parcel_to_compare.w)
  end

  def save
    @@parcels[self.id] = Parcel.new(self.h,self.w,self.l,self.weight,self.id)
  end

  def self.find(id)
    @@parcels[id]
  end

  def update(h,w,l,weight)
    @h = h
    @w = w
    @l = l
    @weight = weight
  end

  def delete
    @@albums.delete(self.id)
  end
  
  def self.clear
    @@parcels = {}
    @@total_rows = 0
  end

  def volume
    @h * @w * @l
  end

  def cost_to_ship(distance)
    self.volume * @weight + distance
  end
end