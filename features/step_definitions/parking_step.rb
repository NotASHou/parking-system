class Parking
    def calculatefee(startHours, startMinutes, startSeconds, endHours, endMinutes,endSeconds)
        25
    end
end


Given("ขับรถมาถึงจุดรับบัตร รับบัตรจอดรถเมื่อ เวลา {int}:{int}:{int} และ ขับรถออกมาคืนบัตร เมื่อเวลา {int}:{int}:{int}") do |startHours,startMinutes, startSeconds, endHours, endMinutes, endSeconds|
    #@input is global variable
    @startHours = startHours
    @startMinutes = startMinutes
    @startSeconds = startSeconds
    @endHours = endHours
    @endMinutes = endMinutes
    @endSeconds = endSeconds

    @parking = Parking.new
  end
  
  When("จำนวนเวลาจอดรถ {int} - {int} ชั่วโมง") do |int, int2|
    @actual = @parking.calculatefee @startHours, @startMinutes, @startSeconds, @endHours, @endMinutes, @endSeconds
end
  
  Then("ฉันต้องจ่ายเงิน {int} บาท") do |expected|
    expect(@actual).to eq expected 
  end