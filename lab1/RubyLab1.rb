class ComplexNumber
    @real
    @img
    @@add_stats = 0
    @@multi_stats = 0

    attr_accessor :real, :img

    def initialize real=0, img=0
        @real = real
        @img = img
    end

    def +(cn)
        cnum = ComplexNumber.new
        cnum.real = @real + cn.real
        cnum.img = @img + cn.img
        @@add_stats += 1
        cnum
    end

    def *(cn)
        cnum = ComplexNumber.new
        cnum.real = (@real*cn.real) - (@img*cn.img)
        cnum.img = (@real*cn.real) + (@img*cn.img)
        @@multi_stats += 1
        cnum
    end

    def self.bulk_add(cn_ar)
        cnum = ComplexNumber.new
        cn_ar.each {|cn| 
            cnum = cnum + cn
        }
        cnum
    end

    def self.bulk_multi(cn_ar)
        cnum = ComplexNumber.new(1,1)
        cn_ar.each {|cn|
            cnum = cnum*cn
        }
        cnum
    end

    def self.get_stats
        {addStats: @@add_stats, 
         multiStats: @@multi_stats}
    end
end

cn1 = ComplexNumber.new(1,5)
cn2 = ComplexNumber.new(2,7)
cn3 = ComplexNumber.new(2,8)
cn_ar = [cn1, cn2, cn3]

# cn1 = cn2+cn3
# puts cn1.real
# puts cn1.img

# cn1 = cn2*cn3
# puts cn1.real
# puts cn1.img

# cn4 = ComplexNumber.bulk_add(cn_ar)
# puts cn4.real
# puts cn4.img

# cn5 = ComplexNumber.bulk_multi(cn_ar)
# puts cn5.img

stats = ComplexNumber.get_stats
puts stats

