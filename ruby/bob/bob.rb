class Bob

  def hey(remark)
    case 
    when remark == remark.upcase && remark != remark.downcase
      'Whoa, chill out!'
    when remark.end_with?('?')
      'Sure.'
    when remark =~ /\A\s*\z/
      "Fine. Be that way!"
    else
      'Whatever.'
    end
  end

end
