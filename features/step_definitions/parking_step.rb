require 'date'
require 'time'
class Parking
    def calculatefee(startDate, endDate)
        puts  (startDate)  
        puts (endDate)
        mytime = (endDate - startDate) / 3600;
        puts(mytime)
        if(mytime <= 1)
            25
        elsif(mytime <= 2) 
            50
        elsif(mytime <= 3)
            80
        elsif(mytime <= 4)
            110
        elsif(mytime <= 5)
            145
        elsif(mytime <= 6)
            180
        elsif(mytime > 6)
            250
        end
    end
end

Given("ขับรถมาถึงจุดรับบัตร รับบัตรจอดรถ เมื่อเวลา {string} และ ขับรถออกมาคืนบัตร เมื่อเวลา {string}") do |startDateTime, endDateTime|
    #@input is global variable
    @startDate = Time.parse(startDateTime);
    @endDate =Time.parse(endDateTime);

    @parking = Parking.new
  end
  
  When("จำนวนเวลาจอดรถ {int} - {int} ชั่วโมง") do |int, int2|
    @actual = @parking.calculatefee @startDate, @endDate
end
  
  Then("ฉันต้องจ่ายเงิน {int} บาท") do |expected|
    expect(@actual).to eq expected 
  end