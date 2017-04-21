class PhoneNumber
  def initialize(phone)
    @phone = filter(phone)
  end

  def number
    return invalid if @phone =~ /[a-zA-Z]+/
    if @phone.start_with?('1') && @phone.size == 11
      @phone[1..@phone.size]
    elsif @phone.size != 10
      invalid
    else
      @phone
    end
  end

  def area_code
    number[0..2]
  end

  def to_s
    chunks = /(\d{3})(\d{3})(\d{4})/.match(number)
    "(#{chunks[1]}) #{chunks[2]}-#{chunks[3]}"
  end

  private

  def filter(phone)
    phone.scan(/\w/).join('')
  end

  def invalid
    '0000000000'
  end
end
