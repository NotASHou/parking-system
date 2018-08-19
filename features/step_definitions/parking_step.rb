class Parking
    def calculatefee(startHours, startMinutes, startSeconds, endHours, endMinutes,endSeconds)
        startTime = (startHours * 60 * 60) + (startMinutes * 60) + startSeconds;
        endTime = (endHours * 60 * 60) + (endMinutes * 60) + endSeconds;
        if(endTime - startTime <= 60*60)
            25
        elsif(endTime - startTime <= 2 *60*60) 
            50
        elsif(endTime - startTime <= 3 *60*60)
            80 
        end
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