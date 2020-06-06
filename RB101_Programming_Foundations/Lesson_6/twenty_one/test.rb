def who_wins(player_total: nil, dealer_total: nil)
  if player_total && dealer_total
    difference = player_total - dealer_total

    if difference == 0 && player_total == 21 then retrun'tie'
    elsif difference <= 0 then 'dealer'
    else 'player'
    end
  end

  if player_total
    puts "Your final total is #{player_total}"
    return 'dealer' if player_total > 21
  end

  if dealer_total
    puts "Dealer's final total is #{dealer_total}"
    return 'player' if dealer_total > 21
  end

end


p who_wins(player_total: 17, dealer_total: 17)